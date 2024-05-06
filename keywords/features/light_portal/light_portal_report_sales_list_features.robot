*** Keywords ***
Select to view sales sumary and verify sales sumary report is visible
    [Documentation]     Select to view sales sumary and verify sales sumary report is visible
    light_portal_report_sales_list_page.Click select any sumary report
    light_portal_report_sales_list_page.Click select sales sumary report
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify sales sumary report is visible

Select to view profit from sales sumary and verify profit from sales sumary report is visible
    [Documentation]     Select to view profit from sales sumary and verify profit from sales sumary report is visible
    light_portal_report_sales_list_page.Click select any sumary report
    light_portal_report_sales_list_page.Click select profit from sales sumary report
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify profit from sales sumary report is visible

Select to view profit from all sumary and verify profit from all sumary report is visible
    [Documentation]     Select to view profit from all sumary and verify profit from all sumary report is visible
    light_portal_report_sales_list_page.Click select any sumary report
    light_portal_report_sales_list_page.Click select profit from all sumary report
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify profit from all sumary report is visible

Select graph profit from sales sumary and verify the graph is visible
    [Documentation]     Select graph profit from sales sumary and verify the graph is visible
    light_portal_report_sales_list_page.Click select any sumary graph
    light_portal_report_sales_list_page.Click select profit from sales graph
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify profit from all sumary graph is visible

Select graph profit from all sumary and verify the graph is visible
    [Documentation]     Select graph profit from all sumary and verify profit from all sumary graph is visible
    light_portal_report_sales_list_page.Click select any sumary graph
    light_portal_report_sales_list_page.Click select all profit graph
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify all profit graph is visible

Select graph all sales and verify all the is visible
    [Documentation]     Select graph all sales and verify all sales graph is visible
    light_portal_report_sales_list_page.Click select any sumary graph
    light_portal_report_sales_list_page.Click select all sales graph
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify all sales graph is visible

Select graph sales list order by type and verify the graph is visible
    [Documentation]     Select graph sales list order by type and verify the graph is visible
    [Arguments]         ${type}
    light_portal_report_sales_list_page.Click select any sumary graph
    light_portal_report_sales_list_page.Click select graph sales list order by type
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify graph sales list order by type is visible    ${type}

Select table of salse sumary and verify the table is visible
    [Documentation]     Select table of salse sumary with any section and verify the table is visible
    [Arguments]         ${section}
    light_portal_report_sales_list_page.Click select section to choose type of table
    light_portal_report_sales_list_page.Choose type of table about sales to show sumary    ${section}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify table about sales is visible    ${section}

Select date period from advance search and verify all reports are visible
    [Documentation]     Select date period from advance search and verify all reports are visible
    [Arguments]         ${date_period}    ${sales_text}=${report_page['sumary_sales']}
    light_portal_report_sales_list_page.Click advance search button
    light_portal_report_sales_list_page.Click select date period button
    light_portal_report_sales_list_page.Choose date period    ${date_period}
    light_portal_report_sales_list_page.Click okay button on advance search page
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_report_sales_list_page.Verify sales sumary report is visible
    light_portal_report_sales_list_page.Verify all sales graph is visible
    light_portal_report_sales_list_page.Verify default sumary sales on page is visible    ${sales_text}