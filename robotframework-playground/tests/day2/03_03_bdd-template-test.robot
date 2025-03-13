*** Settings ***
Documentation       Behavior Driven Development (BDD) test cases.
...                 Install pyyaml to run this test. "uv add pyyaml"

Variables           ./variables/yaml-file.yml
Library             Collections


*** Variables ***
${country}      ${EMPTY}
${capital}      ${EMPTY}


*** Test Cases ***
Test BDD USA
    [Documentation]    Test BDD
    Given A known country name "USA"
    When I check the capital of the country
    Then I should get the capital name

Test BDD Mexico
    [Documentation]    Test BDD
    Given A known country name "Mexico"
    When I check the capital of the country
    Then I should get the capital name

Test BDD Portugal
    [Documentation]    Test BDD
    Given A known country name "Portugal"
    When I check the capital of the country
    Then I should get the capital name


*** Keywords ***
A known country name "${country_name}"
    ${country} =    Get Country By Name    ${country_name}
    Log    Country name is: ${country}
    Set Global Variable    ${country}

I check the capital of the country
    IF    "${country}" == "${EMPTY}"
        Log    Country not found!
        ${capital} =    Set Variable    ${EMPTY}
    ELSE
        ${capital} =    Get From Dictionary    ${country}    capital    ${None}
        Log    Capital name is: ${capital}
    END
    Set Global Variable    ${capital}

I should get the capital name
    Should Not Be Empty    ${capital}    Capital name should not be empty.

Get Country By Name
    [Arguments]    ${country_name}
    VAR    ${country}    ${EMPTY}
    FOR    ${c}    IN    @{countries}
        IF    "${c.name}" == "${country_name}"
            Log    Found country name: ${country_name}
            ${country} =    Set Variable    ${c}
            BREAK
        END
    END
    RETURN    ${country}
