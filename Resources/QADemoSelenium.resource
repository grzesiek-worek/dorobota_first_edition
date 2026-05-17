*** Settings ***
Documentation     This is a resource file that includes other resource files for testing the functionality of the application.
Resource          lib_handler.resource
Library          python${/}QADemo_helper.py
# Nazwa klasy MUSI być taka sama jak nazwa pliku!
Library          python${/}QADemoHelperClass.py


*** Variables ***
${xpath_elements}    //h5[text()='Elements']

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Open Browser To Login Page
    ...
    ...    *Steps*
    ...    1. Open Browser
    ...    2. Maximize Browser Window
    ...    3. Set Selenium Speed
    ...
    ...    *Arguments:*
    ...    | Name | Description | Example |
    ...    | ${url} | The URL of the login page | https://demoqa.com/ |
    ...    | ${browser} | The browser to use | chrome |
    ...    *Returns:*
    ...    | Data | Example |
    ...    | Nothing to return | None |
    [Arguments]    ${url}    ${browser}=chrome
    SeleniumLibrary.Open Browser    ${url}    ${browser}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed    0.5s

Close Browser
    [Documentation]    Close Browser
    ...
    ...    *Steps*
    ...    1. Close Browser
    ...    2. Maximize Browser Window
    ...    3. Set Selenium Speed
    ...
    ...    *Returns:*
    ...    | Data | Example |
    ...    | Nothing to return | None | 
    SeleniumLibrary.Close Browser

Main: Navigate To Elements Page
    [Documentation]    Main: Navigate To Elements Page
    ...
    ...    *Steps*
    ...    1. Click Element To Element Page
    ...
    ...    *Returns:*
    ...    | Data | Example |
    ...    | Nothing to return | None | 
    # Cleanup parametrów opcja 1, move to *** Varialbes ***
    SeleniumLibrary.Click Element    xpath=${xpath_elements}

Elements: Navigate To Text Box
    [Documentation]    This keyword navigates to the Text Box page.
    # Cleanup parametrów opcja 2, move to QADemo_xpath/text_box.resource
    SeleniumLibrary.Click Element    xpath=${xpath_text_box}

Navigate To Main Page
    [Documentation]    This keyword navigates to the main page.
    # Cleanup parametrów opcja 2, move to QADemo_xpath/main.resource
    SeleniumLibrary.Click Element    xpath=${main_page_img}

Text Box: Fill Form
    [Documentation]    This keyword fills the text box form with the provided data.
    [Arguments]    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    # cleanup parametrów za pomoca wydzielenia modułów jako osobone resource'y -> QADemoSelenium_Text_Box.resource
    SeleniumLibrary.Input Text    id=userName    ${full_name}
    SeleniumLibrary.Input Text    id=userEmail    ${email}
    SeleniumLibrary.Input Text    id=currentAddress    ${current_address}
    SeleniumLibrary.Input Text    id=permanentAddress    ${permanent_address}

Text Box: Click Submit
    [Documentation]    This keyword clicks the submit button on the text box form.
    SeleniumLibrary.Click Button    id=submit

Text Box: Get Output
    [Documentation]    This keyword retrieves the output from the text box form after submission.
    ${output}    SeleniumLibrary.Get Text    id=output
    RETURN    ${output}

Text Box: Verify Output
    [Documentation]    This keyword verifies the output from the text box form after submission.
    [Arguments]    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    ${actual_output}    Text Box: Get Output
    Should Contain    ${actual_output}    Name:${full_name}
    Should Contain    ${actual_output}    Email:${email}
    Should Contain    ${actual_output}    Current Address :${current_address}
    Should Contain    ${actual_output}    Permananet Address :${permanent_address}
    # podłaczenie python do RFW za pomocą "płaskiego" pliku python składającego się tylko z funkcji
    Text Box Verify Output    ${actual_output}    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    Text Box Verify Output2    ${actual_output}    ${full_name}    ${email}    ${current_address}    ${permanent_address}
    Text Box Verify Output With RFW Libs    ${actual_output}    ${full_name}    ${email}    ${current_address}    ${permanent_address}

 