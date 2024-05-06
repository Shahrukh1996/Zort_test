*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test overview report
    [Tags]           LIGHT_WEIGHT  TC_UI2  TC_UI_120
    [Documentation]  Test overview report

    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto report overview page
    light_portal_report_overview_features.Verify sales title and info
    light_portal_report_overview_features.Verify sales this month title and info
    light_portal_report_overview_features.Verify sales this year title and info
    light_portal_report_overview_features.Verify best category sell title and info
    light_portal_report_overview_features.Verify compare sales since early year title and info
    light_portal_report_overview_features.Verify sales summary and chart
    light_portal_report_overview_features.Verify sales summary dropdown label  ${tc_ui_120['sales_summary_dropdown']}
    light_portal_report_overview_page.Select sales summary dropdown by label  ${tc_ui_120['sales_summary_label']}
    light_portal_report_overview_features.Verify sales summary and chart by category
    light_portal_report_overview_features.Verify remain by warehouse
    light_portal_report_overview_features.Verify remain by warehouse dropdown label  ${tc_ui_120['sales_summary_dropdown']}
    light_portal_report_overview_page.Select remain by warehouse label  ${tc_ui_120['remain_warehouse_label']}
    light_portal_report_overview_features.Verify remain and chart by category title
    light_portal_report_overview_features.Verify product movement title and column name  ${tc_ui_120['prod_movement_default_title']}  ${tc_ui_120['prod_movement_column']}  ${tc_ui_120['prod_movement_column_link']}
    light_portal_report_overview_features.Verify product movement dropdown label  ${tc_ui_120['prod_movement_dropdown']}
    light_portal_report_overview_page.Select product movement by label  ${tc_ui_120['prod_movement_label']}
    light_portal_report_overview_features.Verify product movement title and column name  ${tc_ui_120['prod_movement_title']}  ${tc_ui_120['prod_movement_column']}  ${tc_ui_120['prod_movement_column_link']}
    light_portal_report_overview_page.Select sales summary dropdown by label  ${tc_ui_120['sales_summary_label']}
    light_portal_report_overview_page.Select remain by warehouse label  ${tc_ui_120['remain_warehouse_label']}
    light_portal_report_overview_page.Select product movement by label  ${tc_ui_120['prod_movement_default_title']}