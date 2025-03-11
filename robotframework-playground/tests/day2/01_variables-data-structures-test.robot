*** Settings ***
Documentation       Variables and Data Structures

Library             Browser


*** Variables ***
${URL}          https://playwright.dev/
@{BROWSERS}     chromium    firefox    webkit
&{USER}         name=John    age=30    country=USA
${name}         Mike


*** Test Cases ***
Type Variables
    [Documentation]    This test case demonstrates the types of variables in Robot Framework
    Log    ${URL}
    Log    ${BROWSERS}
    Log    ${BROWSERS}[1]
    Log    ${USER}
    Log    ${USER.name}
    Log    ${USER.age}
    Log    ${USER.country}

Variable Scope Part 1
    [Documentation]    This test case will show how scope of variables work in Robot Framework
    VAR    ${name}    John
    Log    ${name}
    IF    "${name}" == "John"
        ${name}=    Set Variable    Jane
        Log    ${name}
        ${localvariable}=    Set Variable    localvariable
    END
    Log    ${name}
    Log    ${localvariable}

Variable Scope Part 2
    [Documentation]    This test case will show how scope of variables work in Robot Framework
    Log    ${name}
    ${name}=    Set Variable    Jane
    Set Global Variable    ${name}
    ## Uncomment the below line to see the error
    # Log    ${localvariable}

Variable Scope Part 3
    [Documentation]    This test case will show how scope of variables work in Robot Framework
    Log    ${name}

List Variables
    [Documentation]    This test case will show how list variables work in Robot Framework
    VAR    @{names}    John    Jane    Mike
    @{lastnames}=    Create List    Doe    Smith    Johnson    Brown    White
    Log    ${names}
    Log    ${lastnames}

    ## For loop examples
    ## Read more in the official documentation:
    ## https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#for-loops
    FOR    ${n}    IN    @{names}
        Log    ${n}
    END

    FOR    ${i}    IN RANGE    0    5
        Log    ${lastnames}[${i}]
    END

    FOR    ${index}    ${n}    IN ENUMERATE    @{lastnames}
        Log Many    ${index}    ${n}
    END

    ## List operations - slicing
    ${lastnames}[0]=    Set Variable    Edit doe
    Log    ${lastnames}
    Log    ${lastnames}[-1]
    Log    ${lastnames}[1:3]
    Log    ${lastnames}[::2]

Dictionary Variables
    [Documentation]    This test case will show how dictionary variables work in Robot Framework
    ${user}=    Create Dictionary    name=John    age=30    country=USA
    Log    ${user}
    Log    ${user}[name]
    FOR    ${key}    ${value}    IN    &{user}
        Log    This is the key ${key} with the value ${value}
    END

    ## Dictionary operations
    ${user}[name]=    Set Variable    Mike
    Log    ${user}
    Log    ${user}[name]
    ${user.city}=    Set Variable    New York
    Log    ${user}

Environment Variables
    [Documentation]    This test case will show how environment variables work in Robot Framework
    ## These environment variables might not work in all operating systems
    Log    %{OS}
    Log    %{USERNAME}

BuiltIn Variables
    [Documentation]    This test case will show how built-in variables work in Robot Framework
    Log    ${EMPTY}
    Log    ${True}
    Log    ${False}
    Log    ${None}
    Log    A message${SPACE}here
    Log    ${SUITE_NAME}
    Log    ${TEST_NAME}

Escape Characters
    [Documentation]    This test case will show how escape characters work in Robot Framework
    Log    This is a single quote \'
    Log    This is a double quote \"
    Log    This is a backslash \\
