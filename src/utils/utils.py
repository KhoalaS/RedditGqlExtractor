import re


def get_fields(filename: str):
    f = open(filename, 'r')
    r = re.compile('# instance fields.+?#', re.DOTALL)

    findings = r.findall(f.read())
    if len(findings) == 0:
        return []

    m = str(findings[0]).strip()
    field_lines = set((m.split("\n")[1:-1]))
    field_lines.remove('')

    f.close()
    return field_lines


def transform_field_line(line: str):
    spl = line.split()[-1].split(':')
    return (spl[0], spl[1])


def get_field_access(filename: str):
    f = open(filename, 'r')
    class_name = ''
    fields = []

    flag = False

    for line in f:
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

    f.close()
    return class_name, fields


def get_strings(filename: str):
    f = open(filename, 'r')

    flag = False

    r = re.compile('const-string.+?\\"(.*?)\\"', re.DOTALL)

    s = ''
    for line in f:
        if line.startswith('.method public final toString()Ljava/lang/String;'):
            flag = True

        if not flag:
            continue

        if 'const-string' in line:
            m = r.match(line)
            if m == None:
                print(f'could not extract string content {line}')
                continue
            s += m[0]

    f.close()

    print(s)

    return s
