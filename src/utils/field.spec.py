import utils
import unittest

test_file = './src/test/example.smali'


class FieldTest(unittest.TestCase):
    def test_get_fields(self):
        self.assertEqual(
            utils.get_fields(test_file), set(['.field public final b:Ljava/lang/String;',
                                              '.field public final a:Ljava/lang/String;'])
        )

    def test_transform_field(self):
        self.assertEqual(utils.transform_field_line(
            '.field public final a:Ljava/lang/String;'), ('a', 'Ljava/lang/String;'))

    def test_get_field_access(self):
        self.assertEqual(utils.get_field_access(test_file), ('LmB/hW;',['a', 'b']))

    def test_get_string(self):
        self.assertEqual(utils.get_strings(test_file), '')

if __name__ == '__main__':
    unittest.main()
