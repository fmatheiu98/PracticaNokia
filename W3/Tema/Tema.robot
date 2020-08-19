*** Settings ***
Resource  Resources.robot


*** Test Cases ***
Plasare Comanda
    Open SauceDemo
    Login   standard_user  secret_sauce
    Add Item to Cart    ${Onesie}
    Add Item to Cart    ${RedTshirt}
    Go To Checkout
    Fill Order Details  Flavius  Matheiu  123456
    Verify Total Price  ${myPrice}
    Place Order
    Order Should be Confirmed
    Close Browser

