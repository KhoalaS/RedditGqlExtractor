import unittest
from utils import candidates
import os


class CandidatesTest(unittest.TestCase):
    def test_find_smali_files(self):
        self.assertEqual(
            set([file for file in candidates.get_candidates()]),
            set([
                os.path.join('.', 'src', '__tests__',
                             'test_data', 'example.smali'),
                os.path.join('.', 'src', '__tests__',
                             'test_data', 'example_2.smali'),
                os.path.join('.', 'src', '__tests__',
                             'test_data', 'example_3.smali'),
            ]))
