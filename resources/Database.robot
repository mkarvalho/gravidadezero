*** Settings ***
Documentation       Database Helpers

Library             DatabaseLibrary
Library             factories/Users.py


*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2
    ...    hsvqfgop
    ...    hsvqfgop
    ...    HULLVmYSrLaUTABH-UO62-UyfSuy8EXB
    ...    ruby.db.elephantsql.com
    ...    5432

Reset Env
    Execute Sql String    DELETE FROM public.geeks;
    Execute Sql String    DELETE FROM public.users;

Insert User
    [Arguments]    ${user}

    ${hashed_pass}    Get Hashed Pass    ${user}[password]

    ${query}    Set Variable
    ...    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${user}[name] ${user}[lastname]', '${user}[email]', '${hashed_pass}', false)

    Execute Sql String    ${query}

Users Seed
    ${user}    Factory User Login
    Insert User    ${user}
