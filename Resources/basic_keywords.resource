*** Settings ***
Documentation     This is a test suite for testing the functionality of the application.


*** Variables ***


*** Keywords *** 
First Keyword with one default arguments via Resource file With RETURN
    [Documentation]    This is the first keyword with default arguments.
    [Arguments]    ${arg1}    ${arg2}=default2
    Log    This is the first keyword with default arguments: ${arg1}, ${arg2}.
    RETURN    ${arg1}    ${arg2}

Keyword with argument in name ${arg1}
    [Documentation]    This is a keyword with argument in name.
    Log    This is a keyword with argument in name: ${arg1}.

Keyword with argument in name ${arg1} and Arguments
    [Documentation]    This is a keyword with argument in name.
    [Arguments]    ${arg2}
    Log    This is a keyword with argument in name: ${arg1}, ${arg2}.

Simple Keyword For Dupication Check
    [Documentation]    This is a simple check keyword.
    Log    This is a simple check keyword.

Keyword with IF
    [Documentation]    This is a keyword with IF.
    [Arguments]    ${arg1}
    IF    '${arg1}' == 'value1'
        Log    This is value 1.
    ELSE IF    '${arg1}' == 'value2'
        Log    This is value 2.
    ELSE
        Log    This is another value.
    END

Keyword With WHILE
    [Documentation]    This is a keyword with WHILE.
    [Arguments]    ${arg1}
    ${counter}=    Set Variable    0
    WHILE    ${counter} < ${arg1}
        Log    Counter: ${counter}
        ${counter}=    Evaluate    ${counter} + 1
    END

Keyword With TRY EXCEPT FINALLY
    [Documentation]    This is a keyword with TRY EXCEPT.
    [Arguments]    ${arg1}
    TRY
        Log    This is a try block with argument: ${arg1}.
        ${result}=    Evaluate    10 / ${arg1}
        Log    Result: ${result}
    EXCEPT
        Log    An error occurred while trying to divide by ${arg1}.
    FINALLY
        Log    This is the finally block.
    END

Keyword For CHECK_VAR_SCOPE - Resource level
    [Documentation]    This is a keyword to check variable scope.
    Log    ${CHECK_VAR_SCOPE}

Keyword For CHECK_VAR_SCOPE - Resource level - Overwrite
    [Documentation]    This is a keyword to check variable scope.
    VAR    ${CHECK_VAR_SCOPE}    This is a variable in the keyword scope.
    Log    ${CHECK_VAR_SCOPE}

Keyword For CHECK_VAR_SCOPE - Resource level - Overwrite with Arguments
    [Documentation]    This is a keyword to check variable scope.
    [Arguments]    ${CHECK_VAR_SCOPE}
    Log    ${CHECK_VAR_SCOPE}

Keyword For CHECK_VAR_SCOPE - Resource level - Overwrite with Arguments with Default Value
    [Documentation]    This is a keyword to check variable scope.
    [Arguments]    ${CHECK_VAR_SCOPE}=Overwrite with Arguments with Default Value
    Log    ${CHECK_VAR_SCOPE}
    Temp Nested Keyword

Temp Nested Keyword
    [Documentation]    This is a temporary nested keyword.
    Log    This is a temporary nested keyword.
    Log    ${CHECK_VAR_SCOPE}

Keyword For CHECK_VAR_SCOPE - Resource level - Overwrite By Set
    [Documentation]    This is a keyword to check variable scope.
    # VAR    ${CHECK_VAR_SCOPE}    This is a variable in the keyword scope.    GLOBAL
    Set Global Variable    ${CHECK_VAR_SCOPE}    This is a variable in the keyword scope.
    Temp Nested Keyword

*** Comments ***
# This is a comment in the resource file.