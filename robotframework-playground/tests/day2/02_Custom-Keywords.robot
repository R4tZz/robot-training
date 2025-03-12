*** Settings ***
Documentation       This test demonstrates how to create custom keywords

Test Tags           this-is-test-tag

Keyword Tags        this-is-keyword-tag


*** Variables ***


*** Test Cases ***
This Test Will Fail
    [Documentation]    This test will fail
    This keyword will fail
    Log    This keyword will not be executed

Call Embedded Arguments Keyword
    [Documentation]    Call the My keyword with embedded arguments
    My name is "Robot" and my last name is "Framework"

Call Fibonacci Keyword
    [Documentation]    Call the Fibonacci keyword with a value of 10
    FOR    ${i}    IN RANGE    0    10
        ${result}=    Fibonacci    ${i}
        Log To Console    ${result}
    END


*** Keywords ***
This keyword will fail
    [Documentation]    This keyword will always fail
    [Tags]    robot:continue-on-failure
    Fail    This keyword always fails
    Log    This keyword will be executed

My name is "${name}" and my last name is "${lastname}"
    [Documentation]    This keyword demonstrates how to use embedded arguments
    Log    My name is ${name} and my last name is ${lastname}

Fibonacci
    [Documentation]    Calculate the Fibonacci number for a given value
    [Arguments]    ${n}
    IF    ${n} <= 1    RETURN    ${n}
    ${a}=    Fibonacci    ${n-1}
    ${b}=    Fibonacci    ${n-2}
    ${result}=    Evaluate    ${a} + ${b}
    RETURN    ${result}
