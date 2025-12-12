*** Settings ***
Library    Browser


*** Variables ***
${SIDE_MENU_DASHBOARD}       role=link[name="Dashboard"]
${SIDE_MENU_RECRUITMENT}     role=link[name="Recruitment"]
${SIDE_MENU_PIM}             role=link[name="PIM"]


*** Keywords ***
Go To Dashboard Page
    [Documentation]    Go to Dashboard page by clicking the Dashboard link in the side menu.
    Click    ${SIDE_MENU_DASHBOARD}

Go To Recruitment Page
    [Documentation]    Go to Recruitment page by clicking the Recruitment link in the side menu.
    Click    ${SIDE_MENU_RECRUITMENT}

Go To PIM Page
    [Documentation]    Go to PIM page by clicking the PIM link in the side menu.
    Click    ${SIDE_MENU_PIM}
