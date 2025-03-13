*** Settings ***
Test Template       Log My Message


*** Test Cases ***    MESSAGE
My Name    is John
Your Name    is Jane
My Last Name    is Doe

## This will fail because of the test template settings configuration
## This suite will only execute the Log My Message keyword
## Uncomment to see the error
# Hello World
    # Log    Hello World


*** Keywords ***
Log My Message
    [Arguments]    ${message}
    Log    ${message}
