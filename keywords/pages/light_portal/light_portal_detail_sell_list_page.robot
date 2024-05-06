*** Variables ***
${detail_sell_list_page.lbl_create_success}                     xpath=//p[@id='successmsg' and text()='บันทึกสำเร็จ']
${detail_sell_list_page.btn_ok}                                 xpath=//div[contains(@class,'modal-singlebtn-dialog')]//div[@class='modal-footer ']//button[contains(@class,'print-top-block__flex__button')]
${detail_sell_list_page.lbl_payment_status}                     xpath=//p[@id='overview-paymented']/span[text()='$status']
${detail_sell_list_page.lbl_transfer_status}                    xpath=//p[@id='overview-stock']/span[text()='$status']
${detail_sell_list_page.lbl_shipping_form}                      xpath=//p[@id='overview-logistic' and text()='$shipping']
${detail_sell_list_page.lbl_topic_detail}                       xpath=//div[@class='form-group-view row']/div[text()='$topic']/following-sibling::div[contains(.,'$detail')]
${detail_sell_list_page.lbl_order_detail}                       xpath=//div[@class='t-responsive']//table[contains(@class,'zort-table--full')]//td[contains(.,'$product_name')]//ancestor::tr//td[$column]
${detail_sell_list_page.lbl_product_name}                       xpath=//div[@class='t-responsive']//table[contains(@class,'zort-table--full')]//td[contains(.,'$product_name')]
${detail_sell_list_page.lbl_net_price}                          xpath=//div[@id='tour-transaction-product']//div/p[.='มูลค่ารวมสุทธิ']/../following-sibling::div/p[.='$net_price']
${detail_sell_list_page.lbl_status_payment}                     xpath=//div[@id='showpayment']/span[.='ชำระครบ']
${detail_sell_list_page.btn_extra_payment}                      xpath=//div[@class='box-white']//a[contains(.,'ชำระเพิ่ม')]
${detail_sell_list_page.btn_command_data}                       xpath=//button[contains(@class, 'button')]/span[text()='คำสั่ง']
${detail_sell_list_page.btn_edit_data}                          xpath=//li/a[text()='แก้ไข']
${detail_sell_list_page.btn_save}                               xpath=//button[contains(@class, 'button-primary')][contains(text(), 'บันทึก')]
${detail_sell_list_page.add_amount_payment}                     xpath=//a[contains(@class, 'button-primary')]/i
${detail_sell_list_page.btn_save_on_transfer_page}              xpath=//div[@class='modal-footer ']/button[@onclick='updatePartialTransaction();'][contains(text(), 'บันทึก')]
${detail_sell_list_page.txt_input_number_of_goods}              id=remainingnumber1
${detail_sell_list_page.btn_transfer_all_goods}                 xpath=//span[text()='โอนสินค้าออกจากคลัง']
${detail_sell_list_page.btn_confirm_transfer_partial_goods}     xpath=//div[@id='transferModal']//div[@class='modal-footer ']/button[contains(text(), 'บันทึก')]
${detail_sell_list_page.btn_cancel_order}                       xpath=//a[text()='ยกเลิกรายการ']
${detail_sell_list_page.btn_confirm_cancel_order}               xpath=//button[@onclick="confirmPopup();"][text()='ยืนยัน']
${detail_sell_list_page.lbl_status_cancel_order}                xpath=//td[@class='status text-center']/span[text()='ยกเลิก']
${detail_sell_list_page.btn_import_file}                        xpath=//button[contains(text(), 'นำเข้าไฟล์ (Excel)')]
${detail_sell_list_page.btn_choose_file}                        id=fFile
${detail_sell_list_page.btn_menu_detail_sell_list_page}         xpath=//a[@class='submenuactive'][contains(text(), 'ดูรายการขาย')]
${detail_sell_list_page.btn_save_on import_file_page}           xpath=//div[@id='importModal']//div[@class='modal-footer ']/button[contains(text(), 'บันทึก')]
${detail_sell_list_page.btn_okay_on_choose_file_page}           xpath=//div[@id='successModal']//button[text()='ตกลง']
${detail_sell_list_page.lbl_order_number}                       xpath=//td[@class='name']//a[contains(text(), '///text///')]
${detail_sell_list_page.btn_more}                               xpath=//td[@class='name']/div/a[text()='Automate_testing']/ancestor::tr/td[@class='chk']/div/label/input
${detail_sell_list_page.txt_input_quick_search}                 id=quicksearchtext
${detail_sell_list_page.btn_delete_by_order_number}             xpath=//div[@id='checkboxrecordarea0']/div/ul[@class='dropdown-menu sub-nav']/li/a[text()='ลบรายการ']
${detail_sell_list_page.btn_confirmed_delete_by_order_number}   xpath=//p[@id='confirmheadertext']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']/div/button[text()='ยืนยัน']
${detail_sell_list_page.lbl_order_name}                         xpath=//div[@id="TransactionTable"]//span[contains(text(),'///text///')]
${detail_sell_list_page.btn_search_advance}                     id=btn-switch-filter
${detail_sell_list_page.txt_input_name_of_order}                id=searchnumber
${detail_sell_list_page.btn_cod_box}                            id=iscod-advancesearch
${detail_sell_list_page.btn_search_on_advance}                  xpath=//div[@id='searchAdvance']//div[@class='search-advance__body']//input[contains(@value, 'ค้นหา')]
${detail_sell_list_page.lbl_tracking_number}                    xpath=//div[text()='Tracking No.']/following-sibling::div[contains(text(),'number')]
${detail_sell_list_page.lbl_sell_detail_number}                 xpath=//div[@id='tour-transaction-info']//div[contains(text(),'///text///')]
${detail_sell_list_page.lbl_customer_detail_name}               xpath=//div[@id='tour-transaction-info']//a[contains(text(),'///text///')]
${detail_sell_list_page.lbl_product_detail_name}                xpath=//div[@id='tour-transaction-product']//a[contains(text(),'///text///')]
${detail_sell_list_page.lbl_shipment_detail_channel}            xpath=//div[@id='tour-transaction-shipment']//div[contains(text(),'///text///')]
${detail_sell_list_page.btn_show_hiden_list}                    xpath=//form[@id='old-filter']//span[contains(text(),'แสดงรายการที่ถูกซ่อน')]
${detail_sell_list_page.btn_return_product}                     xpath=//a[text()='รับคืนสินค้าเข้า']
${detail_sell_list_page.xpt_focus}                              xpath=//div[@id='conversationrow']
${detail_sell_list_page.minimize_tab_taskManager}               xpath=//div[@class='file-manager']//span[text()='Task Manager']/following-sibling::span[@class='pull-right']
${detail_sell_list_page.xpt_focus_transferAll}                  xpath=//div[@id='pendingstockmovement']/ancestor::div[@class='box-white']

