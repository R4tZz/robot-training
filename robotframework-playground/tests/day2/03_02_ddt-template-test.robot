*** Settings ***
Library             Browser
Variables           ./variables/json-file.json

Suite Setup         Open The Browser    ${URL}    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser


*** Variables ***
${URL}          https://playwright.dev/
${URL2}         https://robotframework.org/
${URL3}         https://testnotrealsite.com/
${URL4}         https://google.com/
${BROWSER}      chromium
${HEADLESS}     ${False}


*** Test Cases ***
Open Browser
    [Documentation]    Take a screenshot of the page
    [Template]    Open The Page And Take Screenshot
    ## The continue-on-failure tag in templates is on by default
    ## If want to disable it, you can use the following line
    # [Tags]    robot:stop-on-failure
    ${URL}
    ${URL2}
    ${URL3}    ## This will fail because the URL is not reachable
    ${URL4}

Able To Use Other Keywords
    [Documentation]    This test will demonstrate that we can
    ...    have more test cases in the same suite
    Log    This keyword will be executed

Template With Json File
    [Documentation]    This test will demonstrate how to use a JSON file as a template
    [Tags]    robot:continue-on-failure
    FOR    ${user}    IN    @{users}
        Log My User    ${user}
    END


*** Keywords ***
Open The Browser
    [Documentation]    Open the browser
    [Arguments]    ${url}    ${browser}    ${headless}
    New Browser    ${browser}    headless=${headless}
    Set Browser Timeout    30s

Open The Page And Take Screenshot
    [Documentation]    Open the page and take a screenshot
    [Arguments]    ${url}
    New Page    ${url}    wait_until=domcontentloaded
    Sleep    2s
    Take Screenshot    full_page=True

Log My User
    [Documentation]    Log my user
    [Arguments]    ${user}
    Log Many    ${user.name}    ${user.age}    ${user.email}
