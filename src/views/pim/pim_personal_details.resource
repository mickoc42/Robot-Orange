*** Settings ***
Library             Browser


*** Variables ***
${EMPLOYEE_AVATAR_IMAGE}    css=.employee-image


*** Keywords ***
Go To Change Picture View
    [Documentation]    Navigate to the change profile picture view.
    Click    ${EMPLOYEE_AVATAR_IMAGE}
