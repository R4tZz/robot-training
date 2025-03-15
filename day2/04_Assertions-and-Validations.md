# Assertions and Validations

Assertions and validations are fundamental in test automation, ensuring that the actual outcomes align with expected results. In Robot Framework, validations can be performed using keywords that compare values, check element states, and verify interactions.

When working with web applications, the **Browser** library from Playwright provides a powerful set of keywords specifically designed for modern web testing. Below we will explore various assertion techniques using the Browser library, focusing on practical examples and best practices.

---

## Built-in Assertions in Robot Framework

Robot Framework provides a set of built-in keywords that allow for straightforward assertions. These keywords can be used for various validation checks, including numerical comparisons, string evaluations, and list operations.

### Common Built-in Assertion Keywords:

- **`Should Be Equal`** – Compares two values and fails if they are not equal.
- **`Should Not Be Equal`** – Fails if the values are equal.
- **`Should Contain`** – Checks if a string or list contains a specific value.
- **`Should Not Contain`** – Ensures a string or list does not contain a specific value.
- **`Should Be True`** – Fails if the given expression does not evaluate to `True`.
- **`Should Be False`** – Fails if the given expression evaluates to `True`.

### Example 1: Basic Assertions

```robot
*** Test Cases ***
Validate Basic Assertions
    ${value}    Set Variable    Hello Robot
    Should Be Equal    ${value}    Hello Robot
    Should Contain    ${value}    Robot
    ${number}    Set Variable    10
    Should Be True    ${number} > 5
    Should Be False    ${number} < 5
```

These built-in keywords are useful for validating calculations, text content, and logical conditions before moving on to web-based assertions.

---

## Understanding Assertions in the Browser Library

Assertions in the Browser library revolve around verifying page elements, interactions, and expected values. Unlike general-purpose Robot Framework built-in keywords, these assertions are tailored for web automation.

### Basic Assertion Keywords in the Browser Library:

- **`Get Text`** – Retrieves the text content of an element and allows direct assertion.
- **`Get Attribute`** – Fetches an attribute value from an element.
- **`Get Title`** – Retrieves the current page title.
- **`Wait For Elements State`** – Waits for an element to reach a particular state (e.g., `visible`, `hidden`, `enabled`, `disabled`).

### Example 2: Validating Page Title and Element Visibility

```robot
*** Settings ***
Library    Browser

*** Test Cases ***
Validate Page and Elements
    New Browser    browser=chromium    headless=False
    New Page    https://example.com
    Get Title    ==    Example Domain
    Wait For Elements State    css=h1    visible
    Get Text    css=h1    ==    Example Domain
    Close Browser
```

### Explanation:

- `New Browser` opens a Chromium instance.
- `New Page` navigates to the specified website.
- `Get Title` retrieves and asserts the current page’s title.
- `Wait For Elements State` ensures the `h1` element is visible.
- `Get Text` retrieves and asserts the `h1` text directly.
- `Close Browser` terminates the session.

---

## Assertion Operators in the Browser Library

When performing validations, the Browser library supports various assertion operators that help check specific conditions. These operators ensure flexible and precise validations.

### Assertion Operators:

The following table lists the assertion operators available in the Browser library of Robot Framework:

| Operator   | Alternative Operators          | Description                                                              | Validate Equivalent                |
| ---------- | ------------------------------ | ------------------------------------------------------------------------ | ---------------------------------- |
| `==`       | `equal`, `equals`, `should be` | Checks if returned value is equal to expected value.                     | `value == expected`                |
| `!=`       | `inequal`, `should not be`     | Checks if returned value is not equal to expected value.                 | `value != expected`                |
| `>`        | `greater than`                 | Checks if returned value is greater than expected value.                 | `value > expected`                 |
| `>=`       |                                | Checks if returned value is greater than or equal to expected value.     | `value >= expected`                |
| `<`        | `less than`                    | Checks if returned value is less than expected value.                    | `value < expected`                 |
| `<=`       |                                | Checks if returned value is less than or equal to expected value.        | `value <= expected`                |
| `*=`       | `contains`                     | Checks if returned value contains expected value as a substring.         | `expected in value`                |
|            | `not contains`                 | Checks if returned value does not contain expected value as a substring. | `expected not in value`            |
| `^=`       | `should start with`, `starts`  | Checks if returned value starts with expected value.                     | `re.search(f"^{expected}", value)` |
| `$=`       | `should end with`, `ends`      | Checks if returned value ends with expected value.                       | `re.search(f"{expected}$", value)` |
| `matches`  |                                | Checks if given RegEx matches at least once in returned value.           | `re.search(expected, value)`       |
| `validate` |                                | Checks if given Python expression evaluates to `True`.                   | `eval(expression) is True`         |
| `evaluate` | `then`                         | Evaluates a Python expression and returns the result.                    | `eval(expression)`                 |

---

## Advanced Assertions

### Example 3: Validating a Form Submission

```robot
*** Test Cases ***
Validate User Registration
    New Browser    browser=chromium    headless=False
    New Page    https://example.com/form
    Fill Text    css=input[name='username']    testuser
    Fill Text    css=input[name='password']    SecurePass123
    Click    css=button[type='submit']
    Wait For Condition
    ...     URL
    ...     $=
    ...     /success
    Wait For Elements State    css=.success-message    visible
    Get Element States    h1    validate    value & visible
    Get Text    css=.success-message    ==    Registration successful!
    Close Browser
```

### Breakdown:

- Fills username and password fields.
- Clicks the submit button.
- Waits for the condition "Get Url" to end with "/success".
- Waits for a success message to appear.
- Validates if the tag h1 is visible, fails if invisible.
- Retrieves and validates the success message text directly.

---

## Conclusion

Assertions and validations in Robot Framework’s Browser library enable robust and reliable web automation tests. By leveraging Playwright’s advanced capabilities, you can validate dynamic content, ensure correct UI behavior, and maintain test stability. Implementing best practices such as explicit waits and multiple attribute checks will further enhance the quality of your automation suite.

For more information visit [The Assertion Section From Browser Library](https://marketsquare.github.io/robotframework-browser/Browser.html#Assertions)
