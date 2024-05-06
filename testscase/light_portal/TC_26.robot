*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test website can display sumary of sales
    [Tags]           LIGHT_WEIGHT  TC2  TC_26
    [Documentation]  Test website can display sumary of sales
    light_portal_common_keywords.Open zortout website
    # light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    # light_portal_home_features.Goto report sales page
    # light_portal_report_sales_list_features.Select to view profit from sales sumary and verify profit from sales sumary report is visible
    # light_portal_report_sales_list_features.Select to view profit from all sumary and verify profit from all sumary report is visible
    # light_portal_report_sales_list_features.Select to view sales sumary and verify sales sumary report is visible