*** Variables ***
${variant_list_page.bnt_add_product}                    xpath=//div[@class='content']//button[contains(text(),'เพิ่มสินค้าหลากคุณสมบัติ')]
${variant_list_page.bnt_save_on_add_product}            xpath=//div[@id='variantModal']//button[@onclick='insertVariant();'][contains(text(),'บันทึก')]
${variant_list_page.lbl_error_popup}                    xpath=//p[@id="errormsg"][text()='กรุณาใส่ข้อมูลให้ครบถ้วน']
${variant_list_page.btn_okay_on_error_popup}            xpath=//div[@id="errorModal"]//button[text()='ตกลง']
${variant_list_page.txt_main_product_id}                id=addvariantcode
${variant_list_page.txt_variant_group_name}             id=addvariantname
${variant_list_page.btn_add_variant_type}               xpath=//div[@id='addvariantbutton']//a[contains(text(), 'เพิ่มคุณสมบัติ')]
${variant_list_page.txt_variant_group_type}             id=variantname
${variant_list_page.btn_kebab_on_product_list}          xpath=//span[text()='///text///']/ancestor::td[@class='name']/following-sibling::td[contains(@class,'action')]//i
${variant_list_page.btn_delete_on_kebab}                xpath=//td[@class='name']/following-sibling::td[@class='action text-right']//a[contains(text(),'ลบ')]
${variant_list_page.txt_confirm_on_delete}              id=confirmdeletetext
${variant_list_page.btn_confirm_delete}                 xpath=//button[@onclick='confirmDeletePopup();'][contains(text(),'ยืนยัน')]
${variant_list_page.btn_edit_on_kebab}                  xpath=//div[@id='VariantTable']//a[text()='แก้ไข']
${variant_list_page.txt_edit_variant_type}              id=variantname///text///
${variant_list_page.btn_save_on_edit_page}              xpath=//button[@onclick='doEditData();'][contains(text(),'บันทึก')]
${variant_list_page.txt_confirm_on_edit}                id=confirmedittext
${variant_list_page.btn_confirm_edit}                   xpath=//button[@onclick='confirmEditPopup();'][contains(text(),'ยืนยัน')]
${variant_list_page.btn_view_sumary}                    xpath=//div[@id='VariantTable']//a[text()='ดูภาพรวม']
${variant_list_page.lbl_inventories}                    xpath=//div[@class='content']//h2[contains(text(), 'สินค้าคงเหลือ')]
${variant_list_page.lbl_inventories_unit}               xpath=//div[@class='content']//h2[contains(text(), 'สินค้าคงเหลือ')]/following-sibling::p/span
${variant_list_page.lbl_ready_to_sell}                  xpath=//div[@class='content']//h2[contains(text(), 'สินค้าพร้อมขาย')]
${variant_list_page.lbl_ready_to_sell_unit}             xpath=//div[@class='content']//h2[contains(text(), 'สินค้าพร้อมขาย')]/following-sibling::p/span
${variant_list_page.lbl_sales_last_month}               xpath=//div[@class='content']//h2[contains(text(), 'ยอดขายเดือนที่แล้ว')]
${variant_list_page.lbl_sales_last_month_unit}          xpath=//div[@class='content']//h2[contains(text(), 'ยอดขายเดือนที่แล้ว')]/following-sibling::p
${variant_list_page.lbl_sales_this_month}               xpath=//div[@class='content']//h2[contains(text(), 'ยอดขายเดือนนี้')]
${variant_list_page.lbl_sales_this_month_unit}          xpath=//div[@class='content']//h2[contains(text(), 'ยอดขายเดือนนี้')]/following-sibling::p
${variant_list_page.lbl_total_sales}                    xpath=//span[@id='salestext'][contains(text(), 'ยอดขายรวม')]
${variant_list_page.lbl_best_sales}                     xpath=//span[@id='bestsalestext'][contains(text(), 'สินค้าขายดีย้อนหลัง 7 วัน')]
${variant_list_page.lbl_store_inventory}                xpath=//span[@id='bestsalestext'][contains(text(), 'สินค้าคงเหลือ รายคลัง')]
${variant_list_page.lbl_all_product}                    xpath=//span[@id='transfertext'][contains(text(), 'สินค้าเคลื่อนไหวทั้งหมด')]
${variant_list_page.txt_search_variant_product}         id=quicksearchtext
${variant_list_page.lbl_product_code}                   xpath=//div[@id='VariantTable']//td[@class='id'][contains(text(), '///text///')]
${variant_list_page.lbl_product_name}                   xpath=//div[@id='VariantTable']//td[@class='name']//span[contains(text(), '///text///')]
${variant_list_page.lbl_main_id_usage}                  xpath=//input[@id='addvariantcode'][contains(@onkeyup, '(this.id);')]
${variant_list_page.lbl_head_of_data}                   xpath=//td[@class='id'][text()='///text///']

*** Keywords ***

Click create product on variant list page
    [Documentation]     Click create product on variant list page
    DobbyWebCommon.Click element when ready         ${variant_list_page.bnt_add_product}

Click save button on create product on variant list page
    [Documentation]     Click save button after add new product on variant list
    DobbyWebCommon.Click element when ready         ${variant_list_page.bnt_save_on_add_product}

Popup is displayed when data not complete
    [Documentation]     Popup is displayed when data not complete
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_error_popup}

Click okay button on error message popup
    [Documentation]     Click okay button on error message popup
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_okay_on_error_popup}

Wait until main id is ready
    [Documentation]     Wait until main id is ready
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_main_id_usage}

Get main product id
    [Documentation]     Get main product id
    ${main_product_id}=     SeleniumLibrary.Get value        ${variant_list_page.txt_main_product_id}
    [Return]                ${main_product_id}

