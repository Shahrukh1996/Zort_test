*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Advanced search of warehouse list
    [Tags]           LIGHT_WEIGHT  TC1  TC_02
    [Documentation]  ทดสอบ ค้นหาขั้นสูง ของรายการคลัง
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user ['username']}  ${public_user ['password']}

    light_portal_home_features.Goto target page                              ${tc_02 ['pre_data']}
    light_portal_search_features.Advanced search by warehouse                ${tc_02 ['test_data']}
    light_portal_search_page.Verify data of advanced search by warehouse     ${tc_02 ['test_data']}