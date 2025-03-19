*** Settings ***
Documentation       This test will navigate to letcode.in/shadow
...                 and type in the shadow DOM input field.

Library             Browser


*** Variables ***
${browser}                  chromium
${headless}                 ${False}
${timeout}                  30s
${slow_mo}                  1s
${letcode_shadow_url}       https://letcode.in/shadow


*** Test Cases ***
Type Text in Shadow DOM
    [Documentation]    Test case to type in the shadow DOM input field.
    [Tags]    iframe    robot:continue-on-failure
    New Browser    browser=${browser}    headless=${headless}    slowMo=${slow_mo}    timeout=${timeout}
    New Page    ${letcode_shadow_url}    wait_until=domcontentloaded
    Get Text    h1
    Get Element    div#open-shadow
    Type Text    input#fname    John
    ## This will fail because the shadow DOM is closed.
    # Read more about it: https://playwright.dev/docs/locators#locate-in-shadow-dom
    Type Text
    ...    input#lname
    ...    Doe
    ## However, we can use the Evaluate JavaScript keyword to access the shadow DOM.
    ${elem}=    Get Element    my-web-component
    Evaluate JavaScript    ${elem}    (elem) => elem.myRoot.querySelector('#lname').value = 'Doe'
    Take Screenshot
