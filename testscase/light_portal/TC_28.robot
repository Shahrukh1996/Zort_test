*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test website can display sumary of sales by table
    [Tags]           LIGHT_WEIGHT  TC2  TC_28
    [Documentation]  Test website can display sumary of sales by table
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto report sales page
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['category']}
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['sales_funnel']}
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['payment_method']}
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['customer']}
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['customer_groups']}
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['dealer']}
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['user']}
    light_portal_report_sales_list_features.Select table of salse sumary and verify the table is visible  ${tc_28['section']['store_and_branch']}