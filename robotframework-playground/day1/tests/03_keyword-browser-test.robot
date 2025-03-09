*** Settings ***
Documentation       These test cases will focus on the browser keywords
...                 and how to use them, inclduing context and page keywords

Library             Browser
Library             Collections


*** Variables ***
${browser}      chromium
${headless}     ${False}
${url}          https://www.playwright.dev/
${timeout}      30s
${slow_mo}      1s


*** Test Cases ***
Configurations arguments for the browser
    [Documentation]    This will open a browser with the given configurations
    [Tags]    my_browser_tag
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    New Context    baseURL=${url}    locale="fi-FI"    viewport={"width": 1920, "height": 1024}    colorScheme=dark
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    Close Browser

Multi context
    [Documentation]    This will open a browser with multiple contexts
    [Tags]    my_browser_tag
    VAR    ${url}    https://www.google.com/
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    New Context    baseURL=${url}    locale=fi-FI    viewport={"width": 1920, "height": 1024}    colorScheme=dark
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    New Context    baseURL=${url}    locale=pt-PT    viewport={"width": 1920, "height": 1024}    colorScheme=light
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    Close Browser

Switch context
    [Documentation]    This will open a browser with multiple contexts and switch between them
    [Tags]    my_browser_tag
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    New Context    baseURL=${url}    locale=fi-FI    viewport={"width": 1920, "height": 1024}    colorScheme=dark
    ${ctx_dark}=    Get Context Ids    context=ACTIVE
    Log    ${ctx_dark}
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    New Context    baseURL=${url}    locale=pt-PT    viewport={"width": 1920, "height": 1024}    colorScheme=light
    ${ctx_light}=    Get Context Ids    context=ACTIVE
    Log    ${ctx_light}
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    Switch Context    ${ctx_dark}[0]
    Sleep    2s
    Take Screenshot    fullPage=${True}
    Close Browser

Multi page
    [Documentation]    This will open a browser with multiple pages
    [Tags]    my_browser_tag
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    New Context    baseURL=${url}    locale=fi-FI    viewport={"width": 1920, "height": 1024}    colorScheme=dark
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    New Page    /    wait_until=domcontentloaded
    Take Screenshot    fullPage=${True}
    Close Browser

 Context with mobile
    [Documentation]    This will open a browser with a specific device context
    [Tags]    my_browser_tag
    &{device}=    Get Device    iPhone 15 Pro Max landscape
    # &{device}=    Get Device    iPhone 15 Pro Max

    Log    ${device}

    ## Device details from Playwright
    # https://github.com/microsoft/playwright/blob/main/packages/playwright-core/src/server/deviceDescriptorsSource.json
    # "iPhone 15 Pro Max landscape": {
    #    "userAgent": "Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.4 Mobile/15E148 Safari/604.1",
    #    "screen": {
    #    "width": 430,
    #    "height": 932
    #    },
    #    "viewport": {
    #    "width": 814,
    #    "height": 380
    #    },
    #    "deviceScaleFactor": 3,
    #    "isMobile": true,
    #    "hasTouch": true,
    #    "defaultBrowserType": "webkit"
    #    },

    New Context
    ...    &{device}
    ...    baseURL=${url}
    ...    locale=fi-FI
    ...    colorScheme=dark
    New Page    /    wait_until=domcontentloaded
    Take Screenshot
    Close Browser
