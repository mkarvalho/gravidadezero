*** Settings ***
Documentation       Test Helpers

Resource            Base.robot


*** Keywords ***
Add User From Database
    [Arguments]    ${user}

    Connect To Postgres
    Insert User    ${user}
    Disconnect From Database
