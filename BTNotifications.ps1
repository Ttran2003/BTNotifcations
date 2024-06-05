# Ensure BurntToast is installed
if (-not (Get-Module -ListAvailable -Name BurntToast)) {
    Install-Module -Name BurntToast -Force -Scope CurrentUser
}

# Fetch content from the web page
$Response = Invoke-WebRequest -URI https://ttran2003.github.io/BTNotifcations/

# Extract heading, paragraph, and image URL
$heading = ($Response.AllElements | Where-Object TagName -eq "h1").InnerText
$paragraph = ($Response.AllElements | Where-Object TagName -eq "p").InnerText
$imageUrl = ($Response.Images | Select-Object -First 1).Src
if ($imageUrl -and ($imageUrl -notmatch "^https?://")) {
    $baseUri = [System.Uri]::new($Response.BaseResponse.ResponseUri)
    $imageUrl = [System.Uri]::new($baseUri, $imageUrl).AbsoluteUri
}

# Download the image to a local file
$imagePath = "$env:TEMP\toastImage.jpg"
Invoke-WebRequest -Uri $imageUrl -OutFile $imagePath

# Create a toast notification using the downloaded image
if ((Get-Item $imagePath).Length -gt 0) {
    New-BurntToastNotification -AppLogo $imagePath -Text $heading, $paragraph
    Start-Sleep -Seconds 10
    Remove-Item -Path $imagePath -Force
}

Write-Output "Notification displayed."
