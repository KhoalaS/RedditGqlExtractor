import re
from typing import Iterable


def get_fields_lines(file_content: str) -> Iterable[str]:

    r = re.compile('# instance fields.+?#', re.DOTALL)

    findings = r.findall(file_content)
    if len(findings) == 0:
        return []
    r = re.compile('\\.field.+?\\n', re.DOTALL)

    m = r.findall(str(findings[0]))
    field_lines = [str(x).strip() for x in m]
    return field_lines


def transform_field_line(line: str) -> tuple[str, str] | None:
    spl = line.split()[-1].split(':')
    if len(spl) < 2:
        return None
    return (spl[0], spl[1])


def get_field_access(lines: list[str]) -> tuple[str, list[str]]:
    class_name = ''
    fields: list[str] = []

    flag = False

    to_string_regex = re.compile('method public (final )?toString')

    for line in lines:
        if line.startswith('.class'):
            class_name = line.split()[-1]

        if re.search(to_string_regex, line) is not None:
            flag = True

        if not flag:
            continue

        if line.strip().startswith('iget'):
            r = re.compile(f'{re.escape(class_name)}->(.+?):')
            m = r.findall(line)
            if len(m) == 0:
                continue

            fields.append(str(m[0]))

    return class_name, fields


def get_strings(lines: list[str]) -> str:
    flag = False

    r = re.compile('const-string.+?\\"(.*?)\\"', re.DOTALL)

    to_string_regex = re.compile('method public (final )?toString')

    s: str = ''
    for line in lines:
        if re.search(to_string_regex, line) is not None:
            flag = True

        if not flag:
            continue

        if 'const-string' in line:
            m = r.findall(line)
            if len(m) == 0:
                continue
            s += str(m[0])

    return s


def extract_types(full_string: str) -> tuple[str, list[list[str]]] | None:
    r = re.compile('(.+?)\\((.+?)\\)')

    m = r.findall(full_string)

    if len(m) == 0:
        return None

    if len(m[0]) == 0:
        return None

    # m[0][1] should look like this 'id=, displayName=default'

    spl = str(m[0][1]).split(',')

    fields = [p.strip().split('=') for p in spl]

    return str(m[0][0]), fields
