*** Variables ***
${product_transfer_list_page.btn_advance_search}                xpath=//a[text()='ค้นหาขั้นสูง']
${product_transfer_list_page.txt_search_number}                 id=searchnumber
${product_transfer_list_page.txt_search_product}                id=searchproduct
${product_transfer_list_page.txt_search_warehouse}              id=searchwarehousename
${product_transfer_list_page.txt_search_userid}                 id=searchcreateuserid
${product_transfer_list_page.btn_confirm_search}                xpath=//h3[text()='ค้นหาขั้นสูง']/parent::div//input[@value='ค้นหา']
${product_transfer_list_page.btn_type_transfer}                 xpath=//label[text()='ประเภท']/following-sibling::div/label[span[text()='โอน']]//input[@type='checkbox']
${product_transfer_list_page.btn_type_bring}                    xpath=//label[text()='ประเภท']/following-sibling::div/label[span[text()='ยกมา']]//input[@type='checkbox']
${product_transfer_list_page.btn_type_adjust}                   xpath=//label[text()='ประเภท']/following-sibling::div/label[span[text()='ปรับ']]//input[@type='checkbox']
${product_transfer_list_page.btn_type_assemble}                 xpath=//label[text()='ประเภท']/following-sibling::div/label[span[text()='ประกอบสินค้า']]//input[@type='checkbox']
${product_transfer_list_page.btn_type_split}                    xpath=//label[text()='ประเภท']/following-sibling::div/label[span[text()='แยกส่วนสินค้า']]//input[@type='checkbox']
${product_transfer_list_page.btn_status_wait_transfer}          xpath=//label[text()='สถานะ']/following-sibling::div/label[span[text()='รอโอน']]//input[@type='checkbox']
${product_transfer_list_page.btn_status_success}                xpath=//label[text()='สถานะ']/following-sibling::div/label[span[text()='สำเร็จ']]//input[@type='checkbox']
${product_transfer_list_page.btn_status_cancel}                 xpath=//label[text()='สถานะ']/following-sibling::div/label[span[text()='ยกเลิก']]//input[@type='checkbox']
${product_transfer_list_page.lbl_date}                          xpath=//td[@class='date' and contains(text(),'**DATE**')]
${product_transfer_list_page.lbl_number}                        xpath=//td[@class='name']//a[text()='**NUMBER**']
${product_transfer_list_page.lbl_type}                          xpath=//td[@class='type' and contains(text(),'**TYPE**')]
${product_transfer_list_page.lbl_from_warehouse}                xpath=//td[@class='from' and contains(text(),'**WAREHOUSE**')]
${product_transfer_list_page.lbl_to_warehouse}                  xpath=//td[@class='to' and contains(text(),'**WAREHOUSE**')]
${product_transfer_list_page.lbl_status}                        xpath=//td[@class='status']//span[text()='**STATUS**']
${product_transfer_list_page.btn_craete_transfer}               xpath=//button[contains(text(), 'สร้างรายการโอนสินค้า')]
${product_transfer_list_page.txt_id_create_new_list}            id=number
${product_transfer_list_page.btn_select_from_warehouse}         xpath=//button[@data-id='fromwarehouseid'][@title='คลังสินค้าหลัก']
${product_transfer_list_page.txt_from_warehouse}                xpath=//button[contains(@data-id, 'fromwarehouseid')]/following-sibling::div//input[@type='text'][@aria-label='Search']
${product_transfer_list_page.btn_select_to_warehouse}           xpath=//button[@data-id='towarehouseid'][@title='คลังสินค้าหลัก']
${product_transfer_list_page.txt_to_warehouse}                  xpath=//button[contains(@data-id, 'towarehouseid')]/following-sibling::div//input[@type='text'][@aria-label='Search']
${product_transfer_list_page.btn_save}                          xpath=//button[contains(text(),'บันทึก')]
${product_transfer_list_page.lbl_transfer_status}               xpath=//p[@id='overview-transfer']//span[contains(text(),'///text///')]
${product_transfer_list_page.lbl_origin_warehouse_data}         xpath=//div[contains(@class,'group-view')][contains(text(),'จาก')]/following-sibling::div[contains(text(),'///text///')]
${product_transfer_list_page.lbl_destination_warehouse_data}    xpath=//div[contains(@class,'group-view')][contains(text(),'ไป')]/following-sibling::div[contains(text(),'///text///')]
${product_transfer_list_page.lbl_footer_transfer_status}        xpath=//div[contains(text(),'สถานะรายการ')]/following-sibling::span[contains(text(),'///text///')]
${product_transfer_list_page.btn_command}                       xpath=//button[contains(@data-toggle,'dropdown')]//span[contains(text(),'คำสั่ง')]
${product_transfer_list_page.btn_edit_from_command_button}      xpath=//button[contains(@data-toggle,'dropdown')]/span[contains(text(),'คำสั่ง')]/../following-sibling::ul//a[contains(text(), 'แก้ไข')]
${product_transfer_list_page.btn_add_product}                   xpath=//span[contains(text(), 'เพิ่มสินค้า')]
${product_transfer_list_page.txt_input_product_id}              xpath=//input[@id='productcode2']
${product_transfer_list_page.btn_increase_number_of_product}    xpath=//i[contains(@class,'caret-up')]
${product_transfer_list_page.lbl_product_id_on_data_page}       xpath=//a[contains(text(),'///text///')]
${product_transfer_list_page.lbl_product_amount}                xpath=//p[contains(text(),'จำนวนทั้งหมด')]/following-sibling::div[contains(text(),'///text///')]
${product_transfer_list_page.btn_select_product}                xpath=//span[@id='productcount2']/following-sibling::a[contains(@class,'button')][text()='เลือก']
${product_transfer_list_page.btn_select_default_product}        xpath=//span[@id='productcount1']/following-sibling::a[contains(@class,'button')][text()='เลือก']
${product_transfer_list_page.txt_search_product_on_added_page}  xpath=//input[@id='quicksearchproducttext']
${product_transfer_list_page.btn_select_on_added_page}          xpath=//div[@id='productdialog']//a[text()='เลือก']
${product_transfer_list_page.btn_transfer_partial_goods}        xpath=//div[@class='sr-only']/ancestor::div[@class='box-white']//button[@onclick='openPartialWarehousePopup();']
${product_transfer_list_page.btn_decrease_on_transfer_page}     xpath=//button[contains(@onclick,'minusNumber')]/i[contains(@class,'caret-down')]
${product_transfer_list_page.btn_save_on_transfer_page}         xpath=//button[contains(@onclick,'updatePartialTransaction')][contains(text(),'บันทึก')]
${product_transfer_list_page.btn_transfer_all_goods}            xpath=//button[contains(@onclick,'openWarehousePopup')]/span[contains(text(),'โอนทันที')]
${product_transfer_list_page.btn_save_transfer_all_goods}       xpath=//button[contains(@onclick,'updateTransfer();')][contains(text(),'บันทึก')]
${product_transfer_list_page.btn_cancel_transfer_goods}         xpath=//button[contains(@data-toggle,'dropdown')]/span[contains(text(),'คำสั่ง')]/../following-sibling::ul//a[contains(text(), 'ยกเลิกรายการ')]
${product_transfer_list_page.btn_confirm_cancel}                xpath=//button[@id='BtnOpenConfirmCancel']/following-sibling::button[@onclick='confirmPopup();'][contains(text(),'ยืนยัน')]
${product_transfer_list_page.lbl_cancel_status}                 xpath=//td[@class='status']/span[contains(text(),'ยกเลิก')]
${product_transfer_list_page.txt_search_transfer_id}            id=quicksearchtext
${product_transfer_list_page.xpt_focus}                         xpath=//div[@id='conversationrow']
${product_transfer_list_page.xpt_focus_transfer}                xpath=//div[@class='box-white']//span[@id='userarea']/ancestor::div[@class='tag-person']