*** Keywords ***

Verify create sell list success
    [Documentation]     Verify create sell list success
    DobbyWebCommon.Wait until element is visible except stale         ${detail_sell_list_page.lbl_create_success}

Click ok button
    [Documentation]     Click ok button in popup successfully
    DobbyWebCommon.Click element when ready                           ${detail_sell_list_page.btn_ok}

Payment status should be
    [Documentation]     Payment status should be
    [Arguments]     ${payment_status}
    ${lbl_payment_status}         String.Replace string          ${detail_sell_list_page.lbl_payment_status}    $status     ${payment_status}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_payment_status}

Product transfer status should be
    [Documentation]     Product transfer status should be
    [Arguments]     ${transfer_status}
    ${lbl_transfer_status}         String.Replace string          ${detail_sell_list_page.lbl_transfer_status}    $status     ${transfer_status}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_transfer_status}

Shipping form should be
    [Documentation]     Shipping form should be
    [Arguments]     ${shipping_form}
    ${lbl_shipping_form}         String.Replace string          ${detail_sell_list_page.lbl_shipping_form}     $shipping     ${shipping_form}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_shipping_form}

Detailed review of the topic should be
    [Documentation]     Detailed review of the topic should be
    [Arguments]     ${topic}  ${detail}
    ${lbl_topic_detail}         String.Replace string            ${detail_sell_list_page.lbl_topic_detail}     $topic     ${topic}
    ${lbl_topic_detail}         String.Replace string            ${lbl_topic_detail}     $detail     ${detail}
    DobbyWebCommon.Wait until element is visible except stale    ${lbl_topic_detail}

