*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test website can display sumary of sales by graph
    [Tags]           LIGHT_WEIGHT  TC2  TC_27
    [Documentation]  Test website can display sumary of sales by graph
    light_portal_common_keywords.Open zortout website
    # light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    # light_portal_home_features.Goto report sales page
    # light_portal_report_sales_list_features.Select graph profit from sales sumary and verify the graph is visible
    # light_portal_report_sales_list_features.Select graph profit from all sumary and verify the graph is visible
    # light_portal_report_sales_list_features.Select graph all sales and verify all the is visible
    # light_portal_report_sales_list_features.Select graph sales list order by type and verify the graph is visible  ${tc_26['order_type']}