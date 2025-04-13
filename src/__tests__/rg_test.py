from rg_wrapper import rg
import unittest
import os

HERE = os.path.dirname(os.path.abspath(__file__))


class RgTest(unittest.TestCase):
    def test_gen_candidates(self):
        dir = os.path.join(HERE, "test_data")
        (result, code) = rg.gen_candidates(dir)
        self.assertEqual(code, 0)
        # self.assertTrue('example.smali' in result)
        # self.assertTrue('kotlinx.smali' not in result)


if __name__ == '__main__':
    unittest.main()
