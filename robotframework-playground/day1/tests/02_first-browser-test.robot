*** Settings ***
Documentation       This is playwright browser test

Library             Browser

Test Tags           browser


*** Variables ***
${browser}      chromium
${headless}     ${True}
${url}          https://www.playwright.dev/


*** Test Cases ***
My First Test
    [Documentation]    This will open a browser and take a screenshot
    [Tags]    my_browser_tag
    Open My Browser
    Take Screenshot With Arguments    fullPage=${True}
    Close Browser


*** Keywords ***
Open My Browser
    Open Browser    browser=${browser}    headless=${headless}    url=${url}
    Log    I opened the browser

Take Screenshot With Arguments
    [Arguments]    ${fullPage}=${False}
    Take Screenshot    fullPage=${fullPage}
