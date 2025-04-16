import re

enum_regex = re.compile(r'\.field public static final enum (.+?):(.+)')
enum_class_regex = re.compile(r'\.class public final enum Lcom/reddit')


def get_enum_name(first_line: str) -> str | None:
    m = enum_class_regex.search(first_line)
    if m is not None:
        return first_line.strip().split()[-1]

    return None


def extract_enum_values(lines: list[str]) -> list[str]:
    values: list[str] = []
    for line in lines:
        n_line = line.strip()
        m = enum_regex.findall(n_line)
        if len(m) > 0:
            values.append(m[0][0])

    return values
