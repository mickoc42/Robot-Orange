*** Settings ***
Library           Browser
Library           DocTest.VisualTest  AS  Visual
Resource           ${EXECDIR}/src/test_data/EmployeeData.resource


*** Variables ***
${EMPLOYEE_IMAGE_CONTAINER}    css=.orangehrm-edit-employee-imagesection
${FILE_INPUT}                  css=input[type="file"]
${SAVE_BUTTON}                 button >> text="Save"
${TOAST_MESSAGE}               css=.oxd-toast
${PROFILE_PIC_SNAPSHOT}        ${EXECDIR}/src/test_data/snapshot/profile_picture_snapshot


*** Keywords ***
Update Profile Image
    [Documentation]    Update the profile image with the given picture and verify the update.
    [Arguments]        ${PROFILE_PIC_PATH}    ${PROFILE_PIC_PATTERN}
    Upload Profile File    ${PROFILE_PIC_PATH}
    Click    ${SAVE_BUTTON}
    Browser.Get Text   ${TOAST_MESSAGE}    contains    Successfully Updated
    Verify Profile Image    ${PROFILE_PIC_PATTERN}

Upload Profile File
    [Documentation]    Upload a profile picture from the specified path.
    [Arguments]        ${PROFILE_PIC_PATH}
    Upload File By Selector    ${FILE_INPUT}    ${PROFILE_PIC_PATH}

Verify Profile Image
    [Documentation]    Special keyword Verify that the Dashboard page is visible by checking
    ...     for a unique element on the page.
    [Arguments]        ${PROFILE_PIC_PATTERN}
    Wait Until Keyword Succeeds    15 sec    0.5 sec    Check Profile Screenshot  ${PROFILE_PIC_PATTERN}

Check Profile Screenshot
    [Documentation]    Check the profile picture screenshot against the expected pattern.
    [Arguments]        ${PROFILE_PIC_PATTERN}
    Get Element States     ${EMPLOYEE_IMAGE_CONTAINER}    contains    visible
    Take Screenshot    filename=${PROFILE_PIC_SNAPSHOT}    selector=${EMPLOYEE_IMAGE_CONTAINER}
    Visual.Compare Images  ${PROFILE_PIC_PATTERN}    ${PROFILE_PIC_SNAPSHOT}.png    threshold=0.1
