from app import hello
from app import extract_sentiment
from app import text_contain_word
from app import bubblesort
import pytest


# def test_hello():
#     got = hello("Aleksandra")
#     want = "Hello Aleksandra"

#     assert got == want

# testdata = ["I think today will be a great day","I do not think this will turn out well"]
# testdata1 = ["I think today will be a great day"]
# # testdata2 = ["I do not think this will turn out well"]

# @pytest.mark.parametrize('sample', testdata1)
# def test_extract_sentiment(sample):

#     sentiment = extract_sentiment(sample)

#     assert sentiment > 0

# testdata2 = [
#     ('There is a duck in this text', 'duck', True),
#     ('There is nothing here', 'duck', False)
#     ]

# @pytest.mark.parametrize('sample, word, expected_output', testdata2)
# def test_text_contain_word(sample, word, expected_output):

#     assert text_contain_word(word, sample) == expected_output

testdata3 = [
    ([2, 5, 7, 1, 9, 0, 3, 8, 6, 4], [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
    ([3, 8, 5, 1], [1, 3, 5, 8]),
    ([9, 8, 7, 6, 5, 4, 3, 2, 1], [1, 2, 3, 4, 5, 6, 7, 8, 9]),
    ([1, 4, 6, 9], [1, 4, 6, 9]),
    (5, None)
]

@pytest.mark.parametrize('sample, expected_output', testdata3)
def test_bubblesort(sample, expected_output):
    assert bubblesort(sample) == expected_output
