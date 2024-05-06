*** Variables ***
${reprot_list_page.btn_select_report_list}                  xpath=//select[@id='salessummary']
${reprot_list_page.btn_sales_report}                        xpath=//select[@id='salessummary']/option[contains(text(),'ยอดขายรวม')]
${reprot_list_page.btn_profit_from_sales_report}            xpath=//select[@id='salessummary']/option[contains(text(),'กำไรจากการขาย')]
${reprot_list_page.btn_profit_from_all_report}              xpath=//select[@id='salessummary']/option[contains(text(),'กำไรรวม')]
${reprot_list_page.lbl_sum_sales_list}                      xpath=//span[@id='salessummarytext'][text()='สรุปยอดขายรวม']
${reprot_list_page.lbl_sum_profit_from_sales}               xpath=//span[@id='salessummarytext'][text()='สรุปกำไรจากการขาย']
${reprot_list_page.lbl_sum_profit_from_all}                 xpath=//span[@id='salessummarytext'][text()='สรุปกำไรรวม']
${reprot_list_page.btn_select_graph_list}                   xpath=//select[@id='typeoption']
${reprot_list_page.btn_select_graph_profit_from_sales}      xpath=//select[@id='typeoption']/option[contains(text(),'กำไรจากการขาย')]
${reprot_list_page.btn_select_graph_all_profit}             xpath=//select[@id='typeoption']/option[contains(text(),'กำไรรวม')]
${reprot_list_page.btn_select_graph_all_sales}              xpath=//select[@id='typeoption']/option[contains(text(),'ยอดขายรวม')]
${reprot_list_page.btn_select_graph_order_by_type}          xpath=//select[@id='typeoption']/option[contains(text(),'ยอดขายตามหมวดหมู่')]
${reprot_list_page.lbl_graph_profit_from_sales}             xpath=//*[local-name()='text' and text()='กำไรจากการขาย']
${reprot_list_page.lbl_graph_all_profit}                    xpath=//*[local-name()='text' and text()='กำไรรวม']
${reprot_list_page.lbl_graph_all_sales}                     xpath=//*[local-name()='text' and text()='ยอดขายรวม']
${reprot_list_page.lbl_graph__order_by_type}                xpath=//*[local-name()='text' and contains(text(),'///text///')]
${reprot_list_page.btn_select_of_table}                     id=tableoption
${reprot_list_page.btn_table_of_sum_sales}                  xpath=//select[@id='tableoption']//option[text()='///text///']
${reprot_list_page.lbl_table_of_sum_sales}                  xpath=//div[@id='MyTable']//a[text()='///text///']
${reprot_list_page.btn_advance_search}                      xpath=//span[@id='datetxt']/following-sibling::a[contains(text(),'ค้นหาขั้นสูง')]
${reprot_list_page.btn_select_date_period}                  id=dateperiod
${reprot_list_page.btn_choose_period}                       xpath=//select[@id='dateperiod']/option[contains(text(),'///text///')]
${reprot_list_page.lbl_default_sum_sales}                   xpath=//*[local-name()='i' and @id='reloadSalesTable']/ancestor::h2
${reprot_list_page.btn_okay_on_advance_search}              xpath=//div[@id='searchAdvance']//input[@type='button'][@value='ตกลง']

*** Keywords ***
Click select any sumary report
    [Documentation]     Click select any sumary report
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_select_report_list}

Click select sales sumary report
    [Documentation]     Click select sales sumary report
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_sales_report}

Click select profit from sales sumary report
    [Documentation]     Click select profit from sales sumary report
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_profit_from_sales_report}

Click select profit from all sumary report
    [Documentation]     Click select profit from all sumary report
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_profit_from_all_report}

Verify sales sumary report is visible
    [Documentation]     Verify sales sumary report is visible
    DobbyWebCommon.Wait until element is visible except stale       ${reprot_list_page.lbl_sum_sales_list}

Verify profit from sales sumary report is visible
    [Documentation]     Verify profit from sales sumary report is visible
    DobbyWebCommon.Wait until element is visible except stale       ${reprot_list_page.lbl_sum_profit_from_sales}

Verify profit from all sumary report is visible
    [Documentation]     Verify profit from all sumary report is visible
    DobbyWebCommon.Wait until element is visible except stale       ${reprot_list_page.lbl_sum_profit_from_all}

Click select any sumary graph
    [Documentation]     Click select any sumary graph
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_select_graph_list}

Click select profit from sales graph
    [Documentation]     Click select profit from sales graph
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_select_graph_profit_from_sales}

Click select all profit graph
    [Documentation]     Click select all profit graph
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_select_graph_all_profit}

Click select all sales graph
    [Documentation]     Click select all sales graph
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_select_graph_all_sales}

Click select graph sales list order by type
    [Documentation]     Click select graph sales list order by type
    DobbyWebCommon.Click element when ready       ${reprot_list_page.btn_select_graph_order_by_type}

Verify profit from all sumary graph is visible
    [Documentation]     Verify profit from all sumary graph is visible
    DobbyWebCommon.Wait until element is visible except stale       ${reprot_list_page.lbl_graph_profit_from_sales}

Verify all profit graph is visible
    [Documentation]     Verify all profit graph is visible
    DobbyWebCommon.Wait until element is visible except stale       ${reprot_list_page.lbl_graph_all_profit}

Verify all sales graph is visible
    [Documentation]     Verify all sales graph is visible
    DobbyWebCommon.Wait until element is visible except stale       ${reprot_list_page.lbl_graph_all_sales}

Verify graph sales list order by type is visible
    [Documentation]     Verify graph sales list order by type is visible
    [Arguments]         ${type}
    ${locator}          String.Replace string       ${reprot_list_page.lbl_graph__order_by_type}      ///text///      ${type}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click select section to choose type of table
    [Documentation]     Click select section to choose type of table
    DobbyWebCommon.Click element when ready         ${reprot_list_page.btn_select_of_table}

Choose type of table about sales to show sumary
    [Documentation]     Choose type of table about sales to show sumary
    [Arguments]         ${type}
    ${locator}          String.Replace string       ${reprot_list_page.btn_table_of_sum_sales}     ///text///      ${type}
    DobbyWebCommon.Click element when ready         ${locator}

Verify table about sales is visible
    [Documentation]     Verify table about sales is visibl
    [Arguments]         ${type}
    ${locator}          String.Replace string       ${reprot_list_page.lbl_table_of_sum_sales}      ///text///      ${type}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click advance search button
    [Documentation]     Click advance search button
    DobbyWebCommon.Click element when ready         ${reprot_list_page.btn_advance_search}

Click select date period button
    [Documentation]     Click select date period button
    DobbyWebCommon.Click element when ready         ${reprot_list_page.btn_select_date_period}

Choose date period
    [Documentation]     Choose date period
    [Arguments]         ${date_period}
    ${locator}          String.Replace string       ${reprot_list_page.btn_choose_period}      ///text///      ${date_period}
    DobbyWebCommon.Click element when ready         ${locator}

Verify default sumary sales on page is visible
    [Documentation]     Verify default sumary sales on page is visible
    [Arguments]         ${sales_text}
    ${text}=    DobbyWebCommon.Get text from element when ready      ${reprot_list_page.lbl_default_sum_sales}
    BuiltIn.Should be equal     ${text}     ${sales_text}

Click okay button on advance search page
    [Documentation]     Click okay button on advance search page
    DobbyWebCommon.Click element when ready         ${reprot_list_page.btn_okay_on_advance_search}