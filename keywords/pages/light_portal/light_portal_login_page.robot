*** Variables ***
${login_page.txt_username}          id=usernametxt
${login_page.txt_password}          id=passwordtxt
${login_page.btn_login}             xpath=//button[@onclick='login()']

*** Keywords ***

Input username
    [Documentation]  Input username
    [Arguments]      ${username}
    SeleniumLibrary.Input text  ${login_page.txt_username}  ${username}

Input password
    [Documentation]  Input password
    [Arguments]      ${password}
    SeleniumLibrary.Input text  ${login_page.txt_password}  ${password}

Click login button
    [Documentation]  Click login button
    SeleniumLibrary.Click element  ${login_page.btn_login}
