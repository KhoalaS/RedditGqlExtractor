import unittest
from utils import enums
import os

HERE = os.path.dirname(os.path.abspath(__file__))

filepath = os.path.join(HERE, "test_data", "enum.smali")
test_file = open(filepath, 'r')
lines = test_file.readlines()
content = ''.join(lines)
test_file.close()


class EnumsTest(unittest.TestCase):
    def test_is_enum_file(self):
        self.assertEqual(enums.get_enum_name(
            '.class public final enum Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;\n'),  # noqa
            'Lcom/reddit/mod/temporaryevents/models/TemporaryEventFields$TempEventBoolean;'  # noqa
            )

    def test_extract_enum_values(self):
        self.assertEqual(enums.extract_enum_values(
            lines), ['FALSE', 'NONE', 'TRUE'])


if __name__ == '__main__':
    unittest.main()
