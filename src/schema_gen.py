import json

f = open('./out.json', 'r')

out = open('./schema.graphqls', 'w+')

file_mapping = {}

types: dict = json.loads(f.read())

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

unknown_types = {}

for [k, v] in types.items():
    val = list(v)[0]
    file_mapping.update({'L' + ('/'.join(k.split('/')[1:]))[:-6] + ';': val})

for [k, v] in types.items():

    for [type_name, types] in v.items():
        out.write(f'type {type_name}')
        out.write(' {\n')

        for [field, type] in types.items():
            mapped_type = ''
            if java_mapping.get(type) != None:
                mapped_type = java_mapping.get(type)

            if file_mapping.get(type) != None:
                mapped_type = file_mapping.get(type)

            # could not find a type for the class
            if mapped_type == '':
                if str(type).startswith('Lcom/reddit/type/'):
                    mapped_type = (str(type).split('/')[-1])[0:-1]
                else:
                    mapped_type = 'Unknown'
                    if unknown_types.get(type) != None:
                        unknown_types.update({type: unknown_types.get(type)+1})
                    else:
                        unknown_types.update({type: 1})

            out.write(f'\t{field}: {mapped_type}\n')

        out.write('}\n')

out.write('type Unknown\n')

unknown_file = open('unknown_types.json', 'w+')
unknown_file.write(json.dumps(unknown_types))