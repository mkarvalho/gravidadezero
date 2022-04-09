*** Settings ***
Documentation       Shared Actions

Resource            ../Base.robot


*** Keywords ***
Modal Content Should Be
    [Arguments]    ${expected_text}

    ${title}    Set Variable    id=swal2-title
    ${content}    Set Variable    id=swal2-html-container

    Wait For Elements State    ${title}    visible    5
    Get Text    ${title}    equal    Oops...

    Wait For Elements State    ${content}    visible    5
    Get Text    ${content}    equal    ${expected_text}
