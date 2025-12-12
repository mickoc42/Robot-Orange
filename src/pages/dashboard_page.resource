*** Settings ***
Library    Browser


*** Keywords ***
Verify Dashboard Page Is Visible
    [Documentation]    Verify that the Dashboard page is visible by checking for a unique element on the page.
    Wait For Elements State    h6 >> text=Dashboard    visible
    Browser.Get Text   h6    ==    Dashboard
