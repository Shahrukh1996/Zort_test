*** Keywords ***
Verify sales title and info
    [Documentation]     Verify sales title and info
    light_portal_report_overview_page.Verify sales title
    light_portal_report_overview_page.Verify sales info should be visible

Verify sales this month title and info
    [Documentation]     Verify sales this month title and info
    light_portal_report_overview_page.Verify sales this month title
    light_portal_report_overview_page.Verify sales this month info should be visible

Verify sales this year title and info
    [Documentation]     Verify sales this year title and info
    light_portal_report_overview_page.Verify sales this year title
    light_portal_report_overview_page.Verify sales this year info should be visible

Verify best category sell title and info
    [Documentation]     Verify best category sell title and info
    light_portal_report_overview_page.Verify best category sell title
    light_portal_report_overview_page.Verify best category sell info should be visible
    light_portal_home_features.Goto report overview page

Verify compare sales since early year title and info
    [Documentation]     Verify compare sales since early year title and info
    light_portal_report_overview_page.Verify compare sales since early year title
    light_portal_report_overview_page.Verify compare sales since early year info should be visible

Verify sales summary and chart
    [Documentation]     Verify sales summary and chart
    light_portal_report_overview_page.Verify sales summary
    light_portal_report_overview_page.Verify sales summary chart

Verify sales summary dropdown label
    [Documentation]     Verify sales summary dropdown label
    [Arguments]         ${LABELS}
    light_portal_report_overview_page.Click sales summary dropdown
    FOR     ${label}     IN      @{LABELS}
            light_portal_report_overview_page.Verify dropdown label              ${label}
    END

Verify sales summary and chart by category
    [Documentation]     Verify sales summary and chart by category
    light_portal_report_overview_page.Verify sales summary by category
    light_portal_report_overview_page.Verify sales summary chart

Verify remain by warehouse
    [Documentation]     Verify remain by warehouse
    light_portal_report_overview_page.Verify remain by warehouse
    light_portal_report_overview_page.Verify remain by warehouse chart

Verify remain by warehouse dropdown label
    [Documentation]     Verify remain by warehouse dropdown label
    [Arguments]         ${LABELS}
    light_portal_report_overview_page.Click remain by warehouse dropdown
    FOR     ${label}     IN      @{LABELS}
            light_portal_report_overview_page.Verify dropdown label              ${label}
    END

Verify remain and chart by category title
    [Documentation]     Verify remain and chart by category title
    light_portal_report_overview_page.Verify remain by category title
    light_portal_report_overview_page.Verify remain by warehouse chart

Verify product movement title and column name
    [Documentation]     Verify product movement title and column name
    [Arguments]         ${title}        ${COLUMNS}      ${LINKS}
    light_portal_report_overview_page.Verify product movement title          ${title}
    FOR     ${column}     IN      @{COLUMNS}
            light_portal_report_overview_page.Verify product movement column                 ${column}
    END
    FOR     ${link}     IN      @{LINKS}
            light_portal_report_overview_page.Verify product movement column with link       ${link}
    END

Verify product movement dropdown label
    [Documentation]     Verify product movement dropdown label
    light_portal_report_overview_page.Click product movement dropdown
    [Arguments]         ${LABELS}
    FOR     ${label}     IN      @{LABELS}
            light_portal_report_overview_page.Verify dropdown label              ${label}
    END