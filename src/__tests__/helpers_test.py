from utils import helpers
import unittest
import os

HERE = os.path.dirname(os.path.abspath(__file__))
filepath = os.path.join(HERE, "test_data", "example.smali")
filepath_2 = os.path.join(HERE, "test_data", "example_2.smali")
filepath_3 = os.path.join(HERE, "test_data", "example_3.smali")

test_file = open(filepath, 'r')
test_file_2 = open(filepath_2, 'r')
test_file_3 = open(filepath_3, 'r')

lines = test_file.readlines()
lines_2 = test_file_2.readlines()
lines_3 = test_file_3.readlines()

content = ''.join(lines)
content_2 = ''.join(lines_2)
content_3 = ''.join(lines_3)

test_file.close()
test_file_2.close()
test_file_3.close()


class HelpersTest(unittest.TestCase):
    def test_get_fields(self):
        self.assertEqual(
            helpers.get_fields_lines(content), [
                '.field public final a:Ljava/lang/String;',
                '.field public final b:Ljava/lang/String;']
        )

        self.assertEqual(
            helpers.get_fields_lines(content_2), [
                '.field private final choiceMetadata:LKL/a;',
                '.field private final claimData:LKL/b;',
                '.field private final dropUiModels:Ljava/util/List;',
                '.field private final initialPosition:I'
            ]
        )

        self.assertEqual(
            helpers.get_fields_lines(content_3), [
                '.field public final a:Lcom/reddit/onboardingfeedcomponents/taxonomytopics/impl/data/model/TaxonomyTopic;',  # noqa
                '.field public final b:I'
            ]
        )

    def test_transform_field(self):
        self.assertEqual(helpers.transform_field_line(
            '.field public final a:Ljava/lang/String;'),
            ('a', 'Ljava/lang/String;'))
        self.assertEqual(helpers.transform_field_line(
            '.field public final b:I'),
            ('b', 'I'))

    def test_get_field_access(self):
        self.assertEqual(helpers.get_field_access(
            lines), ('LmB/hW;', ['a', 'b']))
        self.assertEqual(helpers.get_field_access(
            lines_3), ('Lcom/reddit/onboardingfeedcomponents/taxonomytopics/impl/feed/events/d;', ['a', 'b']))  # noqa

    def test_get_string(self):
        self.assertEqual(helpers.get_strings(lines),
                         'TaxonomyTopic1(id=, displayName=)')
        self.assertEqual(helpers.get_strings(lines_3),
                         'TaxonomyFeedTopicViewEvent(topic=, index=)')

    def test_extract_types(self):
        self.assertEqual(helpers.extract_types(
            'TaxonomyTopic1(id=, displayName=default)'),
            ('TaxonomyTopic1', [['id', ''], ['displayName', 'default']]))


if __name__ == '__main__':
    unittest.main()
