import requests
from urllib.parse import urlparse, parse_qs

# Original URL
original_url = 'http://mail2.trackman.com/track/click/10654379/mytrackman.com?p=eyJzIjoiTTVjNXRuX2xEek1IOHp1dEdpNEs1bHJGc0dnIiwidiI6MSwicCI6IntcInVcIjoxMDY1NDM3OSxcInZcIjoxLFwidXJsXCI6XCJodHRwczpcXFwvXFxcL215dHJhY2ttYW4uY29tXFxcL0R5bmFtaWNSZXBvcnQ_UmVwb3J0SWQ9ZDE4ZmE1NGUtNTc1NS1lZjExLWEwNmEtZTQwZDM2N2M2OWU2XCIsXCJpZFwiOlwiMTY3ZmMyMjYzMWFmNDJhMWI1Mzg4ZDRjMTFiNTU1OWFcIixcInVybF9pZHNcIjpbXCI3MjJkZTE2ZTAzMzI4NGI0NjE3OWVhN2RlZmE1NjA1OGI3N2JmYjk0XCJdfSJ9'

# Send request to the original URL
response = requests.get(original_url)

# Get the redirected URL
redirected_url = response.url

print(f'Redirected URL: {redirected_url}')
# Parse the redirected URL
parsed_url = urlparse(redirected_url)
query_params = parse_qs(parsed_url.query)

print(f'Query Params: {query_params}')
# Extract the report ID
report_id = query_params.get('ReportId', [None])[0]

print(f"Report ID: {report_id}")
