*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://cortestomasenrollmentportal.somee.com/
${EMAIL}          cortes@gmail.com
${PASSWORD}       tomas
${BROWSER}        Chrome

*** Test Cases ***
Add New Student, Navigate to Add Subjects and Schedules
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Email and Password
    sleep   0.7s
    Click Login Button
    Sleep    1s
    Click Students Dropdown
    Sleep    1s
    Click Add New Student
    Sleep    1s
    Fill Student Details
    Sleep    1s
    Submit Student Form
    Sleep    1s
    Click Subjects Dropdown
    Sleep    1s
    Click Add New Subjects
    Sleep    1s
    Fill Subject Details
    Sleep    1s
    Submit Subject Form
    Sleep    1s
    Click Schedule Dropdown
    Sleep    1s
    Click Add New Schedules
    Sleep    1s
    Fill Schedule Details
    Sleep    1s
    Submit Schedule Form
    Sleep    1s
    Click Enroll Dropdown
    Sleep    1s
    Click Enroll Now
    Sleep    1s
    Fill Enrollment Information
    Sleep    1s
    Add Subject Details
    Sleep    1s
    Save Enrollment

*** Keywords ***
Input Email and Password
    Input Text    id:Name    ${EMAIL}
    Input Text    id:Password    ${PASSWORD}

Click Login Button
    Click Button    xpath://button[@type='submit']

Click Students Dropdown
    Click Element    xpath://a[contains(@class, 'nav-link') and contains(., 'STUDENTS')]

Click Add New Student
    Click Element    xpath://a[contains(@class, 'dropdown-item') and contains(., 'Add New Student')]

Fill Student Details
    Input Text    id:floatingInputID        20240002
    sleep   0.2s
    Input Text    id:floatingInputLName     Cortez
    sleep   0.2s
    Input Text    id:floatingInputFName     Smith
    sleep   0.2s
    Input Text    id:floatingInputMName     Angelo
    sleep   0.2s
    Select From List By Value    id:floatingSelectCourse    BSIT
    sleep   0.2s
    Select From List By Value    id:floatingSelectYear      3
    sleep   0.2s
    Select From List By Value    id:floatingSelectRemarks   NEW

Submit Student Form
    Click Button    xpath://button[@class='btn btn-lg btn-outline-dark' and @type='submit']

Click Subjects Dropdown
    Click Element    xpath://a[contains(@class, 'nav-link') and contains(., 'SUBJECTS')]

Click Add New Subjects
    Wait Until Element Is Visible    xpath://a[contains(@class, 'dropdown-item') and contains(., 'Add News Subjects')]    5 seconds
    Click Element    xpath://a[contains(@class, 'dropdown-item') and contains(., 'Add News Subjects')]

Fill Subject Details
    Input Text    id:floatingInput1         COMP102
    sleep   0.2s
    Input Text    id:floatingInput2         Computer Fundamentals
    sleep   0.2s
    Input Text    id:floatingInput3         3
    sleep   0.2s
    # Select "PRE" or "CO" radio button
    Click Element  xpath://input[@type='radio' and @id='Pre']  # Select PRE
    # Uncomment below line if you want to select "CO" instead
    # Click Element  xpath://input[@type='radio' and @id='Co']
    sleep   0.2s
    Input Text    id:Coreq                  COMP101
    sleep   0.2s
    Select From List By Value    id:SFSUBJREGOFRNG    1st-SEM
    sleep   0.2s
    Select From List By Value    id:SFSUBJCATEGORY    LAB
    sleep   0.2s
    Select From List By Value    id:SFSUBJCOURSECODE  BSIT
    sleep   0.2s
    Input Text    id:SFSUBJCURRICULUMCOURSECODE    CURRIC-2023
    sleep   0.2s

Submit Subject Form
    Click Button    xpath://button[contains(text(), 'Submit') and contains(@class, 'btn')]

Click Schedule Dropdown
    Click Element    xpath://a[contains(@class, 'nav-link') and contains(., 'SCHEDULE')]

Click Add New Schedules
    Wait Until Element Is Visible    xpath://a[contains(@class, 'dropdown-item') and contains(., 'Add New Schedules')]    5 seconds
    Click Element    xpath://a[contains(@class, 'dropdown-item') and contains(., 'Add New Schedules')]

Fill Schedule Details
    Input Text    id:floatingInputEDPCode    0123457
    sleep   0.5s
    Input Text    id:subCode                 COMP102
    sleep   0.5s
    Click Button  xpath://button[contains(text(), 'Search')]
    sleep   0.5s
    Wait Until Element Is Visible    xpath://div[contains(@class, 'swal2-popup')]    10 seconds
    Click Button  xpath://button[contains(@class, 'swal2-confirm')]
    Wait Until Element Is Visible    id:subDesc    5 seconds
    Input Text    id:startTime               12:00P
    sleep   0.5s
    Input Text    id:endTime                 01:00P
    sleep   0.5s
    Select From List By Value    id:floatingSelectXM    AM
    sleep   0.5s
    Select From List By Value    id:days              TTH
    sleep   0.5s
    Input Text    id:room                    222
    sleep   0.5s
    Input Text    id:maxSize                 50
    sleep   0.5s
    Input Text    id:classSize               20
    sleep   0.5s
    Select From List By Value    id:status            OPEN
    sleep   0.5s
    Select From List By Value    id:section           A
    sleep   0.5s
    Input Text    id:schoolYear              2024
    sleep   0.5s

Submit Schedule Form
    Execute JavaScript    document.querySelector("button.btn-success").click();

Click Enroll Dropdown
    Click Element    xpath://a[contains(@class, 'nav-link') and contains(., 'ENROLL')]

Click Enroll Now
    Wait Until Element Is Visible    xpath://a[contains(@class, 'dropdown-item') and contains(., 'Enroll Now')]    5 seconds
    Click Element    xpath://a[contains(@class, 'dropdown-item') and contains(., 'Enroll Now')]

Fill Enrollment Information
    Input Text    id:studentId       20240002
    sleep   0.5s
    Input Text    id:enrollmentDate  12-02-2024
    sleep   0.5s
    Click Button  id:searchStudent
    sleep   0.5s

Add Subject Details
    Input Text    id:edpCode      0123457
    sleep   0.5s
    Click Button  id:addSubject
    sleep   0.5s

Save Enrollment
    Wait Until Element Is Visible    id:saveEnrollment    timeout=10s
    Click Button    id:saveEnrollment
    Sleep    30s
