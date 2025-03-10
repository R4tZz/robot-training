*** Settings ***
Documentation       These test cases will focus on the interaction with
...                 the elements on the page. This includes clicking, typing, and
...                 waiting for elements to be in a certain state.

Library             Browser

Suite Setup         Setup Browser For Interactive Tests
Suite Teardown      Tear Down Browser


*** Variables ***
${browser}      chromium
${headless}     ${False}
${url}          https://demoqa.com
${timeout}      30s
${slow_mo}      1s


*** Test Cases ***
Click on Element and Type Text
    [Documentation]    This test will navigate to the demoqa.com elements page
    ...    and click on the Text Box element. After it will type in
    ...    the Full Name input field the John Doe name and take a screenshot.
    New Page    /elements    wait_until=domcontentloaded
    Wait For Elements State    //li[contains(.,'Text Box')]    visible
    Click    //li[contains(.,'Text Box')]
    Wait For Condition    URL    $=    /text-box
    Wait For Elements State    css=input[placeholder='Full Name']    visible
    Type Text    css=input[placeholder='Full Name']    John Doe
    Take Screenshot    fullPage=${True}
    Close Browser

Finding Elements
    [Documentation]    This test will navigate to the demoqa.com elements page
    ...    and use different methods of finding elements on the page.
    New Page    /elements    wait_until=domcontentloaded
    Wait For Elements State    //li[contains(.,'Text Box')]    visible
    Click    //li[contains(.,'Text Box')]
    Wait For Elements State    css=input[placeholder='Full Name']    visible
    Type Text    css=input[placeholder='Full Name']    John Doe
    Type Text    id=userEmail    some@email.com
    Fill Text    xpath=//textarea[@placeholder='Current Address']    some address
    ${permanent_address_element}=    Get Element    \#permanentAddress
    Type Text    ${permanent_address_element}    some permanent address    clear=${False}
    Type Text    ${permanent_address_element}    ${SPACE}some edit    clear=${False}    delay=1s
    Fill Text    ${permanent_address_element}    another edit and now it is clean
    Click    text=Submit
    Wait For Elements State    css=div#output    visible
    Take Screenshot    fullPage=${True}
    Close Browser

Click Interaction
    [Documentation]    This test will navigate to the demoqa.com elements page
    ...    and click on the Button elements. After it will validate if the correct
    ...    labels are display and in the end take a screenshot.
    New Page    /buttons    wait_until=domcontentloaded
    Wait For Elements State    //li[contains(.,'Buttons')]    visible
    Click    //li[contains(.,'Buttons')]
    Wait For Condition    URL    $=    /buttons
    Wait For Elements State    id=doubleClickBtn    visible
    Click With Options    id=doubleClickBtn    clickCount=2    delay=200ms
    Wait For Elements State    id=doubleClickMessage    visible
    Get Text    id=doubleClickMessage    ==    You have done a double click
    Click    id=rightClickBtn    button=right
    Wait For Elements State    id=rightClickMessage    visible
    Get Text    id=rightClickMessage    ==    You have done a right click
    ## Click with dynamic id
    # Ways to find the element with dynamic id in the page by using xpath or other methods
    # 1. //button[normalize-space(text())='Click Me']
    # 2. (//button[@class='btn btn-primary'])[3]
    # 3. Get Element By Role    button    name=Click Me
    ${BTN_LOC}=    Get Element By Role    button    name=Click Me    exact=Yes
    Click    ${BTN_LOC}
    Wait For Elements State    id=dynamicClickMessage    visible
    Get Text    id=dynamicClickMessage    ==    You have done a dynamic click
    Take Screenshot    fullPage=${True}
    Close Browser

Broken Links Http Responses
    [Documentation]    This test will navigate to the demoqa.com links page
    ...    and validate the http responses of the links on the page.
    New Page    /links    wait_until=domcontentloaded
    Wait For Elements State    //li[starts-with(.,'Links')]
    Click    //li[starts-with(.,'Links')]
    Wait For Condition    URL    $=    /links
    # https://marketsquare.github.io/robotframework-browser/Browser.html#Wait%20For%20Response
    # Read more about the Wait For Response keyword and syncrounous and asyncrounous examples
    ${promise}=    Promise To
    ...    Wait For Response
    ...    response => response.url() === 'https://demoqa.com/created' && response.status() === 201
    Click    id=created
    Wait For    ${promise}
    Wait For Elements State    id=linkResponse    visible
    Get Text    id=linkResponse    ==    Link has responded with staus 201 and status text Created
    ${promise}=    Promise To    Wait For Response    **/no-content
    Click    id=no-content
    Wait For    ${promise}
    Wait For Elements State    id=linkResponse    visible
    Get Text    id=linkResponse    ==    Link has responded with staus 204 and status text No Content
    Take Screenshot    fullPage=${True}
    Close Browser

