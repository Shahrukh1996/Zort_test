*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test can create normal buy list
    [Tags]           LIGHT_WEIGHT  TC2  TC_14
    [Documentation]  Test can create normal buy list

    Log  [เริ่มต้นทดสอบ]
            light_portal_common_keywords.Open zortout website
            light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}

    Log  [เลือกวันเดือนปี รายการซื้อ]
            light_portal_home_features.Goto add buy list page
            ${current_day}=    light_portal_common_keywords.Get current day
            ${current_month}=  light_portal_common_keywords.Get current month
            ${current_year}=   light_portal_common_keywords.Get current year
            light_portal_add_buy_list_page.Click select transaction date month year  ${tc_14 ['create_date']}  ${current_day}  ${current_month}  ${current_year}

    Log  [กรอกข้อมูลสร้าง รายการซื้อ และเก็บรหัสรายการ]
            ${code}=  light_portal_add_buy_list_features.Input product contact vat shipping and warehouse then click save          ${tc_14}

    Log  [ตรวจสอบการสร้าง รายการซื้อ]
            light_portal_detail_buy_list_features.Verify create buy list detail  ${tc_14}  ${code}  ${tc_14 ['create_date']}
    Log  [ตรวจสอบการค้นหา รายการซื้อ]
            light_portal_buy_list_features.Verify information afer quick search should be corrected  ${tc_14}  ${code}
