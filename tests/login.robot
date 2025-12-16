*** Settings ***
Documentation       Test to verify successful login to the OrangeHRM system.
Library             Browser
Resource             ${EXECDIR}/src/common.resource
Test Teardown  Close Browser   ALL


*** Test Cases ***
Successful Login Test
    [Documentation]    Test to verify successful login to the OrangeHRM system.
    Start New Browser Session
    Start New Context And Page
    Open App And Login
    Get Text    h6    ==    Dashboard
