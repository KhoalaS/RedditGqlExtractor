import argparse
import json
from utils import helpers, candidates, enums
from tqdm import tqdm
import logging

logger = logging.getLogger(__name__)
logging.basicConfig(filename='extractor.log',
                    encoding='utf-8', level=logging.DEBUG)

parser = argparse.ArgumentParser(
    prog='RedditGQL Type Extractor',
    description='Extract GQL Types from a decompiled Reddit APK.')

parser.add_argument('-c', '--candidates',
                    help='Path to the candidates file.')
parser.add_argument('-e', '--enums',
                    help='Path to the enum candidates file.')
parser.add_argument('-o', '--outfile', default='./schema.graphqls',
                    help='Path to the output file.')

args = parser.parse_args()

files = [line.strip() for line in open(args.candidates, 'r').readlines()
         ] if args.candidates is not None else candidates.get_candidates()

enum_files = open(args.enums, 'r').readlines()

# maps a obfuscated classname to a typedef dict
class_mapping: list[dict[str, str | dict[str, str | None]]] = []
enum_mapping: dict[str, list[str]] = {}
enum_name_mapping: dict[str, str] = {}

java_mapping = {
    "Ljava/lang/Integer;": "Int",
    "Ljava/lang/String;": "String",
    "Ljava/lang/Boolean;": "Boolean",
    "Ljava/util/List;": "[Unknown]",
    "Ljava/lang/Long;": "Int",
    "Ljava/lang/Double;": "Float",
    "Ljava/lang/Float;": "Float",
    "Ljava/util/ArrayList;": "[Unknown]",
    "C": "String",
    "D": "Float",
    "F": "Float",
    "I": "Int",
    "J": "Int",
    "Z": "Boolean",
}

type_mapping: dict[str, str] = {}

for file in tqdm(iterable=enum_files, desc='extract enums'):
    lines = open(file.strip(), 'r').readlines()

    enum_name = enums.get_enum_name(lines[0])

    if enum_name is not None:
        short_name = enum_name.split('/')[-1].rstrip(';')
        enum_name_mapping.update({enum_name: short_name})

        enum_values = enums.extract_enum_values(lines)
        enum_mapping.update({enum_name: enum_values})
        logger.debug(f'found enum: {enum_name}')

for filename in tqdm(iterable=files, desc='generate type mapping'):
    lines = open(filename, 'r').readlines()

    # 'LmB/hW;', ['a', 'b'])
    (obf_class_name, field_accesses) = helpers.get_field_access(lines)

    # ('TaxonomyTopic1', [['id', ''], ['displayName', 'default']])
    ex = helpers.extract_types(helpers.get_strings(lines))
    if ex is None:
        continue

    type_mapping.update({obf_class_name: ex[0]})

for filename in tqdm(iterable=files, desc='extract types'):
    lines = open(filename.strip(), 'r').readlines()
    content = ''.join(lines)

    # extract the field lines: '.field public final b:Ljava/lang/String;'
    field_lines = helpers.get_fields_lines(content)

    fields: dict[str, str] = {}

    # extract the obfuscated name of the field and type
    # ('a', 'Ljava/lang/String;')
    for f_line in field_lines:
        tr_line = helpers.transform_field_line(f_line)
        if tr_line is None:
            logger.debug(
                f'error tranforming line {f_line} in {filename.strip()}')
            continue

        (field_name, field_type) = tr_line
        fields.update({field_name: field_type})
    # 'LmB/hW;', ['a', 'b'])
    (obf_class_name, field_accesses) = helpers.get_field_access(lines)

    # ('TaxonomyTopic1', [['id', ''], ['displayName', 'default']])
    ex = helpers.extract_types(helpers.get_strings(lines))
    if ex is None:
        continue

    (class_name, extracted_types) = ex

    # zip up field access with extracted types
    # (('a', ['id', '']), ('b', ['displayName', '']))
    z = zip(field_accesses, extracted_types)

    type_def: dict[str, str | None] = {}

    for entry in z:
        _field_type = fields.get(entry[0])
        if _field_type is None:
            logger.debug(f'accessed field {entry[0]} is not a field of class')
            continue

        java_type = java_mapping.get(_field_type)
        _type = java_type if java_type is not None else type_mapping.get(
            _field_type)

        # test if field is an enum
        if _type is None:
            _type = enum_name_mapping.get(_field_type)
        if _type is None:
            logger.debug(f'unknown type of field: {_field_type}')
            _type = 'Unknown'
        type_def.update({entry[1][0]: _type})

    type_dict: dict[str, str | dict[str, str | None]] = {
        'file_name': filename.replace('\\', '/').strip(),
        'class_name': class_name,
        'types': type_def
    }

    class_mapping.append(type_dict)

out = open(args.outfile, 'w+')
out.write(json.dumps(class_mapping))

enum_out = open('enums.json', 'w+')
enum_out.write(json.dumps(enum_mapping))

enum_out.close
out.close()
