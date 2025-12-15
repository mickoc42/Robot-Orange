*** Settings ***
Library    Browser
Resource       ${EXECDIR}/src/pages/dashboard_page.resource
Variables     ${EXECDIR}/src/setup_env_variables.py


*** Variables ***
${BROWSER}      chromium
${HEADLESS}     True
*** Keywords ***
Start New Browser Session
    [Documentation]    Start a new browser session with specified browser and headless mode.

    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    ...    args=['--start-maximized','--no-sandbox', '--disable-dev-shm-usage']

Start New Context And Page
    [Documentation]    Start a new browser context and open a new page to the application URL.
    New Context    viewport=${None}   tracing=${False}
    New Page       ${URL}

Open App And Login
    [Documentation]    Open the application and log in with default credentials.
    Start New Context And Page
    Fill Text      input[name="username"]    ${USERNAME}
    Fill Text      input[name="password"]    ${PASSWORD}
    Click          button[type="submit"]
    Verify Dashboard Page Is Visible
