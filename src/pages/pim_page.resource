*** Settings ***
Library           Browser


*** Variables ***
${EMPLOYEE_LIST_LINK}       role=link[name="Employee List"]
${ADD_EMPLOYEE_BUTTON}      button >> text="Add"
${SEARCH_BUTTON}            role=button[name="Search"]
${DELETE_CONFIRM_BUTTON}    button >> text="Yes, Delete"
${TOAST_MESSAGE}            css=.oxd-toast
${EMPLOYEE_ID_INPUT}        css=.oxd-input-group:has-text("Employee Id") >> css=input
${TABLE_ROW_SELECTOR}       css=.oxd-table-row
${DELETE_BUTTON_ICON}       css=button:has(.bi-trash)


*** Keywords ***
Go To Employee List
    [Documentation]    Go to the Employee List page.
    Click    ${EMPLOYEE_LIST_LINK}

Go To Add Employee
    [Documentation]    Go to the Add Employee page, initiate adding an employee.
    Click    ${ADD_EMPLOYEE_BUTTON}

Delete Employee
    [Documentation]    Delete a visible on the list  employee by ID.
    [Arguments]        ${id}
    Click    ${TABLE_ROW_SELECTOR}:has-text("${id}") >> ${DELETE_BUTTON_ICON}
    Click    ${DELETE_CONFIRM_BUTTON}

Go To Personal Details
    [Documentation]     Go to the Personal Details page of an employee by ID and name,
    ...     employee must be visible on employee list
    [Arguments]        ${id}  ${name}
    VAR   ${cell_selector}  ${TABLE_ROW_SELECTOR}:has-text("${id}") >> css=.oxd-table-cell:has-text("${name}")
    Click    ${cell_selector}

Search For An Employee
    [Documentation]    Search for an employee by ID in the Employee List.
    [Arguments]        ${id}
    Fill Text    ${EMPLOYEE_ID_INPUT}    ${id}
    Verify If Employee Found    ${id}

Verify If Employee Found
    [Documentation]    Verify if an employee with the given ID is found in the Employee List.
    [Arguments]        ${id}
    Wait Until Keyword Succeeds    10 sec    1 sec    Search And Check Row Visibility    ${id}

Search And Check Row Visibility
    [Documentation]    Special check added because of possible delays in loading the table.
    [Arguments]        ${id}
    Click    ${SEARCH_BUTTON}
    Get Element States    ${TABLE_ROW_SELECTOR}:has-text("${id}")    contains    visible

Verify PIM Page Is Visible
    [Documentation]    verifies that we are in the PIM module.
    Wait For Elements State    h6 >> text=PIM    visible
    Get Text   h6    ==    PIM
