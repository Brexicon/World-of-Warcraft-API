


# Define the API endpoint URL and client ID
$endpoint = "https://us.api.blizzard.com/data/wow/connected-realm/1146/auctions?namespace=dynamic-us&locale=en_US&access_token=USGLLUPWCbXVORMupdMPXaO9YArDu9clZS"

# Define the file path to save the results
$filePath = "F:\Term_4\Applied_Data_Analytics-George\WOWapiResult.csv"

# Define the number of items to retrieve
$numItems = 100

# Build the complete API request URL
$url = $endpoint 

# Make the API request and get the response
$response = Invoke-RestMethod $url

# Get the top 100 items in the auction house
$items = $response.auctions.item | Group-Object -Property id -AsHashTable | Select-Object -Property Count, @{Name="ID";Expression={$_.Keys[0]}}

# Sort the items by count (i.e., popularity)
$items = $items | Sort-Object -Property Count -Descending | Select-Object -First $numItems

# Add the item name to the items' ID property
$itemLookup = $response.items | Group-Object -Property id -AsHashTable
$items | ForEach-Object { $_.ID = $itemLookup[$_.ID].name }

# Save the results to a CSV file
$items | Export-Csv -Path $filePath -NoTypeInformation