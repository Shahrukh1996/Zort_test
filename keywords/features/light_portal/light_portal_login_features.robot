*** Keywords ***

Login with email
    [Arguments]      ${username}   ${password}
    [Documentation]  ล็อกอินเข้าใช้งาน
    light_portal_login_page.Input username  ${username}
    light_portal_login_page.Input password  ${password}
    light_portal_login_page.Click login button
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_home_page.Verify popup and click close adb popup