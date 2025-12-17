*** Settings ***
Documentation       End-to-end test for employee lifecycle: add, update profile picture, delete.
Resource             ${EXECDIR}/src/common.resource
Resource             ${EXECDIR}/src/pages/pim_page.resource
Resource            ${EXECDIR}/src/views/pim/pim_add_employee.resource
Resource            ${EXECDIR}/src/views/pim/pim_personal_details.resource
Resource            ${EXECDIR}/src/views/pim/pim_change_profile_picture_view.resource
Resource           ${EXECDIR}/src/components/side_menu.resource
Suite Setup   Start New Browser Session
Suite Teardown   Close Browser   ALL
Test Setup    Open App And Login
Test Teardown  Close Context


*** Test Cases ***
Employee Lifecycle
    [Documentation]    End-to-end test for employee lifecycle: add, update profile picture, delete.
    [Tags]    employee_lifecycle
    # --- Arrange & Act ---
    Go To PIM Page
    Go To Add Employee
    Add Employee    ${TEST_EMPLOYEE_1}
    Go To Employee List
    Search For An Employee    ${TEST_EMPLOYEE_1.id}
    Go To Personal Details    ${TEST_EMPLOYEE_1.id}    ${TEST_EMPLOYEE_1.firstName}
    Go To Change Picture View
    Update Profile Image    ${PROFILE_PIC_PATH}    ${PROFILE_PIC_PATTERN}
    Go To Employee List
    Search For An Employee    ${TEST_EMPLOYEE_1.id}
    Delete Employee    ${TEST_EMPLOYEE_1.id}

    # --- Assert ---
    VAR  ${deleted_row_selector}  css=.oxd-table-row:has-text("${TEST_EMPLOYEE_1.id}")
    Get Element States    ${deleted_row_selector}    contains    detached
