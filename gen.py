import argparse
from io import TextIOWrapper
import re
import json


def extract_type(types: dict, f: TextIOWrapper, filename: str):
    start = False
    fieldAccess = False
    current_field = ''
    current_type = None
    fields = {}

    for line in f:
        if not start and line.strip().startswith(".method public final toString"):
            start = True

        if start:
            if fieldAccess:
                if line.strip().startswith('iget-'):
                    fields.update({current_field: line.strip().split(':')[1]})
                    fieldAccess = False
                pass
            else:
                if line.strip().startswith('const-string v1'):
                    match = re.findall('\"(.+)\"', line)
                    content: str = match[0].strip(' ,=')
                    if content == ')':
                        break
                    if content.find('(') != -1:
                        [type_name, field_name] = content.split('(')
                        current_field = field_name
                        current_type = type_name
                    else:
                        current_field = content
                    fieldAccess = True
                pass

    return current_type, fields


parser = argparse.ArgumentParser(
    prog='Reddit GQL Extractor',
    description='Extraxts GQL Types from a decompiled Reddit APK.')

parser.add_argument(
    'candidates', help='Text file with paths to smali files that should be checked.')
args = parser.parse_args()

c = open(args.candidates, 'r')

types = {}
for file in c:
    s = open(file.strip(), 'r')
    current_type, fields = extract_type(types, s, file.strip())
    if current_type != None:
        types.update({file.strip(): {current_type: fields}})

o = open('out.json', 'w+')
o.write(json.dumps(types))
