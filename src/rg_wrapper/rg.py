import subprocess
import os


def gen_candidates(working_dir: str = os.getcwd()) -> tuple[list[str], int]:

    p1 = subprocess.Popen(["rg", "-l", "method public (final)? hashCode"],
                          stdout=subprocess.PIPE,
                          cwd=working_dir)

    p2 = subprocess.Popen(
        ["rg", "-v",
         "kotlinx|androidx|okhttp|bitdrift|airbnb|google|facebook"],
        stdin=p1.stdout,
        stdout=subprocess.PIPE,
        text=True,
        cwd=working_dir)

    output, error = p2.communicate()
    p1.terminate

    code = 0 if error is None else 1

    return output.split('\n')[:-1], code
