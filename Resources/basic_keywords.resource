*** Settings ***
Documentation     This is a test suite for testing the functionality of the application.


*** Variables ***


*** Keywords ***
First Keyword with one default arguments via Resource file
    [Documentation]    This is the first keyword with default arguments.
    [Arguments]    ${arg1}    ${arg2}=default2
    Log    This is the first keyword with default arguments: ${arg1}, ${arg2}.

First Keyword with one default arguments via Resource file With RETURN
    [Documentation]    This is the first keyword with default arguments.
    [Arguments]    ${arg1}    ${arg2}=default2
    Log    This is the first keyword with default arguments: ${arg1}, ${arg2}.
    RETURN    ${arg1}    ${arg2}

*** Comments ***
# This is a comment in the resource file.