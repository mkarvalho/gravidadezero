*** Settings ***
Documentation       Base Test

Library             Browser
Library             Collections
Library             factories/Users.py
Resource            Helpers.robot
Resource            Database.robot
Resource            actions/SignupActions.robot
Resource            actions/AuthActions.robot
Resource            actions/_SharedActions.robot


*** Variables ***
${BASE_URL}     https://getgeeks-mskarv.herokuapp.com


*** Keywords ***
Start Session
    New Browser    chromium    headless=False
    New Context    viewport={'width': 1440, 'height': 900}
    New Page    ${BASE_URL}

Finish Session
    Take Screenshot
