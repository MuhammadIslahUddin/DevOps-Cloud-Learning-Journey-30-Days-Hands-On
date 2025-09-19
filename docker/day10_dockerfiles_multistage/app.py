import requests

print("Hello from a multi-stage Python Docker build!")

# Example API call
response = requests.get("https://api.github.com")
if response.status_code == 200:
    print("✅ API call successful!")
    print("GitHub API Current User URL:", response.json().get("current_user_url"))
else:
    print("❌ API call failed with status:", response.status_code)
