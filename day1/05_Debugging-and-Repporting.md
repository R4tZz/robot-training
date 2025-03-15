# Debugging and Reporting in Robot Framework with the Browser Library

Debugging is an essential part of test automation, helping to identify and resolve issues in test scripts efficiently. The Robot Framework Browser library, powered by Playwright, provides powerful tools for debugging, logging, and reporting to enhance test reliability and maintainability.

---

## Debugging Techniques

### 1. **Using `Debugging` Mode in the Browser Library**

The Browser library allows you to run tests in debugging mode using the `headless=False` option. This enables you to visually inspect the test execution.

```robot
*** Test Cases ***
Example Debugging
    New Browser    chromium    headless=${False}
    New Page    https://example.com
    Get Title    # Verify page title for debugging
    Close Browser
```

### 2. **Using Logs for Troubleshooting**

Robot Framework automatically logs test execution details. You can enhance this by using custom log messages:

```robot
Log    Checking element visibility
Click    id=submit-button
Log    Click action performed
```

You can also use:

```robot
Log To Console    This appears in the terminal output
```

### 3. **Tracing with the Browser Library**

The Browser library allows enabling tracing to capture execution details.

```robot
New Browser    chromium    headless=False
New Context    tracing=${True}
New Page    https://example.com
Close Context
Close Browser
```

If boolean True, the trace file will automatically be named trace\*{contextid}.zip. Temporary trace files will be saved to ${OUTPUT_DIR}/Browser/traces/temp. Tracing is automatically closed when context is closed. Temporary trace files will be automatically deleted at start of each test execution. Trace file can be opened after the test execution by running command from shell:

```bash
rfbrowser show-trace /path/to/trace.zip
```

### 4. **Debug Mode (`--loglevel TRACE`)**

Running tests with increased verbosity provides additional details:

```bash
robot --loglevel TRACE tests/
robot --loglevel DEBUG tests/
```

---

## Capturing Screenshots and Videos

### 1. **Taking Screenshots **

Manually capture screenshots at specific steps:

```robot
Take Screenshot    filename=screenshot.png
```

### 2. **Recording Videos**

Enable video recording for test runs:

```robot
New Context    recordVideo={'dir': 'videos/'}
New Page    https://example.com
Take Screenshot
Close Browser
```

Videos are saved in the specified directory for later review.

---

## Conclusion

By following these techniques, you can efficiently debug and troubleshoot Robot Framework tests using the Browser library, improving the stability and reliability of your automation efforts.
