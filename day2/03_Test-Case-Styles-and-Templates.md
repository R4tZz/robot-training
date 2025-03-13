# **Test Case Styles and Templates in Robot Framework**

Robot Framework is a powerful test automation framework that supports multiple test case styles, allowing flexibility in structuring tests. Below we will introduce advanced methods and complex approaches for creating tests using **keyword-driven**, **data-driven**, and **behavior-driven** designing styles. We will explore how to use Robot Framework's **Template** keyword for efficient test execution and integrate **JSON** and **YAML** data for more complex scenarios.

---

## 1. Keyword-Driven Test Cases

Keyword-driven testing structures tests using reusable keywords, making the tests highly readable and maintainable.

### **Concept**

- Uses user-defined keywords.
- Enhances modularity by abstracting implementation details.
- Improves test maintainability.

### **Example: Automating a Login Test**

```robot
*** Settings ***
Library    Browser

*** Keywords ***
Open Application
    New Browser    chromium    headless=False
    New Page    https://example.com/login

Login With Credentials
    [Arguments]    ${username}    ${password}
    Fill Text    id=username    ${username}
    Fill Text    id=password    ${password}
    Click    id=login-button

Verify Login Success
    Wait For Elements State    id=dashboard    visible

*** Test Cases ***
User Can Login Successfully
    Open Application
    Login With Credentials    user1    password123
    Verify Login Success
```

---

## 2. Data-Driven Test Cases

Data-driven testing allows executing the same test logic with multiple sets of data, reducing code duplication.

### **Concept**

- Uses test templates to iterate over test cases with different inputs.
- Reads test data from external sources such as **JSON** or **YAML**.

### **Example: Data-Driven Login Using JSON**

```robot
*** Settings ***
Library    Browser
Variables  login_data.json

*** Variables ***
${LOGIN_DATA}    ${EMPTY}

*** Keywords ***

Login And Verify
    [Arguments]    ${user}    ${pass}    ${expected_result}
    Open Application
    Login With Credentials    ${user}    ${pass}

Execute Tests With Control Structures
    ## Using the users from the json file below
    FOR    ${entry}    IN    @{users}
        Login And Verify    ${entry}[username]    ${entry}[password]    ${entry}[expected]
    END
```

### **Example JSON File (login_data.json)**

```json
{
  "users": [
    { "username": "user1", "password": "password123", "expected": true },
    { "username": "admin", "password": "wrongpass", "expected": false }
  ]
}
```

### **Using the `Template` Keyword for Reusability**

```robot
*** Settings ***
Test Template   Login And Verify

*** Test Cases ***      USERNAME   PASSWORD
## Execute the same test case scenario
## Naming columns like we see above makes tests easier to understand.
## This is possible because on the header row other cells except the first one are ignored.
It is OK                user1      password
It is Invalid           user2      password
It is Wrong             user3      password
```

```robot
*** Test Cases ***
Login Test Cases
    [Template]    Login And Verify
    user1    password123  ${True}
    admin    adminpass    ${False}
    guest    guest123     ${True}
```

---

## 3. Behavior-Driven Testing (BDD)

BDD in Robot Framework aligns test cases with business requirements using natural language format.

### **Concept**

- Follows the **Given-When-Then** structure.
- Makes tests more readable for non-technical stakeholders.

### **Example: BDD Style Login Test Using YAML**

```robot
*** Settings ***
Variables  bdd_login.yml

*** Keywords ***
Given User Opens The Login Page
    Open Application

When User Logs In With "${user}" And "${pass}"
    Login With Credentials    ${user}    ${pass}

Then They Should See Dashboard "${expected}"
    Wait For Elements State    id=dashboard    visible

*** Test Cases ***
Run BDD Tests
    FOR    ${scenario}    IN    @{users}
        Given User Opens The Login Page
        When User Logs In With "${scenario}[username]" And "${scenario}[password]"
        Then They Should See Dashboard "${scenario}[expected]"
    END
```

### **Example YAML File (bdd_login.yaml)**

```yaml
users:
    - username: user1
    password: password123
    expected: true
    - username: admin
    password: wrongpass
    expected: false
```

---

## **Conclusion**

By leveraging Robot Framework's **keyword-driven, data-driven, and behavior-driven** styles, test automation can be made more scalable, readable, and maintainable. The use of **Templates, JSON, and YAML** enhances flexibility and separation of test logic from test data. These advanced techniques help streamline automation efforts for large-scale projects.
