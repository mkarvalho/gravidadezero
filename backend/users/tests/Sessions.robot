*** Settings ***
Documentation       Session Route Test Suite

Resource            ../resources/Base.robot


*** Test Cases ***
User Session
    ${payload}    Create Dictionary    email=kim@dot.com    password=pwd123

    ${response}    POST Session    ${payload}

    Status Should Be    200    ${response}

    ${size}    Get Length    ${response.json()}[token]
    ${expected_size}    Convert To Integer    140

    Should Be Equal    ${expected_size}    ${size}
    Should Be Equal    10d    ${response.json()}[expires_in]

Incorrect Pass
    ${payload}    Create Dictionary    email=kim@dot.com    password=abc123

    ${response}    POST Session    ${payload}

    Status Should Be    401    ${response}
    Should Be Equal    Unauthorized    ${response.json()}[error]

User Not Found
    ${payload}    Create Dictionary    email=kim@404.com    password=abc123

    ${response}    POST Session    ${payload}

    Status Should Be    401    ${response}
    Should Be Equal    Unauthorized    ${response.json()}[error]

Incorrect Email
    ${payload}    Create Dictionary    email=kim&email.com    password=abc123

    ${response}    POST Session    ${payload}

    Status Should Be    400    ${response}
    Should Be Equal    Incorrect email    ${response.json()}[error]

Empty Email
    ${payload}    Create Dictionary    email=${EMPTY}    password=abc123

    ${response}    POST Session    ${payload}

    Status Should Be    400    ${response}
    Should Be Equal    Required email    ${response.json()}[error]

Without Email
    ${payload}    Create Dictionary    password=abc123

    ${response}    POST Session    ${payload}

    Status Should Be    400    ${response}
    Should Be Equal    Required email    ${response.json()}[error]

Empty Pass
    ${payload}    Create Dictionary    email=kim@dot.com    password=${EMPTY}

    ${response}    POST Session    ${payload}

    Status Should Be    400    ${response}
    Should Be Equal    Required pass    ${response.json()}[error]

Without Pass
    ${payload}    Create Dictionary    email=kim@dot.com

    ${response}    POST Session    ${payload}

    Status Should Be    400    ${response}
    Should Be Equal    Required pass    ${response.json()}[error]
