import requests
from urllib.parse import urlparse, parse_qs

def get_report_id_from_url(original_url):
    # Send request to the original URL
    response = requests.get(original_url)

    # Get the redirected URL
    redirected_url = response.url

    # Parse the redirected URL
    parsed_url = urlparse(redirected_url)
    query_params = parse_qs(parsed_url.query)

    # Extract the report ID
    report_id = query_params.get('ReportId', [None])[0]

    return report_id

def fetch_report(report_id):
    # Define the URL for the API endpoint
    api_url = "https://tm-player-activities.azurewebsites.net/api/reports/getreport"

    # Define the headers as seen in the network tab
    headers = {
        "Accept": "*/*",
        "Accept-Encoding": "gzip, deflate, br, zstd",
        "Accept-Language": "en-US,en;q=0.9",
        "Connection": "keep-alive",
        "Content-Type": "application/json",
        "Origin": "https://web-dynamic-reports.azurewebsites.net",
        "Referer": "https://web-dynamic-reports.azurewebsites.net/",
        "Sec-CH-UA": '"Not)A;Brand";v="99", "Google Chrome";v="127", "Chromium";v="127"',
        "Sec-CH-UA-Mobile": "?0",
        "Sec-CH-UA-Platform": '"Windows"',
        "Sec-Fetch-Dest": "empty",
        "Sec-Fetch-Mode": "cors",
        "Sec-Fetch-Site": "cross-site",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
    }

    # Define the payload data for the POST request
    payload = {
        "ReportId": report_id  # Use the actual Report ID
    }

    # Make the POST request to fetch the report
    response = requests.post(api_url, headers=headers, json=payload)

    # Check if the request was successful
    if response.status_code == 200:
        report_data = response.json()
        print("Report fetched successfully!")
        # Print or process the report data here
        print(report_data)
    else:
        print(f"Failed to fetch report: {response.status_code} - {response.text}")

# Original URL
original_url = 'http://mail2.trackman.com/track/click/10654379/mytrackman.com?p=eyJzIjoiTTVjNXRuX2xEek1IOHp1dEdpNEs1bHJGc0dnIiwidiI6MSwicCI6IntcInVcIjoxMDY1NDM3OSxcInZcIjoxLFwidXJsXCI6XCJodHRwczpcXFwvXFxcL215dHJhY2ttYW4uY29tXFxcL0R5bmFtaWNSZXBvcnQ_UmVwb3J0SWQ9ZDE4ZmE1NGUtNTc1NS1lZjExLWEwNmEtZTQwZDM2N2M2OWU2XCIsXCJpZFwiOlwiMTY3ZmMyMjYzMWFmNDJhMWI1Mzg4ZDRjMTFiNTU1OWFcIixcInVybF9pZHNcIjpbXCI3MjJkZTE2ZTAzMzI4NGI0NjE3OWVhN2RlZmE1NjA1OGI3N2JmYjk0XCJdfSJ9'

# Step 1: Extract the Report ID from the original URL
report_id = get_report_id_from_url(original_url)

if report_id:
    # Step 2: Fetch the report using the extracted Report ID
    fetch_report(report_id)
else:
    print("Failed to extract Report ID")
