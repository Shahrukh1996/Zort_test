*** Keywords ***
Update marketplace of line myshop
    [Arguments]      ${name}
    [Documentation]  อัปเดตข้อมูลของ line myshop
        light_portal_connect___list_page.Click marketplace list by name  ${name}
        light_portal_common_keywords.Auto keyword remove dom chat support
        light_portal_connect___detail_page.Update data sec1
        light_portal_connect___detail_page.Update data sec2
        light_portal_connect___detail_page.Update data sec3
        light_portal_connect___detail_page.Update data sec4
        Sleep  5s