from io import TextIOWrapper
import re


def get_fields(file: TextIOWrapper):
    file.seek(0)

    r = re.compile('# instance fields.+?#', re.DOTALL)

    findings = r.findall(file.read())
    if len(findings) == 0:
        return []

    m = str(findings[0]).strip()
    field_lines = set((m.split("\n")[1:-1]))
    field_lines.remove('')

    return field_lines


def transform_field_line(line: str):
    spl = line.split()[-1].split(':')
    return (spl[0], spl[1])


def get_field_access(file: TextIOWrapper):
    file.seek(0)

    class_name = ''
    fields = []

    flag = False

    for line in file:
        if line.startswith('.class'):
            class_name = line.split()[-1]

        if line.startswith('.method public final toString()Ljava/lang/String;'):
            flag = True

        if not flag:
            continue

        if 'iget-' in line:
            r = re.compile(f'{class_name}->(.+?):')
            m = r.findall(line)
            if m == None:
                print(f'field access from foreign class: {class_name}')
                continue

            fields.append(m[0])

    return class_name, fields


def get_strings(file: TextIOWrapper):
    file.seek(0)

    flag = False

    r = re.compile('const-string.+?\\"(.*?)\\"', re.DOTALL)

    s = ''
    for line in file:
        if line.startswith('.method public final toString()Ljava/lang/String;'):
            flag = True

        if not flag:
            continue

        if 'const-string' in line:
            m = r.findall(line)
            if m == None:
                print(f'could not extract string content {line}')
                continue
            s += m[0]

    return s


def extract_types(full_string: str):
    r = re.compile('(.+?)\((.+?)\)')

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

    return m[0][0], fields