&{xpt_basic_transfer_input}                                     name=//input[@id='number']

*** Keywords ***
Click advance search
    [Documentation]     Click advance search
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_advance_search}

Input search number
    [Documentation]     Input search number
    [Arguments]         ${number}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_search_number}              ${number}

Input search product
    [Documentation]     Input search product
    [Arguments]         ${product}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_search_product}             ${product}

Input search warehouse
    [Documentation]     Input search warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_search_warehouse}           ${warehouse}

Input search userid
    [Documentation]     Input search userid
    [Arguments]         ${user_id}
    DobbyWebCommon.Select option by label when ready    ${product_transfer_list_page.txt_search_userid}              ${user_id}

Click checkbox transfer of type
    [Documentation]     Click checkbox transfer of type
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_type_transfer}

Click checkbox bring of type
    [Documentation]     Click checkbox bring of type
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_type_bring}

Click checkbox adjust of type
    [Documentation]     Click checkbox adjust of type
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_type_adjust}

Click checkbox assemble product of type
    [Documentation]     Click checkbox assemble product of type
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_type_assemble}

Click checkbox split product of type
    [Documentation]     Click checkbox split product of type
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_type_split}

Click checkbox wait transfer of status
    [Documentation]     Click checkbox wait transfer of status
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_status_wait_transfer}

