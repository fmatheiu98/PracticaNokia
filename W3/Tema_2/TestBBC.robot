*** Settings ***
Resource  BBC.robot

*** Test Cases ***
BBC Navigation
    Open BBC Website
    Get To Weather Section
    Get The Weather For     Arad
    Go To Smart Guide To Climate Change
    Search For  Romania
    Close Browser
