# **Custom Keywords in Robot Framework**

Robot Framework provides the ability to create custom keywords, which help in organizing and simplifying test cases by abstracting common operations into reusable components. Below we will go through defining, documenting, and using custom keywords effectively, covering various keyword features such as arguments, return values, setup, teardown, tags and recursion.

---

## Keyword Syntax

Custom keywords in Robot Framework are defined under the `*** Keywords ***` section. Each keyword functions like a function in programming languages, allowing reuse and modularity. Keywords can call built-in or user-defined keywords and handle arguments dynamically.

### Example:

```robot
*** Keywords ***
Login To Application
    [Arguments]    ${username}    ${password}
    Open Browser    https://example.com    browser=chromium
    Type Text    id=username    ${username}
    Type Text    id=password    ${password}
    Click    id=login
```

Using well-structured keywords ensures better maintainability and reduces duplication in test cases.

---

## Keyword Documentation

To document a keyword, use the `[Documentation]` setting. This helps in understanding its purpose when browsing test cases or using tools like `libdoc`. Documentation can span multiple lines using the `...` syntax.

### Example:

```robot
*** Keywords ***
Login To Application
    [Documentation]    Logs in to the application using the provided credentials.
    ...
    ...    Arguments:
    ...    - ${username}: Username for login.
    ...    - ${password}: Password for login.
    ...    The keyword opens a browser, enters credentials, and clicks the login button.
    ...
    ...    Examples:
    ...    | Login To Application | user | pass |
    ...    | Login To Application | admin | admin |
    ...
    [Arguments]    ${username}    ${password}
    Open Browser    https://example.com    Chrome
    Type Text    id=username    ${username}
    Type Text    id=password    ${password}
    Click    id=login
```

Proper documentation is crucial when working in teams, as it improves readability and usability.

---

## Keyword Tags

Tags can be assigned to keywords using `[Tags]`. These tags help categorize keywords and can be filtered in test execution.

### Example:

```robot
*** Keywords ***
Login To Application
    [Tags]    authentication    ui    critical
    [Arguments]    ${username}    ${password}
    Open Browser    https://example.com    Chrome
    Type Text    id=username    ${username}
    Type Text    id=password    ${password}
    Click    id=login
```

### Reserved Tags

Robot Framework has reserved tags that serve special purposes. Some commonly used reserved tags include:

- `robot:no-dry-run`: Prevents the keyword from being executed in the dry-run mode.
- `robot:continue-on-failure`: Allows the keyword to continue the execution even if some function within fails.
- `robot:skip`: Marks a test to be skipped.

### Example:

```robot
*** Keywords ***
Critical Operation
    [Tags]    robot:continue-on-failure
    Click    id=process  #ID does not exist, test will not stop running
    Log    Processing Completed
```

Using reserved tags wisely can enhance keyword execution control and improve test reliability. Read more about reserved tags in [Robot Guide Documentation](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#reserved-tags)

---

## Keyword Arguments

Robot Framework supports various types of arguments in keywords:

### Default Arguments

Default values ensure that the keyword works even when arguments are not explicitly provided.

```robot
*** Keywords ***
Greet User
    [Arguments]    ${name}=Guest
    Log    Hello, ${name}!
```

### Variable Number of Arguments

Useful when handling a dynamic number of inputs.

```robot
*** Keywords ***
Sum Numbers
    [Arguments]    @{numbers}
    ${result}=    Evaluate    sum(${numbers})
    Log    Sum is ${result}
```

### Free Named Arguments

Allows passing arguments using a dictionary.

```robot
*** Keywords ***
Print Details
    [Arguments]    &{details}
    Log    Name: ${details.name}, Age: ${details.age}
```

### Named-Only Arguments

Restricts the use of arguments to named parameters.

```robot
*** Keywords ***
Create User
    [Arguments]    ${username}    ${password}    ${role}=user
    Log    Creating user ${username} with role ${role}
```

---

## Embedding Arguments Into Keyword Name

You can embed arguments directly in keyword names, making test cases more readable and intuitive.

### Example:

```robot
*** Keywords ***
Login As ${username} With Password ${password}
    Open Browser    https://example.com    Chrome
    Type Text    id=username    ${username}
    Type Text    id=password    ${password}
    Click    id=login
```

This approach enhances readability by making keywords more self-explanatory.

---

## User Keyword Return Values

Keywords can return values using the `RETURN` statement, allowing them to act like functions.

### Example:

```robot
*** Keywords ***
Get Greeting
    [Arguments]    ${name}
    ${greeting}=    Set Variable    Hello, ${name}!
    RETURN    ${greeting}
```

---

## User Keyword Setup and Teardown

A keyword can have a setup and teardown using `[Setup]` and `[Teardown]`, ensuring proper initialization and cleanup.

### Example:

```robot
*** Keywords ***
Perform Test Steps
    [Setup]    Open Browser    https://example.com    chromium
    Click    id=test
    [Teardown]    Close Browser
```

---

## Private User Keywords

User keywords can be tagged with a special **robot:private** tag to indicate that they should only be used in the file where they are created:

### Example:

```robot
*** Keywords ***
Private Keyword
    [Tags]    robot:private
    Log    This is a private keyword
```

Using the **robot:private** tag does not outright prevent using the keyword outside the file where it is created, but such usages will cause a warning. If there is both a public and a private keyword with the same name, the public one will be used but also this situation causes a warning.

---

## Recursion in Robot Framework

User keywords can call themselves either directly or indirectly. This kind of recursive usage is fine as long as the recursion ends, typically based on some condition, before the recursion limit is exceeded. The limit exists because otherwise infinite recursion would crash the execution.

### Example:

```robot
*** Keywords ***
Fibonacci
    [Arguments]    ${n}
    Run Keyword If    ${n} <= 1    RETURN    ${n}
    ${a}=    Fibonacci    ${n-1}
    ${b}=    Fibonacci    ${n-2}
    ${result}=    Evaluate    ${a} + ${b}
    RETURN    ${result}
```

This method demonstrates the power of recursion within Robot Framework.

---

## Conclusion

Custom keywords are a fundamental feature in Robot Framework that enable better modularity, reusability, and readability of test scripts. By utilizing well-documented and structured keywords, teams can create scalable and maintainable test automation solutions. Whether handling arguments, embedding parameters, using return values, or leveraging setup and teardown, mastering user keywords ensures efficient test case development. Incorporating reserved tags and private keywords further enhances test execution control. By following best practices and structuring keywords effectively, testers can maximize the potential of Robot Framework in their automation projects.
