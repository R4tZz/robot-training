*** Settings ***
Documentation       Assertions and Validations

Library             ./lib/custom-assertion.py
Library             Browser


*** Variables ***
${numnber}      5
${string}       Hello World
@{list}         1    2    3    4    5
&{dict}         key1=value1    key2=value2    key3=value3


*** Test Cases ***
Built In Assertions
    [Documentation]    This is a test case to demonstrate built-in assertions.
    [Tags]    robot:continue-on-failure
    ${result}=    Evaluate    ${numnber} * 2    ## This will execute Python code
    Should Be Equal As Numbers    ${result}    10    ## Compares mumbers, the result should be equal to 10

    ## Compares strings, the result should not be equal to "Hello Universe"
    Should Not Be Equal As Strings
    ...    ${string}
    ...    Hello Universe

    Should Contain    ${string}    World    ## Checks if the string contains "World"
    Should Not Contain    ${string}    Universe    ## Checks if the string does not contain "Universe"
    Should Be True    ${numnber} > 0    ## Checks if the condition is true
    Should Not Be True    ${numnber} < 0    ## Checks if the condition is not true
    Should Not Be Empty    ${string}    ## Checks if the string is not empty

    ## Checks if a given item is empty
    Should Be Empty
    ...    ${string}
    ...    msg="String should be empty! Value: '${string}'"

    Length Should Be    ${list}    5    ## Checks if the length of the list is 5
    Variable Should Exist    ${string}    ## Checks if the variable exists

    ## To avoid linting error, use \${}. Checks if the variable does not exist
    Variable Should Not Exist
    ...    \${non_existent_variable}

    Skip If    ${numnber} < 10    msg="Skipping test case because number is less than 10"
    Log    I will not be executed if the number is less than 10

Custom Assertions
    [Documentation]    This is a test case to demonstrate custom assertions.
    [Tags]    robot:continue-on-failure
    My Custom Equal    ${numnber}    7
    My Custom Equal    ${numnber}    5

Basic Browser Assertions
    [Documentation]    This is a test case to demonstrate basic browser assertions.
    [Tags]    robot:continue-on-failure
    New Browser    chromium    headless=${False}    slowMo=1s
    New Page    https://playwright.dev/
    Wait For Load State    domcontentloaded    ## Wait for the page to load completely

    Get Title    ==    Some Title    ## This will fail if the title is not "Some Title"
    Get Text    h1    ==    Example Domain    ## This will fail if the header is not "Example Domain"
    Get Text    h1    ^=    Example    ## This will fail if the header does not start with "Example"
    Get Text    h1    $=    Domain    ## This will fail if the header does not end with "Domain"

    Get Element Count    h1    ==    2    ## This will fail if there is not exactly one header
    Get Element States    h1    ==    visible    ## This will fail if the header is not visible
    Get Element States    h1    validate    value & visible    ## This will fail if the header is not visible
    Get Attribute    h1    attrnotexist    ## This will fail if the attribute does not exist

    ## This will fail if the content of the class attribute is not None
    Get Attribute
    ...    h1
    ...    class
    ...    ==
    ...    ${None}

    ## This expression will return the value true or false depending on the attribute value
    ## We are evaludating the condition if the attribute X value is None
    ## In this case, the attribute does not exist, so the value is None, returning True
    ## If the attribute exists, and did contain a value, the condition will return False
    ${attr_value}=    Get Attribute
    ...    h1
    ...    attrnotexist
    ...    evaluate
    ...    value is None
    Should Not Be True    ${attr_value}

    ## This will fail if the header is not visible and attached
    Get Element States
    ...    h1
    ...    contains
    ...    visible
    ...    attached

    ## This will return the state of visible or hidden, in a list
    ${header_state}=    Get Element States
    ...    h1
    ...    then
    ...    value & (visible | hidden)
    Should Be Equal    ${header_state}    visible    ## This will fail if the header is not ['visible']
    Should Contain    ${header_state}    visible    ## This will fail if visible is not in the list

    ## This will return true if the header is visible
    ${header_state}=    Get Element States    h1    then    bool(value & visible)
    Should Be True    ${header_state}    ## This will fail if the header is not visible

    Close Browser

Advanced Browser Assertions
    [Documentation]    This is a test case to demonstrate advanced browser assertions.
    [Tags]    robot:continue-on-failure
    GROUP    Setup Browser
        New Browser    chromium    headless=${False}    slowMo=1s
        New Page    https://playwright.dev/
        Wait For Load State    domcontentloaded
    END
    GROUP    Navigate to Docs and Wait for Load State
        Wait For Elements State    //a[normalize-space(text())='Docs']    visible
        Click    //a[normalize-space(text())='Docs']
        Wait For Condition
        ...    Url
        ...    *=
        ...    /docs
        ...    timeout=10s
        Wait For Load State    domcontentloaded
    END
    [Teardown]    Close Browser
