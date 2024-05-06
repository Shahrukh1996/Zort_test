*** Variables ***
&{xpt_warehouse_advancedSearch_input}     code=//input[@id='searchcode']
...                                       name=//input[@id='searchname']
...                                       checkBox=//input[@id='checkshowarchive']
&{xpt_warehouse_advancedSearch_button}    add_advancedSearch=//a[@id='btn-advance-search']
...                                       confirm_advancedSearch=//div[@class='search-advance__header']//input[@value='ค้นหา']
&{xpt_warehouse_table}                    nomall_list=(//div[@class='table-view']//tbody//td[@class='///str///']/span)
...                                       delete_list=(//div[@class='table-view']//tbody//td[@class='///str///']/s/span)
&{xpt_category_quick_search_input}        add_quick_search=//input[@id='quicksearchtext']
&{xpt_setproduct_quickSearch_input}       add_quickSearch=//input[@id='quicksearchtext']

*** Keywords ***
Click add quick search by category
    [Documentation]     คลิกค้นหาหมวดหมู่แบบรวดเร็ว
    DobbyWebCommon.Click element when ready    ${xpt_category_quick_search_input.add_quick_search}

Click add quick search by set product
    [Documentation]     คลิกค้นหาสินค้าชุดแบบรวดเร็ว
    DobbyWebCommon.Click element when ready    ${xpt_setproduct_quickSearch_input.add_quickSearch}

Click add advanced search by warehouse
    [Documentation]    คลิกค้นหาขั้นสูง
    DobbyWebCommon.Click element when ready    ${xpt_warehouse_advancedSearch_button.add_advancedSearch}

Click confirm advanced search by warehouse
    [Documentation]    คลิกค้นหารายการคลัง
    DobbyWebCommon.Click element when ready    ${xpt_warehouse_advancedSearch_button.confirm_advancedSearch}

Verify warehouse code tpye nomall list
    [Documentation]    ตรวจสอบ'รหัสคลัง'ของรายการปกติ
    [Arguments]    ${test_data}
    &{str_replaceXpath}=    BuiltIn.Create dictionary    ///str///=id    /span=/span[text()='${test_data ['advancedSearch'] ['code']}']
    ${xpt_newXpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_warehouse_table.nomall_list}    ${str_replaceXpath}
    DobbyWebCommon.Wait until element is visible except stale    ${xpt_newXpath}

Verify warehouse code tpye delete list
    [Documentation]    ตรวจสอบ'รหัสคลัง'ของรายการที่ถูกลบ
    [Arguments]    ${test_data}
    &{str_replaceXpath}=    BuiltIn.Create dictionary    ///str///=id    /span=/span[text()='${test_data ['advancedSearch'] ['code']}']
    ${xpt_newXpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_warehouse_table.delete_list}    ${str_replaceXpath}
    DobbyWebCommon.Wait until element is visible except stale    ${xpt_newXpath}

Verify warehouse name tpye nomall list
    [Documentation]    ตรวจสอบ'ชื่อคลัง'ของรายการปกติ
    [Arguments]    ${test_data}
    &{str_replaceXpath}=    BuiltIn.Create dictionary    ///str///=name    /span=/span[text()='${test_data ['advancedSearch'] ['code']}']
    ${xpt_newXpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_warehouse_table.nomall_list}    ${str_replaceXpath}
    DobbyWebCommon.Wait until element is visible except stale    ${xpt_newXpath}

Verify warehouse name tpye delete list
    [Documentation]    ตรวจสอบ'ชื่อคลัง'ของรายการที่ถูกลบ
    [Arguments]    ${test_data}
    &{str_replaceXpath}=    BuiltIn.Create dictionary    ///str///=name    /span=/span[text()='${test_data ['advancedSearch'] ['name']}']
    ${xpt_newXpath}=        light_portal_common_keywords.Auto keyword replace string    ${xpt_warehouse_table.delete_list}    ${str_replaceXpath}
    DobbyWebCommon.Wait until element is visible except stale    ${xpt_newXpath}

Verify data of advanced search by warehouse
    [Documentation]    ตรวจสอบประเภทรายการคลังในตาราง (แบบปกติ หรือ แบบถูกลบ)
    [Arguments]    ${test_data}
    light_portal_common_keywords.Wait for jquery loading completed
    IF  ${test_data ['advancedSearch'] ['checkBox']}
        light_portal_search_page.Verify warehouse code tpye delete list    ${test_data}
        light_portal_search_page.Verify warehouse name tpye delete list    ${test_data}
    ELSE
        light_portal_search_page.Verify warehouse code tpye nomall list    ${test_data}
        light_portal_search_page.Verify warehouse name tpye nomall list    ${test_data}
    END

Input data for quick search by category
    [Documentation]    กรอกข้อมูลค้นหาหมวดหมู่แบบรวดเร็ว
    [Arguments]        ${search_data}
    DobbyWebCommon.Input text to element when ready    ${xpt_category_quick_search_input.add_quick_search}    ${search_data}
    SeleniumLibrary.Press keys    None    ENTER

Input data for quick search by set product
    [Documentation]    กรอกข้อมูลค้นหาสินค้าชุดแบบรวดเร็ว
    [Arguments]    ${quickSearch}
    DobbyWebCommon.Input text to element when ready    ${xpt_setproduct_quickSearch_input.add_quickSearch}    ${quickSearch}
    SeleniumLibrary.Press keys    None    ENTER

Input data for advanced search by warehouse
    [Documentation]    กรอกข้อมูลค้นหาคลังแบบขั้นสูง
    [Arguments]    ${advancedSearch}
    FOR  ${keys}  IN  @{advancedSearch.keys()}
        IF  '${keys}' == 'checkBox'
            IF  ${advancedSearch ['${keys}']} == True
                DobbyWebCommon.Click element when ready    ${xpt_warehouse_advancedSearch_input.${keys}}
            END
        ELSE
            DobbyWebCommon.Input text to element when ready    ${xpt_warehouse_advancedSearch_input.${keys}}    ${advancedSearch ['${keys}']}
        END
    END