Verify product name
    [Documentation]     Verify code by product name
    [Arguments]     ${product_name}
    ${lbl_product_name}         String.Replace string    ${detail_sell_list_page.lbl_product_name}  $product_name    ${product_name}
    DobbyWebCommon.Wait until element is visible except stale    ${lbl_product_name}

Verify code by product name
    [Documentation]     Verify code by product name
    [Arguments]     ${code}  ${product_name}
    ${lbl_order_detail}         String.Replace string            ${detail_sell_list_page.lbl_order_detail}    $product_name     ${product_name}
    ${lbl_order_detail}         String.Replace string            ${lbl_order_detail}     $column     2
    ${get_code}   DobbyWebCommon.Get text from element when ready     ${lbl_order_detail}
    BuiltIn.Should be equal   ${code}  ${get_code}

Verify amount by product name
    [Documentation]     Verify amount by product name
    [Arguments]     ${amount}  ${product_name}
    ${lbl_order_detail}         String.Replace string            ${detail_sell_list_page.lbl_order_detail}    $product_name     ${product_name}
    ${lbl_order_detail}         String.Replace string            ${lbl_order_detail}     $column     4
    ${get_amount}   DobbyWebCommon.Get text from element when ready     ${lbl_order_detail}
    BuiltIn.Should be equal   ${amount}  ${get_amount}

Verify unit value by product name
    [Documentation]     Verify unit value by product name
    [Arguments]     ${unit_value}  ${product_name}
    ${lbl_order_detail}         String.Replace string            ${detail_sell_list_page.lbl_order_detail}    $product_name     ${product_name}
    ${lbl_order_detail}         String.Replace string            ${lbl_order_detail}     $column     5
    ${get_unit_value}   DobbyWebCommon.Get text from element when ready     ${lbl_order_detail}
    BuiltIn.Should be equal   ${unit_value}  ${get_unit_value}

Verify unit discount by product name
    [Documentation]     Verify unit discount by product name
    [Arguments]     ${unit_discount}  ${product_name}
    ${lbl_order_detail}         String.Replace string            ${detail_sell_list_page.lbl_order_detail}    $product_name     ${product_name}
    ${lbl_order_detail}         String.Replace string            ${lbl_order_detail}     $column     6
    ${get_unit_discount}   DobbyWebCommon.Get text from element when ready     ${lbl_order_detail}
    BuiltIn.Should be equal   ${unit_discount}  ${get_unit_discount}

Verify total price by product name
    [Documentation]     Verify unit value by product name
    [Arguments]     ${total_price}  ${product_name}
    ${lbl_order_detail}         String.Replace string            ${detail_sell_list_page.lbl_order_detail}    $product_name     ${product_name}
    ${lbl_order_detail}         String.Replace string            ${lbl_order_detail}     $column     7
    ${get_total_price}   DobbyWebCommon.Get text from element when ready     ${lbl_order_detail}
    BuiltIn.Should be equal    ${total_price}  ${get_total_price}

Total net price should be
    [Documentation]  Total net price should be
    [Arguments]   ${total_net_price}
    ${lbl_order_detail}         String.Replace string            ${detail_sell_list_page.lbl_net_price}    $net_price     ${total_net_price}
    DobbyWebCommon.Wait until element is visible except stale    ${lbl_order_detail}

Verify status payment successfully
    [Documentation]  Verify status payment successfully
    DobbyWebCommon.Wait until element is visible except stale   ${detail_sell_list_page.lbl_status_payment}

Click extra payment
    [Documentation]  Click extra payment
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_extra_payment}

Input payment price
    [Documentation]  Input payment price
    [Arguments]  ${price}
    DobbyWebCommon.Input text to element when ready     id=paymentamount     ${price}

Click confirm payment
    [Documentation]  Click confirm payment
    DobbyWebCommon.Click element when ready       xpath=//div[@class='modal-footer ']//button[.='ยืนยันการชำระเงิน']

Click transfer some products
    [Documentation]  Click transfer some products
    SeleniumLibrary.Scroll element into view      ${detail_sell_list_page.xpt_focus}
    DobbyWebCommon.Click element when ready       xpath=//div[@id='tour-action-transfer']//button[.='โอนสินค้าบางส่วน']

