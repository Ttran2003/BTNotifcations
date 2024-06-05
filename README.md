#Overview

This project aims to automate the creation and display of toast notifications on Windows systems using PowerShell and the BurntToast module. The notifications are dynamically generated based on content fetched from a specified web page. This project can be used to display important announcements, updates, or any other relevant information in a visually engaging manner.

Key Features
Web Content Extraction: The script uses PowerShell's Invoke-WebRequest to fetch content from a specified web page.
Dynamic Notification Content: Extracts headings, paragraphs, and images from the web page to be used in the toast notifications.
Image Handling: Automatically downloads images from the web page and uses them as logos in the toast notifications.
Error Handling: Includes error handling for image download failures and ensures notifications are displayed even if the image is not available.
Automation Ready: The setup scripts for both target and management computers enable automated configuration, allowing for remote control and notification management.
