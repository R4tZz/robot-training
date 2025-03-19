*** Settings ***
Documentation       API test example using Robot Framework and Browser library.
...                 This test will use fakeStore API to perform requests and validate their responses.
...                 It will also demonstrate how to use the Browser library to interact with the API.

Library             Browser


*** Variables ***
${API_URL}                  https://fakestoreapi.com
${TIMEOUT}                  30s
${HEADLESS}                 ${False}
${SLOW_MO}                  1s
${BROWSER}                  chromium
${API_URL_PRODUCTS}         ${API_URL}/products
${API_URL_PRODUCT_ID}       ${API_URL}/products/1
&{HEADERS}                  Content-Type=application/json    accept=application/json


*** Test Cases ***
API Test Example
    [Documentation]    This test will perform API requests and validate the responses.
    New Browser    browser=${BROWSER}    headless=${HEADLESS}    slowMo=${SLOW_MO}    timeout=${TIMEOUT}
    New Page    ${API_URL}    wait_until=domcontentloaded

    # GET request to fetch all products
    ${response}=    Http    ${API_URL_PRODUCTS}    method=GET    headers=${HEADERS}
    Should Be Equal As Integers    ${response.status}    200
    Log    ${response.body}

    FOR    ${product}    IN    @{response.body}
        Log    ${product.title}
        Log    ${product.price}
        Log    ${product.description}
        Log    ${product.category}
        Log    ${product.image}
        Log    ${product.rating.rate}
        Log    ${product.rating.count}
    END

    # GET request to fetch a single product by ID
    ${response}=    Http    ${API_URL_PRODUCT_ID}    method=GET    headers=${HEADERS}
    Should Be Equal As Integers    ${response.status}    200
    Log    ${response.body}

    ${product_name}=    Set Variable    ${response.body.title}
    Log    ${product_name}

    ## Important note: Sometimes we have to covert the response to a dictionary
    # To avoid the error -> TypeError: Expected argument 1 to be a dictionary or dictionary-like object, got string instead
    # Not sure if they fixed it in the latest versions of Robot Framework Browser library
    ## Example how to convert the response to a dictionary:
    # ${response_body}=    Evaluate    dict(${response.body})

    # POST request to create a new product
    ${new_product}=    Create Dictionary
    ...    title=New Product
    ...    price=19.99
    ...    description=This is a new product
    ...    category=electronics
    ...    image=https://example.com/image.jpg
    ${type}=    Evaluate    type(${new_product})
    Log    ${type}
    Log    ${new_product}

    ${json_product}=    Evaluate    json.dumps(${new_product})
    ${type}=    Evaluate    type(${json_product})
    Log    ${type}
    Log    ${json_product}

    ## The dictionary is converted to a JSON or it will fail when sending the request
    # Read more about the json.dumps() function here: https://www.geeksforgeeks.org/json-dump-in-python/
    ${response}=    Http    ${API_URL_PRODUCTS}    method=POST    headers=${HEADERS}    body=${json_product}

    ## Try to send the dictionary directly without converting it to JSON
    # ${response}=    Http    ${API_URL_PRODUCTS}    method=POST    headers=${HEADERS}    body=${new_product}
    Should Be Equal As Integers    ${response.status}    200
    Log    ${response.body}
