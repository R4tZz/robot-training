*** Settings ***
Documentation       This test will navigate to the demoqa.com elements page
...                 and click on the Iframe element. After it will validate if the correct

Library             Browser


*** Variables ***
${browser}                  chromium
${headless}                 ${False}
${url}                      https://demoqa.com
${timeout}                  30s
${slow_mo}                  1s
${iframe_url}               https://demoqa.com/frames
${iframe_selector}          iframe#frame1
${iframe_text}              This is a sample page

${letcode_shadow_url}       https://letcode.in/shadow


*** Test Cases ***
Get Iframe Text
    [Documentation]    This test will navigate to the demoqa.com Frames page
    ...    and validate the text of the iframe.
    [Tags]    iframe    robot:continue-on-failure
    New Browser    browser=${browser}    headless=${headless}    slowMo=${slow_mo}    timeout=${timeout}
    New Page    ${iframe_url}    wait_until=domcontentloaded
    Wait For Elements State    ${iframe_selector}    visible
    Get Text    h1
    Get Text    ${iframe_selector} >>> h1
    Get Text    iframe#frame2 >>> h1