Practice Form
    [Documentation]    This test will navigate to the demoqa.com practice form page
    ...    and fill in the form with the given data and submit the form.
    New Page    /automation-practice-form    wait_until=domcontentloaded
    Wait For Elements State    id=firstName    visible
    Type Text    id=firstName    John
    Type Text    id=lastName    Doe
    Type Text    id=userEmail    some@email.com

    ## Sometimes the checkbox are not clickable, so we need to force the click or select the divbox
    Click    (//div[contains(@class,'custom-control custom-radio')])[1]
    Check Checkbox    input[value='Female']    force=${True}

    Type Text    id=userNumber    1234567890

    ## Dealing with date pickers
    # 1. First example - clicks on the second available
    Click    id=dateOfBirthInput
    Click    (//div[@role='option'])[2]
    ${date_value}=    Get Text    id=dateOfBirthInput
    Log    ${date_value}
    # 2. Second example - javascript to select the date
    ${date_picker}=    Get Element    id=dateOfBirthInput
    Evaluate JavaScript    ${date_picker}    (elem) => elem.value = '11 Feb 2025'
    ${date_value}=    Get Text    id=dateOfBirthInput
    Log    ${date_value}
    # 3. Third example - using the picker options
    Click    id=dateOfBirthInput
    Select Options By    css=.react-datepicker__month-select    text    February
    Select Options By    css=.react-datepicker__year-select    text    1990
    Click    div.react-datepicker__month >> //div[@class='react-datepicker__day react-datepicker__day--021']
    ${date_value}=    Get Text    id=dateOfBirthInput
    Log    ${date_value}

    ## Please note that the Subjects input as a few bugs
    ## How to deal with auto-complete inputs and select it's element
    # 1. Open your DevTools and inspect the element
    # 2. Click on the input with your right moause button and add a break point, break on subtree modification
    # 3. Now fill the input with the text you want to select
    # 4. Click on the dropdown and select the element you want
    # 5. Copy the xpath or css selector and use it in the test case
    #
    # Another method could be to use the Get Property keyword to get the innerHTML of the element
    # Log the element to the report in robot and see the innerHTML

    Fill Text    css=input[id='subjectsInput']    En
    Wait For Elements State    //div[contains(@class,'subjects-auto-complete__menu-list')]    visible
    ${html}=    Get Property    //div[contains(@class,'subjects-auto-complete__menu-list')]    innerHTML
    Log    ${html}
    # <div
    #    class="subjects-auto-complete__option subjects-auto-complete__option--is-focused css-1n7v3ny-option"
    #    id="react-select-2-option-0"
    #    tabindex="-1"

    # >
    #    English

    # </div>

    # <div
    #    class="subjects-auto-complete__option css-yt9ioa-option"
    #    id="react-select-2-option-1"
    #    tabindex="-1"

    # >
    #    Computer Science

    # </div
    Press Keys    css=input[id='subjectsInput']    Enter
    Fill Text    css=input[id='subjectsInput']    H
    Wait For Elements State    css=div[id='react-select-2-option-0']    visible
    Click    css=div[id='react-select-2-option-0']

    Check Checkbox    input[id='hobbies-checkbox-1']    force=${True}
    Uncheck Checkbox    input[id='hobbies-checkbox-1']    force=${True}
    Check Checkbox    input[id='hobbies-checkbox-2']    force=${True}

    Upload File By Selector    id=uploadPicture    ./image1.png

    Type Text    id=currentAddress    Some address here

    ## Dealing with the state and city dropdowns
    # These dropdows are not the standard select elements, so we need to use a different approach
    # We use a click to open the dropdown and then click on the element we want
    # To get the elements use the break point method or the Get Property keyword
    Click    id=state
    Wait For Elements State    id=react-select-3-option-0    visible
    Click    id=react-select-3-option-0
    Click    id=city
    Wait For Elements State    id=react-select-4-option-0    visible
    Click    id=react-select-4-option-0

    Click    id=submit

    Wait For Elements State    div[class='modal-content']    visible
    Take Screenshot    fullPage=${True}


*** Keywords ***
Setup Browser For Interactive Tests
    New Browser    browser=${browser}    headless=${headless}    timeout=${timeout}    slowMo=${slow_mo}
    New Context    baseURL=${url}    locale=fi-FI    viewport={"width": 1920, "height": 1024}    colorScheme=dark
    Set Browser Timeout    15s    scope=Global

Tear Down Browser
    Close Browser
