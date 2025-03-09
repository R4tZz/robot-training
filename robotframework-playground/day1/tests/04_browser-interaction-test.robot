*** Settings ***
Documentation       These test cases will focus on the interaction with
...                 the elements on the page. This includes clicking, typing, and
...                 waiting for elements to be in a certain state.

Library             Browser

Suite Setup         Setup Browser For Interactive Tests
Suite Teardown      Tear Down Browser


*** Variables ***
${browser}      chromium
${headless}     ${False}
${url}          https://demoqa.com
${timeout}      30s
${slow_mo}      1s


*** Test Cases ***
Click on Element and Type Text
    [Documentation]    This test will naivgate to the demoqa.com elements page
    ...    and click on the Text Box element. After it will type in
    ...    the Full Name input field the John Doe name and take a screenshot.
    New Page    /elements    wait_until=domcontentloaded
    Wait For Elements State    //li[contains(.,'Text Box')]    visible
    Click    //li[contains(.,'Text Box')]
    Wait For Condition    URL    $=    /text-box
    Wait For Elements State    css=input[placeholder='Full Name']    visible
    Type Text    css=input[placeholder='Full Name']    John Doe
    Take Screenshot    fullPage=${True}
    Close Browser

Finding Elements
    [Documentation]    This test will navigate to the demoqa.com elements page
    ...    and use different methods of finding elements on the page.
    New Page    /elements    wait_until=domcontentloaded
    Wait For Elements State    //li[contains(.,'Text Box')]    visible
    Click    //li[contains(.,'Text Box')]
    Wait For Elements State    css=input[placeholder='Full Name']    visible
    Type Text    css=input[placeholder='Full Name']    John Doe
    Type Text    id=userEmail    some@email.com
    Fill Text    xpath=//textarea[@placeholder='Current Address']    some address
    ${permanent_address_element}=    Get Element    \#permanentAddress
    Type Text    ${permanent_address_element}    some permanent address    clear=${False}
    Type Text    ${permanent_address_element}    ${SPACE}some edit    clear=${False}    delay=1s
    Fill Text    ${permanent_address_element}    another edit and now it is clean
    Click    text=Submit
    Wait For Elements State    css=div#output    visible
    Take Screenshot    fullPage=${True}
    Close Browser


*** Keywords ***
Setup Browser For Interactive Tests
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    New Context    baseURL=${url}    locale=fi-FI    viewport={"width": 1920, "height": 1024}    colorScheme=dark
    Set Browser Timeout    15s    scope=Global

Tear Down Browser
    Close Browser
