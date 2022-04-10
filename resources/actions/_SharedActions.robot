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

Alert Span Should Be
    [Arguments]    ${expected_alert}

    Wait For Elements State    css=span[class=error]    visible    5

    ${span}    Get Element    css=span[class=error]

    ${text_error}    Get Text    ${span}

    Should Be Equal    ${text_error}    ${expected_alert}

Alert Spans Should Be
    [Arguments]    ${expected_alerts}

    @{got_alerts}    Create List

    ${spans}    Get Elements    xpath=//span[@class="error"]

    FOR    ${span}    IN    @{spans}
        ${text}    Get Text    ${span}
        Append To List    ${got_alerts}    ${text}
    END

    Lists Should Be Equal    ${expected_alerts}    ${got_alerts}
