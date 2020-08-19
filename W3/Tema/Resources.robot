*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Onesie}   //*[@id="inventory_container"]/div/div[5]/div[3]/button
${RedTshirt}    //*[@id="inventory_container"]/div/div[6]/div[3]/button
${myPrice}  $25.90

*** Keywords ***

Open SauceDemo
    Open Browser  https://www.saucedemo.com/  chrome
Login
    [Arguments]  ${myUser}  ${myPassword}
    Input Text  //*[@id="user-name"]  ${myUser}
    Input Text  //*[@id="password"]  ${myPassword}
    Click Button  //*[@id="login-button"]
Add Item to Cart
    [Arguments]  ${Product}
    Click Button    ${Product}
Go To Checkout
    Click Element  //*[@id="shopping_cart_container"]/a
    Click Element  //*[@id="cart_contents_container"]/div/div[2]/a[2]
Fill Order Details
    [Arguments]  ${Name1}  ${Name2}  ${Postal_code}
    Input Text  //*[@id="first-name"]  ${Name1}
    Input Text  //*[@id="last-name"]  ${Name2}
    Input Text  //*[@id="postal-code"]  ${Postal_code}
    Click Element  //*[@id="checkout_info_container"]/div/form/div[2]/input
Verify Total Price
    [Arguments]  ${Price}
    Element Text Should Be  //*[@id="checkout_summary_container"]/div/div[2]/div[7]  Total: ${Price}
Place Order
    Click Element  //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
Order Should be Confirmed
    Element Text Should Be  //*[@id="checkout_complete_container"]/h2  THANK YOU FOR YOUR ORDER