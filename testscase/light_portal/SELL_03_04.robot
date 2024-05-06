*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
TEST SELL 03 04
    [Tags]           LIGHT_WEIGHT  SELL  SELL_03_04
    [Documentation]  ทดสอบรายการขาย 'วันหมดอายุ'

    Log  [เริ่มต้นทดสอบ]
           light_portal_common_keywords.Open zortout website
           light_portal_login_features.Login with email  ${public_user ['username']}  ${public_user ['password']}

#     Log  [ค้นหารายการขาย]
#            light_portal_home_features.Goto target page  ${sell_03_04 ['pre_data'] ['sell_list_page']}
#            light_portal_sell___list_page.Click open advanced search
#            light_portal_sell___list_page.Click close advanced search
#            light_portal_sell___feature.Quick search  ${sell_03_04 ['test_data'] ['sell_name']}

#     Log  [ตรวจสอบรายการหมดอายุ]
#             light_portal_sell___feature.Verify status expire date  ${sell_03_04 ['test_data'] ['sell_name']}

#     Log  [สร้างรายการขาย]
#             ${current_day}=    light_portal_common_keywords.Get current day
#             ${current_month}=  light_portal_common_keywords.Get current month
#             ${current_year}=   light_portal_common_keywords.Get current year

#             ${day_str}=    BuiltIn.Convert To string  ${current_day}
#             ${month_str}=  BuiltIn.Convert To string  ${current_month}
#             ${year_str}=   BuiltIn.Convert To string  ${current_year}

#             ${add_sell}=  BuiltIn.Set Variable  ${sell_03_04 ['test_data'] ['add_sell'][0]}
#             Collections.Set To Dictionary  ${add_sell ['information'] ['expire_date']}  year=${year_str}  month=${month_str}  day=${day_str}
#             ${name_sell}=  light_portal_sell___feature.Create sell list  ${add_sell}

#     Log  [อัปเดตข้อมูลรายการขาย]
            # ${result}=  SELL_03_04.update_data  TEST
            # Log  ${result}