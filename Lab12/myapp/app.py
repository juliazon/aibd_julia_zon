from typing import List, Tuple
from textblob import TextBlob

def hello(name):
    output = f'Hello {name}'
    return output

def extract_sentiment(text):
    text = TextBlob(text)

    return text.sentiment.polarity

def text_contain_word(word: str, text: str):
    return word in text

def bubblesort(input_array):
    if not isinstance(input_array, List):
        return None
    n: int = len(input_array)
    m: int = 0
    change: bool = True
    new_array: List[int] = input_array[:]

    while (n > 1) and change:
        change = False
        for i in range(1, n):
            m += 1
            if new_array[i - 1] > new_array[i]:
                new_array[i - 1], new_array[i] = new_array[i], new_array[i - 1]
                change = True

        n -= 1

    return new_array