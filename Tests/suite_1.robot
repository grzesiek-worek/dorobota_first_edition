*** Settings ***
Documentation     This is a test suite for Browser library.

Suite Setup
Suite Teardown

Test Setup
Test Teardown

Task Tags    regression

*** Variables ***
${typu_str1}    ASDDASDAS
${typu_str2}    asd
@{typu_list}    ASDDASDAS    asd    123456
&{typu_dict}    key1=value1    key2=value2    key3=value3
${typu_int}    123456


*** Test Cases ***
Example Test Case - Simple Log
    [Documentation]    This is the first test case.
    [Tags]    smoke
    Log    Hello, World!
    Log    ${typu_str1}
    Log    ${typu_list}
    Log    ${typu_dict}

    # To nie zadziała ponieważ drugi argumetn "asd" będzie dopasowany jako level= z Log, a nie jako argument do logowania, dlatego nie można podać go z @
    # Log     @{typu_list}
    # To nie zadziała ponieważ rozpakujemy dictionary jako key1=value1, key2=value2, key3=value3, a keyword "Log" nie przyjmuje parametrów typu key1 etc... tylko message, level, etc...
    # Log     &{typu_dict}

Example Test Case - First Keyword
    [Documentation]    This is the first test case.
    [Tags]    smoke
    First Keyword

Example Test Case - First Keyword with arguments
    [Documentation]    This is the first test case.
    [Tags]    smoke
    First Keyword with arguments    arg1_value    arg2_value

Example Test Case - Create Variables in Robot Framework
    [Documentation]    This is the first test case.
    [Tags]    smoke
    ${var_str1}    Set Variable    ASDDASDAS
    ${var_str2}    Set Variable    asd
    ${lst_1}    Create List    ASD1    ASD2    ASD3
    ${dict_1}    Create Dictionary    key1=value1    key2=value2    key3=value3
    VAR    ${var_str3}    exmaple_var
    VAR    @{var_str3}    exmaple_var1    exmaple_var2
    VAR    &{var_str3}    key1=value1    key2=value2    key3=value3

Exemple Test Case - Loop with List
    [Documentation]    This is the first test case.
    ...    LINK_QTEST/REQ/DOC/WIKI
    ...
    ...    *Steps / Expected Results:*
    ...    1. Step 1 / pass
    ...    2. Step 2 / fail
    ...
    ...    *Requirements:*
    ...    ID/NUMER/WORKITEM_ID - e.g ABS-123456
    ...
    ...    *Expected:*
    ...    1. Expected result 1
    ...    - This test should pass if the expected result is met.
    [Tags]    smoke
    @{lst_1}    Create List    ASD1    ASD2    ASD3    

    # List
    Keyword Loop with Created List   ${lst_1}
    # ${lst_1}   trafi jako "rozpakowany" argument bo jest podane z @
    Keyword Loop with Dynamic List    arg1    arg2    arg3   arg4    arg5    arg6    arg7    arg8    arg9    arg10    @{lst_1}
    # ${lst_1}   trafi jako jeden argument do pentli, a nie jako lista, dlatego trzeba rozpakować listę za pomocą @
    Keyword Loop with Dynamic List    arg1    arg2    arg3   arg4    arg5    arg6    arg7    arg8    arg9    arg10    ${lst_1}

Exemple Test Case - Loop with Dictionary
    [Documentation]    This is the first test case.
    ...    LINK_QTEST/REQ/DOC/WIKI
    ...
    ...    *Steps / Expected Results:*
    ...    1. Step 1 / pass
    ...    2. Step 2 / fail
    ...
    ...    *Requirements:*
    ...    ID/NUMER/WORKITEM_ID - e.g ABS-123456
    ...
    ...    *Expected:*
    ...    1. Expected result 1
    ...    - This test should pass if the expected result is met.
    ${dict_1}    Create Dictionary    key1=value1    key2=value2    key3=value3
    # Dictionary
    Keyword Loop with Created Dictionary   ${dict_1}
    Keyword Loop with Dynamic Dictionary   user1=data1    user2=data2    user3=data3    &{dict_1}
    # Tutaj dict_1 trafi jako jeden argument do pentli, a nie jako słownik, dlatego trzeba rozpakować słownik za pomocą &, w innym przypadku kod sie wywali
    # Keyword Loop with Dynamic Dictionary   user1=data1    user2=data2    user3=data3    ${dict_1}


*** Keywords ***
First Keyword
    [Documentation]    This is the first keyword.
    Log    This is the first keyword.

First Keyword with arguments
    [Documentation]    This is the first keyword with arguments.
    [Arguments]    ${arg1}    ${arg2}
    Log    This is the first keyword with arguments: ${arg1}, ${arg2}.

Keyword Loop with Created List
    [Documentation]    This is a keyword with a loop.
    [Arguments]    ${list}
    FOR    ${item}    IN    @{list}
        Log    ${item}
    END

Keyword Loop with Dynamic List
    [Documentation]    This is a keyword with a loop for dictionary.
    [Arguments]    @{dynamic_list}
    FOR    ${item}    IN    @{dynamic_list}
        Log    ${item}
    END

Keyword Loop with Created Dictionary
    [Documentation]    This is a keyword with a loop for dictionary for log only keys.
    [Arguments]    ${dict}
    FOR    ${key}    IN    @{dict.keys()}
        Log    ${key}
    END

Keyword Loop with Dynamic Dictionary    
    [Documentation]    This is a keyword with a loop for dictionary for log only keys.
    [Arguments]    &{dict}
    FOR    ${key}    IN    @{dict.keys()}
        Log    ${key}
    END

*** Comments ***
# This is a comment in the test suite.