Input amount transfer
    [Documentation]  Input amount transfer
    [Arguments]    ${amount}
    DobbyWebCommon.Input text to element when ready     id=remainingnumber1     ${amount}
    SeleniumLibrary.Press keys      None        TAB

Input confirm transfer
    [Documentation]  Input confirm transfer
    DobbyWebCommon.Click element when ready       xpath=//div[@class='modal-content']//div[@id='transactionproductdialog']/../following-sibling:: div//button[.='บันทึก']

Click edit data payment
    [Documentation]     Click edit data payment
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_command_data}
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_edit_data}

Click save after change data
    [Documentation]     Click save after change data
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_save}

Add amount payment
    [Documentation]     Add amount payment
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.add_amount_payment}

Change number of goods transfer
    [Documentation]     Change number of goods transfer
    [Arguments]     ${number}
    light_portal_common_keywords.Auto keyword clear input text  ${detail_sell_list_page.txt_input_number_of_goods}
    DobbyWebCommon.Input text to element when ready         ${detail_sell_list_page.txt_input_number_of_goods}     ${number}

Click save button on goods transfer page
    [Documentation]     Click save button on goods transfer page
    DobbyWebCommon.Click element when ready         ${detail_sell_list_page.btn_save_on_transfer_page}

Click transfer all goods
    [Documentation]     Click transfer all goods
    SeleniumLibrary.Scroll element into view        ${detail_sell_list_page.xpt_focus_transferAll}
    DobbyWebCommon.Click element when ready         ${detail_sell_list_page.btn_transfer_all_goods}

Click confirm transfer all goods
    [Documentation]     Click confirm transfer all goods
    DobbyWebCommon.Click element when ready         ${detail_sell_list_page.btn_confirm_transfer_partial_goods}

Click command button
    [Documentation]     Click command button
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_command_data}

Click cancel button on transfer page
    [Documentation]     Click cancel button on transfer page
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_cancel_order}
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_confirm_cancel_order}

Check status cancel is confirmed
    [Documentation]     Check status cancel is confirmed
    DobbyWebCommon.Wait until element is visible except stale       ${detail_sell_list_page.lbl_status_cancel_order}

Click to detail sell list page
    [Documentation]     Click to detail sell list page
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_menu_detail_sell_list_page}

Click import file button
    [Documentation]     Click import file button
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_import_file}

Click choose file button
    [Documentation]     Click choose file button
    ${path}    OperatingSystem.Join path        ${CURDIR}/../../../resources/testdata/light_portal/sell_template.xlsx
    DobbyWebCommon.Browse file when ready       ${detail_sell_list_page.btn_choose_file}        ${path}

Click save button on import file page
    [Documentation]     Click save button on import file page
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_save_on import_file_page}

Click okay after choose file successfully
    [Documentation]     Click okay after choose file successfully
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_okay_on_choose_file_page}

Search from list
    [Documentation]     Search from list
    [Arguments]     ${order_number}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Input text to element when ready         ${detail_sell_list_page.txt_input_quick_search}      ${order_number}
    SeleniumLibrary.Press keys      None        ENTER

Check order number
    [Documentation]     Check order number
    [Arguments]     ${order_number}
    ${order_number_path}    Replace String      ${detail_sell_list_page.lbl_order_number}       ///text///      ${order_number}
    DobbyWebCommon.Wait until element is visible except stale       ${order_number_path}

Delete order by order number
    [Documentation]     Delete order by order number
    light_portal_common_keywords.Wait for last element of any page is displayed
    light_portal_common_keywords.Scroll to bottom of page
    DobbyWebCommon.Click element when ready  ${detail_sell_list_page.btn_more}
    DobbyWebCommon.Click element when ready  //div[@id='checkboxrecordarea0']/div/button/span[text()='คำสั่ง']
    DobbyWebCommon.Click element when ready  ${detail_sell_list_page.btn_delete_by_order_number}
    DobbyWebCommon.Input text to element when ready  //p[@id='confirmheadertext']/ancestor::div[@class='msg-area']/input[@id='confirmdeletetext']  confirm
    DobbyWebCommon.Click element when ready  ${detail_sell_list_page.btn_confirmed_delete_by_order_number}