Input main product id
    [Documentation]     Input return product id
    [Arguments]         ${main_product_id}
    DobbyWebCommon.Input text to element when ready     ${variant_list_page.txt_main_product_id}      ${main_product_id}

Input variant group name
    [Documentation]     Input return product id
    [Arguments]         ${variant_group_name}
    DobbyWebCommon.Input text to element when ready     ${variant_list_page.txt_variant_group_name}      ${variant_group_name}

Input variant type with any field
    [Documentation]     Input return product id
    [Arguments]         ${number}    ${variant_type}
    DobbyWebCommon.Input text to element when ready     ${variant_list_page.txt_variant_group_type}${number}      ${variant_type}

Click add variant type button
    [Documentation]     Click add variant type button
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_add_variant_type}

Wait until product is visible
    [Documentation]     Wait until product is visible
    [Arguments]         ${product_code}
    ${lbl_product}      String.Replace String   ${variant_list_page.lbl_head_of_data}       ///text///      ${product_code}
    DobbyWebCommon.Click element when ready     ${lbl_product}

Click kebab button on product list
    [Documentation]     Click kebab button on product list
    [Arguments]         ${product_name}
    ${kebab_button}     String.Replace String   ${variant_list_page.btn_kebab_on_product_list}       ///text///      ${product_name}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready     ${kebab_button}
    light_portal_common_keywords.Wait until kebab menu is visible

Click delete on kebab function
    [Documentation]     Click delete on kebab function
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_delete_on_kebab}

Type confirm to delete data
    [Documentation]     Type confirm to delete data
    [Arguments]         ${confirm_word}
    DobbyWebCommon.Input text to element when ready     ${variant_list_page.txt_confirm_on_delete}      ${confirm_word}

Click confirm button to confirm delete
    [Documentation]     Click confirm button to confirm delete
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_confirm_delete}

Click edit variant type on kebab function
    [Documentation]     Click edit variant type on kebab function
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_edit_on_kebab}

Input variant type on edit page
    [Documentation]     Input variant type on edit page
    [Arguments]         ${row_number}     ${type}
    DobbyWebCommon.Input text to element when ready     ${variant_list_page.txt_variant_group_type}${row_number}      ${type}

Click save button on edit page
    [Documentation]     Click save button on edit page
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_save_on_edit_page}

Type confirm to edit data
    [Documentation]     Type confirm to delete data
    [Arguments]         ${confirm_word}
    DobbyWebCommon.Input text to element when ready     ${variant_list_page.txt_confirm_on_edit}      ${confirm_word}

Click confirm button to confirm edit
    [Documentation]     Click confirm button to confirm delete
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_confirm_edit}

Click view sumary on kebab function
    [Documentation]     Click view sumary on kebab function
    DobbyWebCommon.Click element when ready     ${variant_list_page.btn_view_sumary}

Verify inventories are displayed
    [Documentation]     Verify inventories are displayed
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_inventories}

Get inventories
    [Documentation]     Get inventories
    ${inventories_unit}=     DobbyWebCommon.Get text from element when ready        ${variant_list_page.lbl_inventories_unit}
    [Return]                ${inventories_unit}

Verify ready to sell function is displayed
    [Documentation]     Verify ready to sell function is displayed
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_ready_to_sell}

Get amount product ready to sell
    [Documentation]     Get amount product ready to sell
    ${ready_to_sell_unit}=     DobbyWebCommon.Get text from element when ready        ${variant_list_page.lbl_ready_to_sell_unit}
    [Return]                ${ready_to_sell_unit}

Verify total sales in last month is displayed
    [Documentation]     Verify total sales in last month is displayed
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_sales_last_month}

Get total sales in last month
    [Documentation]     Get total sales in last month
    ${sales_last_month_unit}=     DobbyWebCommon.Get text from element when ready        ${variant_list_page.lbl_sales_last_month_unit}
    [Return]                ${sales_last_month_unit}

Verify total sales in this month is displayed
    [Documentation]     Verify total sales in this month is displayed
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_sales_this_month}

Get total sales in this month
    [Documentation]     Get total sales in this month
    ${sales_this_month_unit}=     DobbyWebCommon.Get text from element when ready        ${variant_list_page.lbl_sales_this_month_unit}
    [Return]                ${sales_this_month_unit}

Verify total sales of all
    [Documentation]     Verify total sales of all
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_total_sales}

Verify best sales table is displayed
    [Documentation]     Verify best sales table is displayed
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_best_sales}

Verify store inventory is displayed
    [Documentation]     Verify store inventory is displayed
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_store_inventory}

Verify all product is displayed
    [Documentation]     Verify all product is displayed
    DobbyWebCommon.Wait until element is visible except stale       ${variant_list_page.lbl_all_product}

Search variant product
    [Documentation]     Type confirm to delete data
    [Arguments]         ${product_code}
    DobbyWebCommon.Click element when ready             ${variant_list_page.txt_search_variant_product}
    DobbyWebCommon.Input text to element when ready     ${variant_list_page.txt_search_variant_product}      ${product_code}

Verify product code should be corrected
    [Documentation]     Verify product code should be corrected
    [Arguments]         ${product_code}
    ${lbl_product_code}     String.Replace String   ${variant_list_page.lbl_product_code}       ///text///      ${product_code}
    DobbyWebCommon.Wait until element is visible except stale     ${lbl_product_code}

Verify product name should be corrected
    [Documentation]     Verify product name should be corrected
    [Arguments]         ${product_name}
    ${lbl_product_name}     String.Replace String   ${variant_list_page.lbl_product_name}       ///text///      ${product_name}
    DobbyWebCommon.Wait until element is visible except stale     ${lbl_product_name}