*** Settings ***
Documentation       Login Test Suite

Resource            ../resources/Base.robot

Test Setup          Start Session
Test Teardown       Finish Session


*** Test Cases ***
User Login
    ${user}    Factory User Login

    Add User From Database    ${user}

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]    inv_pass

    ${user}    Create Dictionary    email=user@email.com    password=incorrectpassword
    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

User not found
    [Tags]    user_404

    ${user}    Create Dictionary    email=user404@email.com    password=pwd123
    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be    Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]    inv_email

    ${user}    Create Dictionary    email=user&email.com    password=pwd123
    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Should Be Type Email
