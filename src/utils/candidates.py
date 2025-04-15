import os
import re


def find_smali_files(root_dir):
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith(".smali"):
                yield os.path.join(dirpath, filename)


def filter_hashcode(filepath: str) -> bool:
    pattern = re.compile(r"method public (final )?hashCode")
    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        if pattern.search(f.read()):
            return True
    return False


def filter_libs(filepath: str) -> bool:
    pattern = re.compile(
        r"(kotlinx|androidx|okhttp|bitdrift|airbnb|google|facebook)")

    return pattern.search(filepath) is None


def get_candidates() -> list[str]:
    return [x for x in [file for file in find_smali_files('.')
                        if filter_hashcode(file)] if filter_libs(x)]
