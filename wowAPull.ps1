



$authSuccess = $false

$authurl = "https://oauth.battle.net/token"

$clientId = "5d88ac5eec48493e9449156863f55764"
$clientSecret = "HwBnm4UbUN45Qm6sRnk4juHJQM1KNRoI"

$authboundary = [System.Guid]::NewGuid().ToString()
$authLF = "`r`n"

$authbodyLines = (
    "--$authboundary",
    "Content-Disposition: form-data; name=`"client_id`"$authLF",
    $clientId,
    "--$authboundary",
    "Content-Disposition: form-data; name=`"client_secret`"$authLF",
    $clientSecret,
    "--$authboundary",
    "Content-Disposition: form-data; name=`"grant_type`"$authLF",
    "client_credentials",
    "--$authboundary--"
) -join $authLF

try {
    $application = "https://oauth.battle.net/authorize";
$username = "bradferd19@gmail.com";
$password = "SimpSons!663";

$creds = @{
    username = $username
    password = $password
    grant_type = "password"    
};

# $header_token = @{"Content-Type" = "application/x-www-form-urlencoded"}
# $header_Out = @{"Accept" = "application/json" ; "authorization" = "bearer $token"}

#     $tokenResponse = Invoke-WebRequest -Uri $authurl -Method Post -ContentType "multipart/form-data; boundary=$authboundary" -Body $authbodyLines
#     $tokenResponseJSON = ConvertFrom-Json $tokenResponse.Content

#     # Extract the token from the response
#     $tokenBearer = $tokenResponseJSON.token_type
#     $token = $tokenResponseJSON.access_token 

#     $authSuccess = $true

#     "  Authorized. Token is: $token"
}
catch {
    
    $authSuccess = $false
    "  ERROR - Unable to get an access token."
}



$datestart = (Get-Date).addDays(-1).tostring("yyyy-MM-dd")
$dateend = (Get-Date).addDays(-1).tostring("yyyy-MM-dd")

$response = Invoke-RestMethod "$application" -Method Post -Body $creds -Headers $header_token;

$token = $response.access_token;

Invoke-WebRequest -Uri "https://us.api.blizzard.com/data/wow/connected-realm/114/auctions?namespace=dynamic-us&locale=en_US&access_token=$token" -Header $header_Out -OutFile "G:\Traffic.csv"













# $authSuccess = $false

# $authurl = "https://oauth.battle.net/token"

# $clientId = "5d88ac5eec48493e9449156863f55764"
# $clientSecret = "HwBnm4UbUN45Qm6sRnk4juHJQM1KNRoI"

# $authboundary = [System.Guid]::NewGuid().ToString()
# $authLF = "`r`n"

# $authbodyLines = (
#     "--$authboundary",
#     "Content-Disposition: form-data; name=`"client_id`"$authLF",
#     $clientId,
#     "--$authboundary",
#     "Content-Disposition: form-data; name=`"client_secret`"$authLF",
#     $clientSecret,
#     "--$authboundary",
#     "Content-Disposition: form-data; name=`"grant_type`"$authLF",
#     "client_credentials",
#     "--$authboundary--"
# ) -join $authLF

# try {
#     $tokenResponse = Invoke-WebRequest -Uri $authurl -Method Post -ContentType "multipart/form-data; boundary=$authboundary" -Body $authbodyLines
#     $tokenResponseJSON = ConvertFrom-Json $tokenResponse.Content

#     # Extract the token from the response
#     $tokenBearer = $tokenResponseJSON.token_type
#     $token = $tokenResponseJSON.access_token 

#     $authSuccess = $true

#     "  Authorized. Token is: $token"
# }
# catch {
    
#     $authSuccess = $false
#     "  ERROR - Unable to get an access token."
# }




# $application = "https://api.xxxx.com/token";
# $username = "bradferd19@gmail.com";

# $password = "SimpSons!663";

# $creds = @{
#     username = $username
#     password = $password
#     grant_type = "password"    
# };

# $header_token = @{"Content-Type" = "application/x-www-form-urlencoded"}
# $header_Out = @{"Accept" = "application/json" ; "authorization" = "bearer $token"}

# $datestart = (Get-Date).addDays(-1).tostring(“yyyy-MM-dd”)
# $dateend = (Get-Date).addDays(-1).tostring(“yyyy-MM-dd”)

# $response = Invoke-RestMethod "$application" -Method Post -Body $creds -Headers $headers;

# $token = $response.access_token;

# Invoke-WebRequest -Uri "https://us.api.blizzard.com/data/wow/connected-realm/114/auctions?namespace=dynamic-us&locale=en_US&access_token=USETRPkR02ZzR8EuSTd4VsNtttFq0wNSwa" -Header $header_Out -OutFile "G:\Traffic.json"
# $host.enternestedprompt()


# # read over and tell me why this may not be working corectly. then make those changes 