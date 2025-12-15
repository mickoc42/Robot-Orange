*** Settings ***
Documentation       Testy nawigacji w menu bocznym (odpowiednik testów w TS).

Library             Browser
# Importujemy nasze zasoby (komponenty i strony)
Resource            ${EXECDIR}/src/components/side_menu.resource
Resource            ${EXECDIR}/src/pages/dashboard_page.resource
Resource            ${EXECDIR}/src/pages/pim_page.resource
Resource            ${EXECDIR}/src/pages/recruitment_page.resource
Resource            ${EXECDIR}/src/common.resource

*** Test Cases ***
User Can Navigate To PIM Page
    [Documentation]  Check that user can navigate to PIM page using Side Menu. 
    Go To PIM Page
    Verify PIM Page Is Visible

User Can Navigate To Dashboard Page
    [Documentation]  Check that user can navigate to Dashboard page using Side Menu.
    Go To PIM Page
    Go To Dashboard Page
    Verify Dashboard Page Is Visible
