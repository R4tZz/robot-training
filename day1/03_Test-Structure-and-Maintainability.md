# Robot Framework Basic Structure

In Robot Framework, the structure of a test suite consists of several key components. These components define how the test is set up, executed, and organized. Here’s a breakdown of the basic structure:

## Sections

### 1. **Settings**

- **Purpose**: The settings section defines the environment for the test suite, such as imports, test setup, and test teardown. It allows you to import libraries, set test-level configurations, and specify resources.
- **Common Settings**:
  - `Library`: Imports libraries, like `Browser` (for Playwright).
  - `Resource`: Imports other Robot Framework resources containing keywords or variables.
  - `Variable`: Imports variables from external files.
  - `Suite Setup`: Defines actions to be run before any test case in the suite.
  - `Suite Teardown`: Defines actions to be run after all test cases in the suite.
  - `Test Setup`: Defines actions to be run before each test case.
  - `Test Teardown`: Defines actions to be run after each test case.

**Example**:

```robot
*** Settings ***
Library           Browser
Suite Setup       Setup Suite
Suite Teardown    Teardown Suite
Test Setup        Setup Test
Test Teardown     Teardown Test
```

### 2. **Variables**

- **Purpose**: The variables section allows you to define reusable values, like strings, numbers, or lists, that can be used throughout the test cases.
- **Types of Variables**:
  - Scalar variables (e.g., `${name} = John`).
  - List variables (e.g., `@{browsers} = Firefox Chrome`).
  - Dictionary variables (e.g., `&{user} = username=admin password=secret`).

**Example**:

```robot
*** Variables ***
${URL}            https://example.com
${BROWSER}        Chrome
@{CITIES}         New  York  Paris  Tokyo
```

### 3. **Test Cases**

- **Purpose**: Test cases are the core units of execution. Each test case contains a series of keywords that describe the actions to be performed during the test.
- **Test Case Structure**:
  - Test cases are defined using the `*** Test Cases ***` section.
  - Each test case name is followed by a sequence of keywords (actions).
  - Keywords can be either built-in or custom, and they can call other keywords, including tasks or functions.
  - A test case may include setups or teardowns specific to it.

**Example**:

```robot
*** Test Cases ***
Login Test
    [Documentation]    This test verifies the login functionality.
    Open Browser    ${URL}    ${BROWSER}
    Input Text       username_field    admin
    Input Text       password_field    secret
    Click Button     login_button
    Page Should Contain    Welcome, Admin
    Close Browser
```

### 4. **Tasks**

- **Purpose**: In addition to test automation, Robot Framework can be used for other automation purposes, including robotic process automation (RPA). It has always been possible, but Robot Framework 3.1 added official support for automating tasks, not only tests. For most parts creating tasks works the same way as creating tests and the only real difference is in terminology. Tasks can also be organized into suites exactly like test cases.
- **Tasks Section**:
  - You can define a task using the `*** Tasks ***` section.
  - Tasks contain a sequence of keywords to perform a specific action.

**Example**:

```robot
*** Tasks ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Login Page
    Close Browser
```

### 5. **Keywords**

- **Purpose**: Keywords are the building blocks of Robot Framework tests. They define specific actions or checks to be performed. Keywords can be built-in (like `Open Browser`, `Click Button`) or user-defined (custom keywords).
- **Custom Keywords**: You can define your own keywords in the `*** Keywords ***` section of the test suite.
  - Keywords can have setup, teardown, and test-like structures within them.
  - Custom keywords can help to modularize and reuse functionality.

**Example**:

```robot
*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Input Text      username_field    ${username}
    Input Text      password_field    ${password}
    Click Button    login_button
```

You can now call the `Login` keyword in your test case:

```robot
*** Test Cases ***
Successful Login
    Login    admin    secret
    Page Should Contain    Welcome, Admin
```

## Tagging, Documentation, and Logging in Robot Framework

In Robot Framework, **Tagging**, **Documentation**, and **Logging** are useful features that help organize tests, provide additional context, and track test execution. Here's an explanation of each:

### 1. **Tagging**

- **Purpose**: Tags are used to categorize tests, making it easier to run a subset of tests or identify specific test cases based on certain criteria. Tags are especially helpful when you have many tests in a suite and want to filter them for execution or reporting.
- **How to Use**:
  - Tags are defined by adding them after the test case name.
  - You can use multiple tags for a single test case.
- When running tests, you can filter tests by tags using the `--tag` option.
  - **Run Tests with a Specific Tag**: You can include tests with a specific tag.
  - **Exclude Tests with a Specific Tag**: You can exclude tests with a specific tag.

### 2. **Documentation**

- **Purpose**: Documentation provides an explanation of the test case, keyword, or task. It's used to add detailed information about the test's purpose, expected results, and any relevant context.
- **How to Use**:
  - You can add documentation to test cases, tasks, and keywords using the `[Documentation]` setting.
  - This is helpful for maintaining clarity in tests, especially when sharing test suites with a team.

### 3. **Logging**

- **Purpose**: Logging in Robot Framework helps track the progress of test execution and capture detailed information about what happens during the test run. Logs provide insights into which tests passed or failed, errors encountered, and any other runtime information.
- **Log Levels**:
  - Robot Framework supports different log levels: `INFO`, `DEBUG`, `WARN`, `ERROR`, and `TRACE`.
  - You can log messages at various points in your tests using the `Log` keyword. The messages are stored in the log file and can be viewed after the test execution.
- **Log Outputs**:
  - When tests are executed, Robot Framework generates log files:
    - **Log.html**: Contains detailed information about the test execution, including all logged messages, results, and execution details.
    - **Report.html**: A summary of the test execution, showing passed, failed, and skipped tests, and the overall result.
- **Log File Customization**:
  - You can control the verbosity of the log file with the `--loglevel` argument when running tests.

## Summary of Features:

- **Settings**: Configures libraries, resources, setups, and teardowns.
- **Variables**: Defines reusable data (scalars, lists, dictionaries).
- **Test Cases**: Contains test scenarios, with steps defined by keywords.
- **Tasks**: Can be used for other automation purposes, such as robotic process automation (RPA).
- **Keywords**: Actions or checks, either built-in or user-defined.
- **Tagging**: Helps organize tests by categories, which can be used to filter and group tests during execution.
- **Documentation**: Adds descriptive text to test cases, tasks, or keywords, helping others understand the purpose and expected behavior.
- **Logging**: Tracks the execution details and outputs log information for debugging and understanding test progress. Log levels can be customized to capture different types of messages.

These features enhance test management, maintainability, and traceability in Robot Framework.
