import unittest
from utils import candidates


class CandidatesTest(unittest.TestCase):
    def test_find_smali_files(self):
        self.assertEqual(
            set([file for file in candidates.get_candidates()]),
            set(['.\\src\\__tests__\\test_data\\example.smali',
                '.\\src\\__tests__\\test_data\\example_2.smali']))
