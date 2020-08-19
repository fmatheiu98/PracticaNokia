*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Plasare Comanda
  Open Browser  https://www.saucedemo.com/  chrome
  Input Text  //*[@id="user-name"]  standard_user
  Input Text  //*[@id="password"]  secret_sauce
  Click Button  //*[@id="login-button"]
  Click Button  //*[@id="inventory_container"]/div/div[5]/div[3]/button
  Click Button  //*[@id="inventory_container"]/div/div[6]/div[3]/button
  Click Element  //*[@id="shopping_cart_container"]/a
  Click Element  //*[@id="cart_contents_container"]/div/div[2]/a[2]
  Input Text  //*[@id="first-name"]  Flavius
  Input Text  //*[@id="last-name"]  Matheiu
  Input Text  //*[@id="postal-code"]  100000
  Click Element  //*[@id="checkout_info_container"]/div/form/div[2]/input
  Element Text Should Be  //*[@id="checkout_summary_container"]/div/div[2]/div[7]  Total: $25.90
  Click Element  //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
  Element Text Should Be  //*[@id="checkout_complete_container"]/h2  THANK YOU FOR YOUR ORDER
  Close Browser