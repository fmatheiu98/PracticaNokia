*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${my_title}     BBC - Search results for Romania

*** Keywords ***
Open BBC Website
    Open Browser    https://www.bbc.com/   chrome
    Maximize Browser Window

Get To Weather Section
    Click Element   //*[@id="orb-nav-more"]/a
    Click Element   //*[@id="orb-panel-more"]/div/ul/li[11]/a

    Wait Until Element Is Visible  //*[@id="bbccookies-continue-button"]
    Click Element   //*[@id="bbccookies-continue-button"]
    Wait Until Element Is Visible   //*[@id="wr-c-navigation-footer__title"]
    Element Should Contain  //*[@id="wr-c-navigation-footer__title"]     Weather

Get The Weather For
    [Arguments]  ${city}

    Input Text  //*[@id="ls-c-search__input-label"]  ${city}
    Click Element	 //*[@id="wr-location-search-container"]/div/div[1]/form/div/input
    Wait Until Element Is Visible  //*[@id="wr-location-name-id"]
    Element Should Contain  //*[@id="wr-location-name-id"]    ${city}
    Click Element   //*[@id="wr-forecast"]/div[4]/div/div[1]/div[2]/div/div/div/div[3]/a/div/div[1]
    Element Should Contain  //*[@id="wr-forecast"]/div[4]/div/div[1]/div[2]/div/div/div/div[2]/ol/li[7]/button/div[1]/div[2]/div[1]     12

Go To Smart Guide To Climate Change
    Click Element   //*[@id="orb-nav-links"]/ul/li[7]/a
    Wait Until Element Is Visible  //*[@id="root"]/div[2]/div/nav/div/div/div[3]
    Click Element   //*[@id="root"]/div[2]/div/nav/div/div/div[3]
    Wait Until Element Is Visible  //*[@id="nav-menu-links"]/a[9]     15
    Element Should Contain   //*[@id="nav-menu-links"]/a[9]     Smart Guide to Climate Change
    Click Element   //*[@id="nav-menu-links"]/a[9]

Search For
    [Arguments]  ${country}
    Input Text  //*[@id="orb-search-q"]     ${country}
    Click Element   //*[@id="orb-search-button"]
    Element Should Contain  //*[@id="main-content"]/div/div[3]/div/div/ul/li[1]/div/div[1]/div[1]/p[1]/a/span   Deadly 60: Series 2: Romania
    Log Title