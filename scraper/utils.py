import json

def save_to_file(data, filename):
    with open(filename, 'w') as file:
        json.dump(data, file)