Click checkbox success of status
    [Documentation]     Click checkbox success of status
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_status_success}

Click checkbox cancel of status
    [Documentation]     Click checkbox cancel of status
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_status_cancel}

Click confirm advance search
    [Documentation]     Click confirm advance search
    DobbyWebCommon.Click element when ready             ${product_transfer_list_page.btn_confirm_search}

Verify search result date
    [Documentation]     Verify search result date
    [Arguments]         ${date}
    ${locator}          String.Replace string           ${product_transfer_list_page.lbl_date}         **DATE**        ${date}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify search result number
    [Documentation]     Verify search result number
    [Arguments]         ${number}
    ${locator}          String.Replace string           ${product_transfer_list_page.lbl_number}        **NUMBER**      ${number}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify search result type
    [Documentation]     Verify search result type
    [Arguments]         ${type}
    ${locator}          String.Replace string           ${product_transfer_list_page.lbl_type}          **TYPE**        ${type}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify search result from warehouse
    [Documentation]     Verify search result from
    [Arguments]         ${warehouse}
    ${locator}          String.Replace string           ${product_transfer_list_page.lbl_from_warehouse}        **WAREHOUSE**   ${warehouse}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify search result to warehouse
    [Documentation]     Verify search result to
    [Arguments]         ${warehouse}
    ${locator}          String.Replace string           ${product_transfer_list_page.lbl_to_warehouse}        **WAREHOUSE**   ${warehouse}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify search result status
    [Documentation]     Verify search result status
    [Arguments]         ${status}
    ${locator}          String.Replace string           ${product_transfer_list_page.lbl_status}        **STATUS**   ${status}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click create product transfer list
    [Documentation]     Click create product transfer list
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_craete_transfer}

Get id when user create new transfer product list
    [Documentation]     Get id when user create new transfer product list
    ${id_transfer}=     SeleniumLibrary.Get value    ${product_transfer_list_page.txt_id_create_new_list}
    [Return]       ${id_transfer}

Select origin warehouse
    [Documentation]     Select origin warehouse
    SeleniumLibrary.Scroll element into view    ${product_transfer_list_page.btn_select_from_warehouse}
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_select_from_warehouse}

Input origin warehouse
    [Documentation]     Input origin warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_from_warehouse}    ${warehouse}
    SeleniumLibrary.Press keys      None        ENTER

Select destination warehouse
    [Documentation]     Select destination warehouse
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_select_to_warehouse}

Input destination warehouse
    [Documentation]     Input destination warehouse
    [Arguments]         ${warehouse}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_to_warehouse}    ${warehouse}
    SeleniumLibrary.Press keys      None        ENTER

Click save on create transfer page
    [Documentation]     Click checkbox transfer of type
    light_portal_common_keywords.Scroll to bottom of page
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_save}

Verify transfer status on data page
    [Documentation]     Verify transfer status on data page
    [Arguments]         ${status}
    ${status_locator}    String.Replace string    ${product_transfer_list_page.lbl_transfer_status}    ///text///    ${status}
    light_portal_common_keywords.Auto keyword wait element  ${status_locator}
    DobbyWebCommon.Wait until element is visible except stale    ${status_locator}

Verify origin warehouse on data page
    [Documentation]     Verify origin warehouse on data page
    [Arguments]         ${warehouse}
    ${origin_warehouse}    String.Replace string    ${product_transfer_list_page.lbl_origin_warehouse_data}    ///text///    ${warehouse}
    DobbyWebCommon.Wait until element is visible except stale    ${origin_warehouse}

