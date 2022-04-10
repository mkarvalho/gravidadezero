*** Settings ***
Documentation       Base Test

Library             Browser
Library             Collections
Library             factories/Users.py
Library             Utils.py
#
Resource            Helpers.robot
Resource            Database.robot
#
Resource            actions/SignupActions.robot
Resource            actions/AuthActions.robot
Resource            actions/_SharedActions.robot
Resource            actions/GeekActions.robot


*** Variables ***
${BASE_URL}     https://getgeeks-mskarv.herokuapp.com
${BROWSER}
${HEADLESS}


*** Keywords ***
Start Session
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Page    ${BASE_URL}
    Set Viewport Size    1280    768

Finish Session
    ${screenshot_name}    Screenshot Name
    Take Screenshot    fullPage=True    filename=${screenshot_name}
