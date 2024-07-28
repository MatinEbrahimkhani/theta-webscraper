import requests
from bs4 import BeautifulSoup

def fetch_page(url):
    response = requests.get(url)
    response.raise_for_status()
    return response.text

def parse_page(content):
    soup = BeautifulSoup(content, 'html.parser')
    return soup

def extract_data(soup):
    # Customize this function based on what data you want to extract
    title = soup.find('title').get_text()
    return {'title': title}

def scrape(url):
    page_content = fetch_page(url)
    soup = parse_page(page_content)
    data = extract_data(soup)
    return data
