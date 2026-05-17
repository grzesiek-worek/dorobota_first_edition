*** Settings ***
Documentation     This is a resource file that includes other resource files for testing the functionality of the application.
Resource    ../Resources/handler.resource

Suite Setup    QADemoSelenium.Open Browser To Login Page     ${BROWSER}
Suite Teardown    QADemoSelenium.Close Browser

Test Setup    QADemoSelenium.Navigate To Main Page

*** Test Cases ***
Test Case 1
    [Documentation]    GUI Demo QA       
    QADemoSelenium.Main: Navigate To Elements Page
    QADemoSelenium.Elements: Navigate To Text Box

Test Case 2
    [Documentation]    GUI Demo QA    
    [Tags]    test_2
    QADemoSelenium.Main: Navigate To Elements Page
    QADemoSelenium.Elements: Navigate To Text Box
    QADemoSelenium.Text Box: Fill Form    John Doe    john.doe@example.com    123 Main St    456 Elm St
    QADemoSelenium.Text Box: Click Submit
    ${output}    QADemoSelenium.Text Box: Get Output
    QADemoSelenium.Text Box: Verify Output    John Doe    john.doe@example.com    123 Main St    456 Elm St
