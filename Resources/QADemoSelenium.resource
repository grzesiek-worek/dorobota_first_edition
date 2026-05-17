*** Settings ***
Documentation     This is a resource file that includes other resource files for testing the functionality of the application.
Library           SeleniumLibrary


*** Keywords ***
Open Browser To Login Page
    [Documentation]    This keyword opens the browser and navigates to the login page.
    [Arguments]    ${browser}=chrome
    SeleniumLibrary.Open Browser    https://demoqa.com    ${browser}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Set Selenium Speed    0.5s

Close Browser
    [Documentation]    This keyword closes the browser.
    SeleniumLibrary.Close Browser

Main: Navigate To Elements Page
    [Documentation]    This keyword navigates to the Elements page.
    SeleniumLibrary.Click Element    xpath=//h5[text()='Elements']

Elements: Navigate To Text Box
    [Documentation]    This keyword navigates to the Text Box page.
    SeleniumLibrary.Click Element    xpath=//span[text()='Text Box']

Navigate To Main Page
    [Documentation]    This keyword navigates to the main page.
    SeleniumLibrary.Click Element    xpath=//*[@id="root"]/header/a/img

Text Box: Fill Form
    [Documentation]    This keyword fills the text box form with the provided data.
    [Arguments]    ${full_name}    ${email}    ${current_address}    ${permanent_address}
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
