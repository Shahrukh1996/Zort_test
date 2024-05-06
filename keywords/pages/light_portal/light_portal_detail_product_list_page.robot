*** Variables ***
${detail_product_list_page.btn_delete_list}             xpath=//span[text()='ลบ']
${detail_product_list_page.btn_confirm_delete}          xpath=//p[text()='ยืนยันการลบ']/ancestor::div[@class="modal-content"]//button[text()='ยืนยัน']
${detail_product_list_page.lbl_product_id}              xpath=//span[text()='รหัสสินค้า']/following-sibling::strong[text()='**product_id**']
${detail_product_list_page.lbl_product_name}            xpath=//h2[contains(text(),'**name**')]
${detail_product_list_page.lbl_purchase_price}          xpath=//span[text()='ราคาซื้อ']/following-sibling::strong[text()='**price** บาท']
${detail_product_list_page.lbl_sell_price}              xpath=//span[text()='ราคาขาย']/following-sibling::strong[text()='**price** บาท']
${detail_product_list_page.lbl_remain}                  xpath=//h2[text()='สินค้าคงเหลือ ']/following-sibling::p[text()='**remain**']
${detail_product_list_page.lbl_ready_for_sell}          xpath=//h2[text()='สินค้าพร้อมขาย ']/following-sibling::p[text()='**ready**']
${detail_product_list_page.btn_edit_product}            xpath=//span[text()='แก้ไข']
${detail_product_list_page.txt_edit_prod_name}          id=editproductname
${detail_product_list_page.btn_save_edit}               xpath=//div[@id='menuProductProfile']//button[text()='บันทึก']
${detail_product_list_page.btn_adjust_amount}           xpath=//span[text()='ปรับจำนวน']
${detail_product_list_page.btn_warehouse_adjust}        xpath=//div[@id='warehouseproductdialog']//td[text()='**WAREHOUSE**']/ancestor::tr//a[text()='ปรับ']
${detail_product_list_page.txt_adjust_amount}           id=adjustnumber
${detail_product_list_page.txt_adjust_price}            id=adjustpricepernumber
${detail_product_list_page.btn_save_adjust}             xpath=//div[@id='adjustModal']//button[text()='บันทึก']
${detail_product_list_page.btn_command}                 xpath=//button//span[text()='คำสั่ง']
${detail_product_list_page.btn_command_buy}             xpath=//a//span[text()='ซื้อสินค้า']
${detail_product_list_page.btn_command_sell}            xpath=//a//span[text()='ขายสินค้า']
${detail_product_list_page.btn_command_transfer}        xpath=//a//span[text()='โอนสินค้า']

*** Keywords ***
Click delete product list
    [Documentation]     Click delete product list
    DobbyWebCommon.Click element when ready         ${detail_product_list_page.btn_delete_list}

Click comfirm delete product list
    [Documentation]     Click confirm delete product list
    DobbyWebCommon.Click element when ready         ${detail_product_list_page.btn_confirm_delete}

Verify product list id
    [Documentation]     Verify product list id
    [Arguments]     ${id}
    ${locator}      String.Replace string           ${detail_product_list_page.lbl_product_id}      **product_id**          ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list name
    [Documentation]     Verify product list name
    [Arguments]     ${name}
    ${locator}      String.Replace string           ${detail_product_list_page.lbl_product_name}    **name**                ${name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list purchase price
    [Documentation]     Verify product list purchase price
    [Arguments]         ${purchase_price}
    ${locator}          String.Replace string       ${detail_product_list_page.lbl_purchase_price}      **price**           ${purchase_price}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list sell price
    [Documentation]     Verify product list sell price
    [Arguments]         ${sell_price}
    ${locator}          String.Replace string       ${detail_product_list_page.lbl_sell_price}          **price**           ${sell_price}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list remain
    [Documentation]     Verify product list remain
    [Arguments]         ${remains}
    ${locator}          String.Replace string       ${detail_product_list_page.lbl_remain}              **remain**          ${remains}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify product list ready for sell
    [Documentation]     Verify product list ready for sell
    [Arguments]         ${amount}
    ${locator}          String.Replace string       ${detail_product_list_page.lbl_ready_for_sell}      **ready**           ${amount}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click edit product
    [Documentation]     Click edit product
    DobbyWebCommon.Click element when ready                         ${detail_product_list_page.btn_edit_product}

Input edit product name
    [Documentation]     Input edit product name
    [Arguments]         ${name}
    DobbyWebCommon.Input text to element when ready                 ${detail_product_list_page.txt_edit_prod_name}      ${name}

Click save edit product
    [Documentation]     Click save edit product
    DobbyWebCommon.Click element when ready                         ${detail_product_list_page.btn_save_edit}

Click adjust product amount
    [Documentation]     Click adjust product amount
    DobbyWebCommon.Click element when ready                         ${detail_product_list_page.btn_adjust_amount}

Click select product for adjust amount
    [Documentation]     Click select product for adjust amount
    [Arguments]         ${warehouse}
    ${locator}          String.Replace string               ${detail_product_list_page.btn_warehouse_adjust}    **WAREHOUSE**       ${warehouse}
    DobbyWebCommon.Click element when ready                         ${locator}

Input adjust amount
    [Documentation]     Input adjust amount
    [Arguments]         ${amount}
    DobbyWebCommon.Click element when ready                         ${detail_product_list_page.txt_adjust_amount}
    DobbyWebCommon.Input text to element when ready                 ${detail_product_list_page.txt_adjust_amount}           ${amount}

Input adjust price per piece
    [Documentation]     Input adjust price per piece
    [Arguments]         ${price}
    DobbyWebCommon.Click element when ready                         ${detail_product_list_page.txt_adjust_price}
    DobbyWebCommon.Input text to element when ready                 ${detail_product_list_page.txt_adjust_price}            ${price}

Click save adjust amount
    [Documentation]     Click save adjust amount
    DobbyWebCommon.Click element when ready                         ${detail_product_list_page.btn_save_adjust}

Click command button
    [Documentation]     CLick command button
    DobbyWebCommon.Click element when ready         ${detail_product_list_page.btn_command}

Click command buy product
    [Documentation]     Click command buy product
    DobbyWebCommon.Click element when ready         ${detail_product_list_page.btn_command_buy}

Click command sell product
    [Documentation]     Click command sell product
    DobbyWebCommon.Click element when ready         ${detail_product_list_page.btn_command_sell}

Click command transfer product
    [Documentation]     Click command transfer product
    DobbyWebCommon.Click element when ready         ${detail_product_list_page.btn_command_transfer}