# Robot Framework Variables

## Introduction

Variables in Robot Framework make test scripts dynamic and reusable. They allow storing values, lists, dictionaries, and system environment values. Robot Framework also provides special variables and escape characters to manage test data efficiently. In this guide, we explore the different types of variables, their usage, scope, and best practices.

---

## Types of Variables in Robot Framework

Robot Framework supports several types of variables:

1. **Scalar Variables** (`${variable}`) - Hold a single value.
2. **List Variables** (`@{list_variable}`) - Hold multiple values in a list.
3. **Dictionary Variables** (`&{dict_variable}`) - Hold key-value pairs.
4. **Environment Variables** (`%{env_variable}`) - Retrieve system environment variables.
5. **Special Variables** - Predefined variables like `${EMPTY}`, `${SPACE}`, and `${\n}`.

---

## Variable Scope

Variables in Robot Framework can have different scopes:

1. **Global Scope** - Available throughout the entire test execution.
2. **Suite Scope** - Available within a single test suite.
3. **Test Scope** - Available only within a single test case.
4. **Local Scope** - Available only within a keyword.
5. **Suites Scope** - Available within the current suite and in its child suites.

### **Example:**

```robotframework
*** Variables ***
${GLOBAL_VAR}    Global Value

*** Test Cases ***
Test Case 1
    ${LOCAL_VAR}=    Set Variable    Local Value
    Log    ${GLOBAL_VAR}    # Outputs: Global Value
    Log    ${LOCAL_VAR}    # Outputs: Local Value
```

To set a variable globally:

```robotframework
*** Test Cases ***
Set Global Variable
    Set Global Variable    ${GLOBAL_VAR}    New Global Value
```

---

## 1. Scalar Variables

Scalar variables store single values and are prefixed with `$`.

### **Example:**

```robotframework
*** Variables ***
${NAME}       John Doe
${AGE}        30
${GREETING}   Hello, ${NAME}!

*** Test Cases ***
Example Scalar Variable
    Log    ${GREETING}    # Outputs: Hello, John Doe!
```

---

## 2. List Variables

List variables store multiple values and are prefixed with `@`.

### **Example:**

```robotframework
*** Variables ***
@{COLORS}   Red   Green   Blue

*** Test Cases ***
Example List Variable
    Log    @{COLORS}[0]   # Outputs: Red
    Log    @{COLORS}[1]   # Outputs: Green
```

---

## 3. Dictionary Variables

Dictionary variables store key-value pairs and are prefixed with `&`.

### **Example:**

```robotframework
*** Variables ***
&{PERSON}    name=John    age=30    city=New York

*** Test Cases ***
Example Dictionary Variable
    Log    &{PERSON}[name]   # Outputs: John
    Log    &{PERSON}[age]    # Outputs: 30
```

---

## 4. Environment Variables

Environment variables allow access to system environment values.

### **Example:**

```robotframework
*** Test Cases ***
Read Environment Variable
    Log    %{HOME}   # Outputs the HOME directory path (Linux/macOS)
```

---

## 5. Built-in Variables

Robot Framework provides predefined special variables:

| Variable                 | Description                                        |
| ------------------------ | -------------------------------------------------- |
| `${EMPTY}`               | An empty string (`""`).                            |
| `${SPACE}`               | A single space (`" "`).                            |
| `${\n}`                  | A newline character.                               |
| `${True}` / `${False}`   | Boolean values.                                    |
| `${None}`                | Represents a `None` value.                         |
| `${CURDIR}`              | The current working directory.                     |
| `${TEMPDIR}`             | The system's temporary directory.                  |
| `${EXECDIR}`             | The directory where the test execution started.    |
| `${TEST NAME}`           | The name of the currently running test.            |
| `${SUITE NAME}`          | The name of the current test suite.                |
| `${SUITE DOCUMENTATION}` | The documentation of the test suite.               |
| `${KEYWORD STATUS}`      | The execution status of the last executed keyword. |
| `${LOG LEVEL}`           | The current log level.                             |

### **Examples:**

```robotframework
*** Test Cases ***
Using Special Variables
    Log    "Start${SPACE}End"   # Outputs: Start End
    Log    "Line1${\n}Line2"   # Outputs two lines
    Log    Current Directory: ${CURDIR}
    Log    Execution Started From: ${EXECDIR}
    Log    Current Test Name: ${TEST NAME}
```

Read more about built-variables in here:
[Robot Built-in Variables User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables)

---

## Escape Characters in Robot Framework

Some characters need escaping in Robot Framework. Use a backslash (`\`) for escaping.

| Character       | Escape Sequence |
| --------------- | --------------- |
| `{` / `}`       | `\{` / `\}`     |
| `[` / `]`       | `\[` / `\]`     |
| `\` (backslash) | `\\`            |

### **Example:**

```robotframework
*** Test Cases ***
Escape Characters Example
    Log    \{Escaped Braces\}   # Outputs: {Escaped Braces}
    Log    \[Escaped Brackets\] # Outputs: [Escaped Brackets]
```

---

## Conclusion

Understanding variables and their scopes is essential for writing maintainable and flexible test cases in Robot Framework. Using the right type of variable, along with special variables, can make test scripts more efficient and easier to manage. By leveraging these features, test automation becomes more structured, adaptable, and scalable.

Read more about variables in here:
[Robot User Guide - Variables](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#variables)
