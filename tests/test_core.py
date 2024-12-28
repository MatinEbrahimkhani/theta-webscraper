import pytest
from scraper.core import fetch_page, parse_page, extract_data

def test_fetch_page():
    url = 'https://example.com'
    content = fetch_page(url)
    assert 'Example Domain' in content

def test_parse_page():
    content = '<html><head><title>Test</title></head><body></body></html>'
    soup = parse_page(content)
    assert soup.title.string == 'Test'

def test_extract_data():
    content = '<html><head><title>Test</title></head><body></body></html>'
    soup = parse_page(content)
    data = extract_data(soup)
    assert data['title'] == 'Test'
