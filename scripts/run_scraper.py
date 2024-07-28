from scraper.core import scrape
from scraper.utils import save_to_file
from scraper.config import URL, OUTPUT_FILE

def main():
    data = scrape(URL)
    save_to_file(data, OUTPUT_FILE)
    print(f"Data saved to {OUTPUT_FILE}")

if __name__ == "__main__":
    main()
