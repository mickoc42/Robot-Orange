*** Settings ***
Documentation       Test to verify successful login to the OrangeHRM system.
Library             Browser
Resource             ${EXECDIR}/src/common.resource


*** Test Cases ***
Successful Login Test
    [Documentation]    Test to verify successful login to the OrangeHRM system.
    Get Text    h6    ==    Dashboard
