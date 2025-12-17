*** Settings ***
Documentation       Test to verify successful login to the OrangeHRM system.
Library             Browser
Resource             ${EXECDIR}/src/common.resource
Suite Setup   Start New Browser Session
Suite Teardown   Close Browser   ALL
Test Setup    Open App And Login
Test Teardown  Close Context


*** Test Cases ***
Successful Login Test
    [Documentation]    Test to verify successful login to the OrangeHRM system.
    Get Text    h6    ==    Dashboard
