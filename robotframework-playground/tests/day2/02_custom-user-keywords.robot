*** Settings ***
Documentation       This suite will deemonstrate how to create custom keywords

Test Tags           this-is-test-tag

Keyword Tags        this-is-keyword-tag


*** Test Cases ***
This Test Will Fail
    [Documentation]    This test will fail
    This keyword will fail
    Log    This keyword will not be executed

Arguments Keywords
    [Documentation]    This test will demonstrate how to use arguments in keywords
    Default argument values
    Default argument values    name=Robot    lastname=Framework
    Variable arguments
    Variable arguments    Robot    arg1    arg2    arg3
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

Default argument values
    [Documentation]    This keyword demonstrates how to use default argument values
    [Arguments]    ${name}=John    ${lastname}=Doe
    Log    My name is ${name} and my last name is ${lastname}

Variable arguments
    [Documentation]    This keyword demonstrates how to use variable arguments
    [Arguments]    ${name}=John    @{args}
    FOR    ${arg}    IN    @{args}
        Log    ${arg}
    END

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
