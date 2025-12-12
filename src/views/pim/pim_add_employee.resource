*** Settings ***
Library             Browser


*** Variables ***
${FIRST_NAME_INPUT}     input[name="firstName"]
${MIDDLE_NAME_INPUT}    input[name="middleName"]
${LAST_NAME_INPUT}      input[name="lastName"]
${EMPLOYEE_ID_INPUT}    css=.oxd-input-group:has-text("Employee Id") >> css=input
${SAVE_BUTTON}          button >> text="Save"
${TOAST_MESSAGE}        css=.oxd-toast
*** Keywords ***
Add Employee
    [Documentation]    Add a new employee with the provided employee data.
    [Arguments]        ${employee_data}

    Fill Text    ${FIRST_NAME_INPUT}     ${employee_data.firstName}
    Fill Text    ${MIDDLE_NAME_INPUT}    ${employee_data.middleName}
    Fill Text    ${LAST_NAME_INPUT}      ${employee_data.lastName}
    Fill Text    ${EMPLOYEE_ID_INPUT}    ${employee_data.id}

    Click    ${SAVE_BUTTON}

    Browser.Get Text    ${TOAST_MESSAGE}    contains    Successfully Saved
