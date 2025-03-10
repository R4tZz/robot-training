*** Settings ***
Documentation       This is a simple test case

Test Tags           smoke


*** Variables ***
${my_variable}      Hello, World!


*** Test Cases ***
My First Test
    [Documentation]    This is my first test case using robot
    [Tags]    my_tag
    Log    ${my_variable}
    My Custom Keyword


*** Keywords ***
My Custom Keyword
    Log    This is a custom keyword
