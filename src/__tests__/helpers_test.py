from utils import helpers
import unittest
import os

HERE = os.path.dirname(os.path.abspath(__file__))
filepath = os.path.join(HERE, "test_data", "example.smali")

test_file = open(filepath, 'r')
lines = test_file.readlines()
content = ''.join(lines)


class FieldTest(unittest.TestCase):
    def test_get_fields(self):
        self.assertEqual(
            helpers.get_fields_lines(content), set([
                '.field public final b:Ljava/lang/String;',
                '.field public final a:Ljava/lang/String;'])
        )

    def test_transform_field(self):
        self.assertEqual(helpers.transform_field_line(
            '.field public final a:Ljava/lang/String;'),
            ('a', 'Ljava/lang/String;'))

    def test_get_field_access(self):
        self.assertEqual(helpers.get_field_access(
            lines), ('LmB/hW;', ['a', 'b']))

    def test_get_string(self):
        self.assertEqual(helpers.get_strings(lines),
                         'TaxonomyTopic1(id=, displayName=)')

    def test_extract_types(self):
        self.assertEqual(helpers.extract_types(
            'TaxonomyTopic1(id=, displayName=default)'),
            ('TaxonomyTopic1', [['id', ''], ['displayName', 'default']]))


if __name__ == '__main__':
    unittest.main()
