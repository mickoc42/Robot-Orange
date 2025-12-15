*** Settings ***
Library    Browser
Resource   ${EXECDIR}/src/pages/dashboard_page.resource



*** Variables ***
${BROWSER}      chromium
${HEADLESS}     True
${URL}          https://opensource-demo.orangehrmlive.com/
${USERNAME}     Admin
${PASSWORD}     admin123
*** Keywords ***
Start New Browser Session
    [Documentation]    Start a new browser session with specified browser and headless mode.
    New Browser    browser=${BROWSER}    headless=${HEADLESS}    args=['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu']

Start New Context And Page
    [Documentation]    Start a new browser context and open a new page to the application URL.
    New Context    viewport={'width': 1920, 'height': 1080}   tracing=${False}
    New Page       ${URL}

Open App And Login
    [Documentation]    Open the application and log in with default credentials.
    Start New Context And Page
    Fill Text      input[name="username"]    ${USERNAME}
    Fill Text      input[name="password"]    ${PASSWORD}
    Click          button[type="submit"]
    Verify Dashboard Page Is Visible
