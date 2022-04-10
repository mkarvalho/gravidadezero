*** Settings ***
Documentation       Be Geek Test Suite

Resource            ../resources/Base.robot

Suite Setup         Start Session For Attempt Be Geek
Test Teardown       Finish Session
Test Template       Attempt Be A Geek


*** Variables ***
${long_desc}    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et tempor justo. Suspendisse sed ipsum ligula. Donec ac ipsum quis elit luctus imperdiet. Phasellus condimentum, metus vel faucibus pretium, turpis felis consequat velit, nec auctor elit sapien et erat. In tempor eros mauris, sit amet lacinia augue maximus sagittis.


*** Test Cases ***
Short Desc    desc    Formarto o seu PC    A descrição deve ter no minimo 80 caracteres
Long Desc    desc    ${long_desc}    A descrição deve ter no máximo 255 caracteres
Empty Desc    desc    ${EMPTY}    Informe a descrição do seu trabalho
Whats Only DDD    whats    11    O Whatsapp deve ter 11 digitos contando com o DDD
Whays Without DDD    whats    999999999    O Whatsapp deve ter 11 digitos contando com o DDD
Whats Empty    whats    ${EMPTY}    O Whatsapp deve ter 11 digitos contando com o DDD
Cost Only Letters    cost    aaaa    Valor hora deve ser numérico
Cost Numbers And Letters    cost    aa123    Valor hora deve ser numérico
Cost Special Chars    cost    !@@#    Valor hora deve ser numérico
Cost Empty    cost    ${EMPTY}    Valor hora deve ser numérico


*** Keywords ***
Attempt Be A Geek
    [Arguments]    ${key}    ${input_field}    ${output_message}

    ${user}    Factory User    attempt_be_geek

    Set To Dictionary    ${user}[geek_profile]    ${key}    ${input_field}

    Fill Geek Form    ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be    ${output_message}

Start Session For Attempt Be Geek
    ${user}    Factory User    attempt_be_geek

    Start Session
    Do Login    ${user}
    Go To Geek Form
