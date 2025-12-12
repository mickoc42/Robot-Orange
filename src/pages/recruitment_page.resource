*** Settings ***
Library    Browser


*** Keywords ***
Verify Recruitment Page Is Visible
    [Documentation]     Verify that the Dashboard page is visible by checking for a unique element on the page.
    Get Url    contains    recruitment
    Get Text   h6    ==    Recruitment
