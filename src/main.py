from utils import helpers

files = open('./src/__tests__/test_data/candidates.txt', 'r')
out = open('./out/schema.graphqls', 'w+')

# maps a obfuscated classname to a typedef dict
class_mapping: dict[str, dict[str, str]]

java_mapping = {
    "Ljava/lang/Integer;": "Int",
    "Ljava/lang/String;": "String",
    "Ljava/lang/Boolean;": "Boolean",
    "Ljava/util/List;": "[Unknown]",
    "Ljava/lang/Long;": "Int",
    "Ljava/util/ArrayList;": "[Unknown]",
    "Z": "Boolean",
    "J": "Int",
    "D": "Float"
}

for filename in files:
    f = open(filename, 'r')

    # extract the field lines: '.field public final b:Ljava/lang/String;'
    field_lines = helpers.get_fields_lines(f)

    fields: dict[str, str] = {}

    # extract the obfuscated name of the field and type
    # ('a', 'Ljava/lang/String;')
    for f_line in field_lines:
        (field_name, field_type) = helpers.transform_field_line(f_line)
        fields.update({field_name: field_type})
    # 'LmB/hW;', ['a', 'b'])
    (obf_class_name, field_accesses) = helpers.get_field_access(f)

    # ('TaxonomyTopic1', [['id', ''], ['displayName', 'default']])
    ex = helpers.extract_types(helpers.get_strings(f))
    if ex is None:
        continue

    (class_name, extracted_types) = ex

    z = zip(field_accesses, extracted_types)

    print(tuple(z))
