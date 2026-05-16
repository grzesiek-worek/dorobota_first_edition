*** Settings ***
Documentation     This is a test suite for testing the functionality of the application.


*** Variables ***


*** Keywords ***
Adv Sample Keyword with one default arguments
    [Documentation]    This is the first keyword with default arguments ${arg1}.
    [Arguments]    ${arg1}    ${arg2}=default2
    Log    This is the first keyword with default arguments: ${arg1}, ${arg2}.

Simple Keyword For Dupication Check
    [Documentation]    This is a simple check keyword.
    Log    This is a simple check keyword.

*** Comments ***
# This is a comment in the resource file.