Click into search advance page
    [Documentation]     Click into search advance page
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_search_advance}

Search on advance page by name
    [Documentation]     Search on advance page by name
    [Arguments]     ${order_name}
    DobbyWebCommon.Input text to element when ready     ${detail_sell_list_page.txt_input_name_of_order}     ${order_name}

Quick search on advance page by name
    [Documentation]     Quick search on advance page by name
    [Arguments]     ${order_name}
    light_portal_detail_sell_list_page.Click into search advance page
    DobbyWebCommon.Input text to element when ready     ${detail_sell_list_page.txt_input_name_of_order}     ${order_name}
    light_portal_detail_sell_list_page.Click search button on advance search page

Check cod box on search advance page
    [Documentation]     Check cod box on search advance page
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_cod_box}

Click search button on advance search page
    [Documentation]     Click search button on advance search page
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_search_on_advance}

Check order on advance search page
    [Documentation]     Check order on advance search page
    [Arguments]     ${order_name}
    ${order_name_path}    Replace String      ${detail_sell_list_page.lbl_order_name}       ///text///      ${order_name}
    DobbyWebCommon.Wait until element is visible except stale       ${order_name_path}

Delete data when data is displayed
    [Documentation]     Delete data when data is displayed
    ${keyword_status}=      BuiltIn.Run keyword and return status    SeleniumLibrary.Wait until element is visible      //div[@id='TransactionTable']//a[text()='สร้างรายการขายได้ที่นี่']       ${short_timeout}
    IF    "${keyword_status}"=="False"
        light_portal_detail_sell_list_page.Delete order by order number
    END
    [Return]        ${keyword_status}

Verify tracking number
    [Documentation]     Verify tracking number
    [Arguments]     ${number}
    ${tracking_number}      String.Replace string       ${detail_sell_list_page.lbl_tracking_number}    number      ${number}
    DobbyWebCommon.Wait until element is visible except stale           ${tracking_number}

Sell number on detail field should be
    [Documentation]     Sell number on detail field should be
    [Arguments]     ${sell_number}
    ${lbl_sell_number}         String.Replace string          ${detail_sell_list_page.lbl_sell_detail_number}     ///text///     ${sell_number}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_sell_number}

Customer name on detail field should be
    [Documentation]     Customer name on detail field should be
    [Arguments]     ${customer_name}
    ${lbl_customer_name}         String.Replace string          ${detail_sell_list_page.lbl_customer_detail_name}     ///text///     ${customer_name}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_customer_name}

Product name on detail field should be
    [Documentation]     Customer name on detail field should be
    [Arguments]     ${product_name}
    ${lbl_product_name}         String.Replace string          ${detail_sell_list_page.lbl_product_detail_name}     ///text///     ${product_name}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_product_name}

Shipment on detail field should be
    [Documentation]     Customer name on detail field should be
    [Arguments]     ${shipment_channel}
    ${lbl_shipment_channel}         String.Replace string          ${detail_sell_list_page.lbl_shipment_detail_channel}     ///text///     ${shipment_channel}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_shipment_channel}

Verify sell template on sell list data not visible on page
    [Documentation]     Verify sell template on sell list data not visible on page
    [Arguments]     ${order_number}
    light_portal_detail_sell_list_page.Quick Search on advance page by name      ${order_number}
    ${keyword_status}=      BuiltIn.Run keyword and return status   light_portal_detail_sell_list_page.Check order number    ${order_number}
    IF    "${keyword_status}"=="True"
        light_portal_detail_sell_list_page.Delete order by order number
    END
    [Return]        ${keyword_status}

Check hiden list box on search advance page
    [Documentation]     Check cod box on search advance page
    DobbyWebCommon.Click element when ready     ${detail_sell_list_page.btn_show_hiden_list}

Click return product command
    [Documentation]         Click return product command
    DobbyWebCommon.Click element when ready         ${detail_sell_list_page.btn_return_product}

Click minimize tab task Manager
    [Documentation]    Click minimize tab task Manager
    DobbyWebCommon.Click element when ready         ${detail_sell_list_page.minimize_tab_taskManager}