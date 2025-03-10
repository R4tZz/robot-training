*** Settings ***
Documentation       These test cases will focus on how to debug and reporting.
...                 This will include using the tracing and logging capabilities of Robot Framework and Playwright.

Library             Browser


*** Variables ***
${browser}      chromium
${headless}     ${False}
${url}          https://www.playwright.dev/
${timeout}      30s
${slow_mo}      1s


*** Test Cases ***
Log Levels
    [Documentation]    This test will log messages with different levels
    [Tags]    my_browser_tag
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    New Context    baseURL=${url}    locale="fi-FI"    viewport={"width": 1920, "height": 1024}    colorScheme=dark
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    Log    This is a log message
    Log    This is another log message
    Log    This is a warning message    WARN
    Log    This is an error message    ERROR
    Log    This is a debug message    DEBUG
    Log    This is a trace message    TRACE
    Close Browser
    ### Run this test case with the following command:
    ### robot -d results/ --loglevel TRACE tests/day1/05_debug-reporting-test.robot
    ### The loglevel argument will set the log level to TRACE and will display all the log messages.

Record video and Tracing
    [Documentation]    This test will record a video and trace the execution
    [Tags]    my_browser_tag
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    &{har} =    Create Dictionary
    ...    path=${OUTPUTDIR}/my_har_file.har
    ...    omitContent=True
    &{video} =    Create Dictionary    dir=./
    New Context
    ...    baseURL=${url}
    ...    locale="fi-FI"
    ...    viewport={"width": 1920, "height": 1024}
    ...    colorScheme=dark
    ...    tracing=${True}
    ...    recordHar=${har}
    ...    recordVideo=${video}
    New Page    /    wait_until=domcontentloaded
    Click    text=Docs
    Take Screenshot    fullPage=${True}
    Close Browser
    ### We can see the HAR file and the video in the results folder.
    ### The HAR file will contain the network traffic and to see this file we can load it in the browser by going to the Developer Tools -> Network -> Import HAR.
    ### The video will be a recording of the test execution.
    ### The tracing will be a zip file that contains the trace of the execution.
    ### Run the following command to see the trace:
    ### rfbrowser show-trace .\results\browser\traces\trace_context=<context_id>.zip
    ### The context_id can be found in the trace file name.
    ### Replace the context_id with the actual context_id.