Verify destination warehouse on data page
    [Documentation]     Verify origin warehouse on data page
    [Arguments]         ${warehouse}
    ${destination_warehouse}    String.Replace string    ${product_transfer_list_page.lbl_destination_warehouse_data}    ///text///    ${warehouse}
    DobbyWebCommon.Wait until element is visible except stale    ${destination_warehouse}

Verify transfer status on footer of data page
    [Documentation]     Verify transfer status on footer of data page
    [Arguments]         ${status}
    ${status_locator}    String.Replace string    ${product_transfer_list_page.lbl_footer_transfer_status}    ///text///    ${status}
    DobbyWebCommon.Wait until element is visible except stale    ${status_locator}

Click command button
    [Documentation]     Click command button
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_command}

Click edit from command button
    [Documentation]     Click edit from command button
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_edit_from_command_button}

Click add product button
    [Documentation]     Click edit from command button
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_add_product}

Input product id to add on
    [Documentation]     Input product id to add on
    [Arguments]         ${product}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_input_product_id}    ${product}

Increase number of product
    [Documentation]     Increase number of product
    SeleniumLibrary.Scroll element into view    ${product_transfer_list_page.btn_add_product}
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_increase_number_of_product}

Verify product id on data page
    [Documentation]     Verify product id on data page
    [Arguments]         ${product_id}
    ${product_id_locator}    String.Replace string    ${product_transfer_list_page.lbl_product_id_on_data_page}    ///text///    ${product_id}
    DobbyWebCommon.Wait until element is visible except stale    ${product_id_locator}

Verify amount product on data page
    [Documentation]     Verify amount product on data page
    [Arguments]         ${product_amount}
    ${product_amount_locator}    String.Replace string    ${product_transfer_list_page.lbl_product_amount}    ///text///    ${product_amount}
    DobbyWebCommon.Wait until element is visible except stale    ${product_amount_locator}

Click select product button
    [Documentation]
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_select_product}

Click select default product button
    [Documentation]
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_select_default_product}

Input product id on select product function
    [Documentation]     Input product id to add on
    [Arguments]         ${product_id}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_search_product_on_added_page}    ${product_id}

Click select product button on select product function
    [Documentation]     Click select product button on select product function
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_select_on_added_page}

Click transfer partial of goods
    [Documentation]     Click transfer partial of goods
    light_portal_common_keywords.Wait for jquery loading completed
    SeleniumLibrary.Scroll Element Into View    ${product_transfer_list_page.xpt_focus_transfer}
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_transfer_partial_goods}

Click decrease button on trasfer partial of goods page
    [Documentation]     Click decrease button on trasfer partial of goods page
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_decrease_on_transfer_page}

Click save button on trasfer partial of goods page
    [Documentation]     Click save button on trasfer partial of goods page
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_save_on_transfer_page}

Click transfer all goods
    [Documentation]     Click transfer all goods
    SeleniumLibrary.Scroll element into view    ${product_transfer_list_page.xpt_focus}
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_transfer_all_goods}

Click save button on transfer all goods page
    [Documentation]     Click save button on transfer all goods page
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_save_transfer_all_goods}

Click cancel transfer goods
    [Documentation]     Click cancel transfer goods
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_cancel_transfer_goods}

Click confirm cancel transfer goods
    [Documentation]     Click confirm cancel transfer goods
    DobbyWebCommon.Click element when ready     ${product_transfer_list_page.btn_confirm_cancel}

Search transfer number
    [Documentation]     Search transfer number
    [Arguments]         ${transfer_id}
    DobbyWebCommon.Input text to element when ready     ${product_transfer_list_page.txt_search_transfer_id}    ${transfer_id}
    SeleniumLibrary.Press keys      None        ENTER

Verify cancel status should be displayed
    [Documentation]     Verify cancel status should be displayed
    DobbyWebCommon.Wait until element is visible except stale   ${product_transfer_list_page.lbl_cancel_status}

Input basic data of transfer list
    [Documentation]    กรอกข้อมูลพื้นฐานของรายการโอน
    [Arguments]        ${basic_data}
    ${number}=    light_portal_common_keywords.Auto keyword random string         ${basic_data ['name']}
    DobbyWebCommon.Input text to element when ready    ${xpt_basic_transfer_input.name}    ${number}