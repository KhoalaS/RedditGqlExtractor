import subprocess
import platform
import os
import shutil


def gen_candidates(working_dir: str = os.getcwd()) -> tuple[list[str], int]:

    os_name = platform.uname().system
    program_name = 'rg'
    if os_name == 'Linux':
        rg_path = shutil.which('rg')
        if rg_path is not None:
            program_name = rg_path

    p1 = subprocess.run([program_name,
                         "-l", "method public (final)? hashCode"],
                        text=True,
                        capture_output=True,
                        cwd=working_dir)

    if p1.returncode != 0:
        print(
            f'error during gen_candidates phase 1: {p1.stdout, p1.stderr}')

    p2 = subprocess.run(
        [program_name, "-v",
         "kotlinx|androidx|okhttp|bitdrift|airbnb|google|facebook"],
        input=p1.stdout,
        capture_output=True,
        text=True,
        cwd=working_dir)

    if p2.returncode != 0:
        print(
            f'error during gen_candidates phase 2: {p2.stdout, p2.stderr}')

    return p2.stdout.split('\n')[:-1], p2.returncode
