import requests

def test_external_ping():
    resp = requests.get("https://httpbin.org/get", timeout=5)
    assert resp.status_code == 200