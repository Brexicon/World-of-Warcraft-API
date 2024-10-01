


import requests
import json
import csv

# API endpoint URL
url = "https://us.api.blizzard.com/data/wow/connected-realm/12345/auctions"

# API query parameters
params = {
    "namespace": "dynamic-us",
    "locale": "en_US",
    "access_token": "your_api_key_here"
}

# Send GET request to API
response = requests.get(url, params=params)

# Parse JSON response data
data = json.loads(response.content)

# Transform data into CSV format
csv_data = []
for auction in data["auctions"]:
    row = [
        auction["id"],
        auction["item"]["id"],
        auction["item"]["name"],
        auction["unit_price"],
        auction["quantity"],
        auction["time_left"],
        auction["owner"]["realm"]["slug"],
        auction["owner"]["name"]
    ]
    csv_data.append(row)

# Write CSV data to file
with open("/path/to/auction_data.csv", "w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(["auction_id", "item_id", "item_name", "unit_price", "quantity", "time_left", "realm", "seller"])
    writer.writerows(csv_data)
