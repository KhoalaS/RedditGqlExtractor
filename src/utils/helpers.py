import re
from typing import Iterable


def get_fields_lines(file_content: str) -> Iterable[str]:

    r = re.compile('# instance fields.+?#', re.DOTALL)

    findings = r.findall(file_content)
    if len(findings) == 0:
        return []
    r = re.compile('\\.field.+?\\n', re.DOTALL)

    m = r.findall(str(findings[0]))
    field_lines = set([str(x).strip() for x in m])
    return field_lines


def transform_field_line(line: str) -> tuple[str, str] | None:
    spl = line.split()[-1].split(':')
    if len(spl) < 2:
        print(f'could not transform line {line}')
        return None
    return (spl[0], spl[1])


def get_field_access(lines: list[str]) -> tuple[str, list[str]]:
    class_name = ''
    fields: list[str] = []

    flag = False

    for line in lines:
        if line.startswith('.class'):
            class_name = line.split()[-1]

        if line.startswith(
            '.method public final toString()Ljava/lang/String;'
        ):
            flag = True

        if not flag:
            continue

        if 'iget-' in line:
            r = re.compile(f'{class_name}->(.+?):')
            m = r.findall(line)
            if len(m) == 0:
                print(f'field access from foreign class: {class_name}')
                continue

            fields.append(str(m[0]))

    return class_name, fields


def get_strings(lines: list[str]) -> str:
    flag = False

    r = re.compile('const-string.+?\\"(.*?)\\"', re.DOTALL)

    s: str = ''
    for line in lines:
        if line.startswith(
            '.method public final toString()Ljava/lang/String;'
        ):
            flag = True

        if not flag:
            continue

        if 'const-string' in line:
            m = r.findall(line)
            if len(m) == 0:
                print(f'could not extract string content {line}')
                continue
            s += str(m[0])

    return s


def extract_types(full_string: str) -> tuple[str, list[list[str]]] | None:
    r = re.compile('(.+?)\\((.+?)\\)')

    m = r.findall(full_string)

    if len(m) == 0:
        print(f'could not extract types for: {full_string}')
        return None

    if len(m[0]) == 0:
        print(f'could not extract types for: {full_string}')
        return None

    # m[0][1] should look like this 'id=, displayName=default'

    spl = str(m[0][1]).split(',')

    fields = [p.strip().split('=') for p in spl]

    return str(m[0][0]), fields
