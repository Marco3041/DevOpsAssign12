from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time

# Configure the webdriver (Chrome)
driver = webdriver.Chrome()

# Base URL
base_url = "http://34.230.229.232:8000"  # Change to your deployed web URL

try:
    # --------------------------
    # Test Registration
    # --------------------------
    driver.get(f"{base_url}/register/")
    time.sleep(2)

    driver.find_element(By.NAME, "username").send_keys("testuser")
    driver.find_element(By.NAME, "password").send_keys("testpass")
    driver.find_element(By.XPATH, "//button[text()='Register']").click()
    time.sleep(2)

    print("Registration test completed!")

    # --------------------------
    # Test Login
    # --------------------------
    driver.get(f"{base_url}/login/")
    time.sleep(2)

    driver.find_element(By.NAME, "username").send_keys("testuser")
    driver.find_element(By.NAME, "password").send_keys("testpass")
    driver.find_element(By.XPATH, "//button[text()='Login']").click()
    time.sleep(2)

    print("Login test completed!")

finally:
    driver.quit()
