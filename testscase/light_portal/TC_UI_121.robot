*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test website can display sumary of sales from advance search
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_121
    [Documentation]  Test website can display sumary of sales from advance search

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto report sales page
    light_portal_report_sales_list_features.Select date period from advance search and verify all reports are visible  ${tc_ui_121['date_period']['1_month']}
    light_portal_report_sales_list_features.Select date period from advance search and verify all reports are visible  ${tc_ui_121['date_period']['3_months']}