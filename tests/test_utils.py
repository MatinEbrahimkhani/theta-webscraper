import json
import os
from scraper.utils import save_to_file

def test_save_to_file():
    data = {'test': 'data'}
    filename = 'test_output.json'
    save_to_file(data, filename)

    with open(filename, 'r') as file:
        loaded_data = json.load(file)

    assert loaded_data == data
    os.remove(filename)
