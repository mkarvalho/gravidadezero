*** Settings ***
Documentation       Sessions Route

Resource            ../Base.robot


*** Keywords ***
POST Session
    [Arguments]    ${payload}
    ${response}    POST
    ...    ${API_USERS}/sessions
    ...    json=${payload}
    ...    expected_status=any

    RETURN    ${response}
