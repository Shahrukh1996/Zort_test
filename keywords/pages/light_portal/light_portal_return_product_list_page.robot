*** Variables ***
${return_product_list_page.btn_create}                  xpath=//button[text()='สร้าง']
${return_product_list_page.btn_kebab_print}             xpath=//a[text()='id']/parent::div/parent::td/parent::tr//td[@class='action']//i
${return_product_list_page.btn_dropdown_print}          xpath=//a[text()='id']/parent::div/parent::td/parent::tr//td[@class='action']//ul//a[text()='พิมพ์เอกสาร']
${return_product_list_page.btn_paper_size}              xpath=//label[text()='ขนาด']/parent::div/div/label[contains(.,'paper_size')]/input[@name='sizepaper']
${return_product_list_page.select_format_paper}         id=formatpaper
${return_product_list_page.btn_confirm_print}           xpath=//button[@onclick='doDownloadPdf();']
${return_product_list_page.input_print_title}           id=pdfheadername
${return_product_list_page.btn_advance_search}          xpath=//a[text()='ค้นหาขั้นสูง']
${return_product_list_page.input_return_prod_id}        id=searchnumber
${return_product_list_page.input_customer_name}         id=searchcustomername
${return_product_list_page.input_low_value}             id=fromamount
${return_product_list_page.input_high_value}            id=toamount
${return_product_list_page.input_prod_id}               id=searchproduct
${return_product_list_page.input_tel_number}            id=searchcustomerphone
${return_product_list_page.input_email}                 id=searchcustomeremail
${return_product_list_page.input_refer}                 id=searchrefname
${return_product_list_page.btn_warehouse}               xpath=//button[@data-id="searchwarehouseid"]
${return_product_list_page.dropdown_warehouse}          xpath=//span[text()="warehouse"]/parent::a
${return_product_list_page.btn_confirm_search}          xpath=//h3[text()='ค้นหาขั้นสูง']/parent::div//input[@value='ค้นหา']
${return_product_list_page.txt_prod_id}                 xpath=//a[text()='id']
${return_product_list_page.txt_refer}                   xpath=//td[@class='channel' and contains(text(),'refer')]
${return_product_list_page.txt_customer_name}           xpath=//a[text()='name']
${return_product_list_page.create_return_list}              xpath=//div[@id="addTransactionBtn"]//button[contains(text(),'สร้าง')]
${return_product_list_page.txt_return_id}                   id=number
${return_product_list_page.btn_save_return_list}            xpath=//button[text()='บันทึก']
${return_product_list_page.lbl_error_popup}                 xpath=//p[@id="errormsg"][text()='กรุณาใส่ข้อมูลให้ครบถ้วน']
${return_product_list_page.btn_okay_on_error_popup}         xpath=//div[@id="errorModal"]//button[text()='ตกลง']
${return_product_list_page.btn_select_prod}                 xpath=//a[contains(@class,'button') and text()='เลือกสินค้า']
${return_product_list_page.ckb_product_name}                xpath=//div[@id='multiproductdialog']//tbody//td//div[contains(text(),"///text///")]//ancestor::tr//span[@id='notext']
${return_product_list_page.btn_submit_select_prod}          xpath=//div[@id='multiproductdialog']//button[text()='เลือกสินค้า']
${return_product_list_page.lbl_status_return_id}            xpath=//section[@id="main1"]//div[contains(@title, 'บันทึก')][contains(text(), '///text///')]
${return_product_list_page.lbl_payment_status}              xpath=//p[@id="overview-paymented"]/span[contains(text(), '///text///')]
${return_product_list_page.lbl_transfer_status}             xpath=//p[@id="overview-stock"]/span[contains(text(), '///text///')]
${return_product_list_page.txt_search_id}                   id=quicksearchtext
${return_product_list_page.txt_shipping_channel}            id=shippingchannel
${return_product_list_page.btn_command}                     xpath=//div[@id='TransactionTable']//i[@data-toggle='dropdown']
${return_product_list_page.btn_edit}                        xpath=//div[@id='TransactionTable']//a[text()='แก้ไข']
${return_product_list_page.btn_select_return_id}            xpath=//div[@id="TransactionTable"]//a[contains(text(),'///text///')]
${return_product_list_page.lbl_shipping_channel}            xpath=//div[@id="tour-transaction-shipment"]//div[contains(text(), '///text///')]
${return_product_list_page.txt_amount_product}              id=productnumber2
${return_product_list_page.btn_transfer_partial_goods}      xpath=//div[@id='tour-action-transfer']//button[.='โอนสินค้าบางส่วน']
${return_product_list_page.txt_input_number_of_goods}       id=remainingnumber1
${return_product_list_page.btn_save_on_transfer_page}       xpath=//div[@class='modal-footer ']/button[@onclick='updatePartialTransaction();'][contains(text(), 'บันทึก')]
${return_product_list_page.btn_add_more_payment}            xpath=//div[@id='tour-action-payment']//div[@id='showpayment']/following-sibling::div
${return_product_list_page.btn_txt_input_payment}           id=paymentamount
${return_product_list_page.btn_confirm_payment_data}        xpath=//div[@id='paymentModal']//button[text()='ยืนยันการชำระเงิน']
${return_product_list_page.btn_delete_payment_data}         xpath=//div[@id='tour-action-payment']//a[text()='ลบ']
${return_product_list_page.btn_notification}                id=notificationarea
${return_product_list_page.lbl_total_price}                 id=amounttext
${return_product_list_page.lbl_net_price}                   xpath=//div[@id='tour-transaction-product']//div/p[.='มูลค่ารวมสุทธิ']/../following-sibling::div/p
${return_product_list_page.txt_search_product}              id=quicksearchMultiproducttext
${return_product_list_page.lbl_last_elelment_of_page}       xpath=//div[@id='multiproductdialog']//div[contains(text(), 'สินค้า-ทดสอบ')]
${report_overview_page.xpt_focus_select_products}           xpath=//table[@id='productrow']
${report_overview_page.xpt_focus_transfer_some}             xpath=//div[@id='conversationrow']

*** Keywords ***
Click create return product
    [Documentation]     Click create return product
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_create}

Click kebab menu return product
    [Documentation]     Click kebab menu return product
    [Arguments]         ${id}
    ${locator}      String.Replace string       ${return_product_list_page.btn_kebab_print}       id      ${id}
    light_portal_common_keywords.Wait for jquery loading completed
    DobbyWebCommon.Click element when ready     ${locator}
    light_portal_common_keywords.Wait until kebab menu is visible

Click print return product
    [Documentation]     Click print return product
    [Arguments]         ${id}
    ${locator_dropdown}      String.Replace string       ${return_product_list_page.btn_dropdown_print}       id      ${id}
    DobbyWebCommon.Click element when ready     ${locator_dropdown}

Select paper size
    [Documentation]     Select paper size
    [Arguments]         ${size}
    ${locator}      String.Replace string       ${return_product_list_page.btn_paper_size}       paper_size      ${size}
    DobbyWebCommon.Click element when ready     ${locator}

Select format paper
    [Documentation]     Select format paper
    [Arguments]         ${format}
    DobbyWebCommon.Select option by label when ready        ${return_product_list_page.select_format_paper}      ${format}

Input print title
    [Documentation]     Input print title
    [Arguments]         ${title}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_print_title}       ${title}

Click confirm print
    [Documentation]     Click confirm print
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_confirm_print}
    SeleniumLibrary.Switch window       NEW

Click advance search
    [Documentation]     Click advance search
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_advance_search}

Input search return product number
    [Documentation]     Input search return product number
    [Arguments]     ${id}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_return_prod_id}    ${id}

Input search customer name
    [Documentation]     Input search customer name
    [Arguments]     ${name}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_customer_name}     ${name}

Input search low value
    [Documentation]     Input search low value
    [Arguments]     ${value}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_low_value}     ${value}

Input search high value
    [Documentation]     Input search high value
    [Arguments]     ${value}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_high_value}    ${value}

Input search product id
    [Documentation]     Input search product id
    [Arguments]     ${id}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_prod_id}    ${id}

Input search telephone number
    [Documentation]     Input search telephone number
    [Arguments]     ${number}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_tel_number}    ${number}

Input search email
    [Documentation]     Input search email
    [Arguments]     ${email}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_email}     ${email}

Input search refer
    [Documentation]     Input search refer
    [Arguments]     ${refer}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.input_refer}     ${refer}

Click search warehouse dropdown
    [Documentation]     Click search warehouse dropdown
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_warehouse}

Select search warehouse
    [Documentation]     Select serach warehouse
    [Arguments]         ${warehouse}
    ${locator}=       String.Replace string       ${return_product_list_page.dropdown_warehouse}      warehouse       ${warehouse}
    DobbyWebCommon.Click element when ready     ${locator}

Click confirm advance search
    [Documentation]     Click confirm advance search
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_confirm_search}

Verify search return product id
    [Documentation]     Verify return product id
    [Arguments]         ${id}
    ${locator}      String.Replace string       ${return_product_list_page.txt_prod_id}       id      ${id}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Verify search refer
    [Documentation]     Verify search refer
    [Arguments]         ${refer}
    ${locator}      String.Replace string       ${return_product_list_page.txt_refer}   refer       ${refer}
    SeleniumLibrary.Page should contain element     ${locator}

Verify search customer name
    [Documentation]     Verify search refer
    [Arguments]         ${name}
    ${locator}      String.Replace string       ${return_product_list_page.txt_customer_name}   name    ${name}
    DobbyWebCommon.Wait until element is visible except stale       ${locator}

Click create return product button
    [Documentation]     Click create return product button
    DobbyWebCommon.Click element when ready     ${return_product_list_page.create_return_list}

Get return product id
    [Documentation]     Get return product id
    ${return_id}=    SeleniumLibrary.Get value        ${return_product_list_page.txt_return_id}
    [Return]            ${return_id}

Input return product id
    [Documentation]     Input return product id
    [Arguments]     ${return_id}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.txt_return_id}      ${return_id}

Click save return product
    [Documentation]     Click save return product
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_save_return_list}
    light_portal_common_keywords.Auto keyword wait element  //div[@class='content']//h1[contains(normalize-space(.),'รายละเอียดรายการรับคืนสินค้าเข้า')]

Popup is displayed when data not complete
    [Documentation]     Popup is displayed when data not complete
    DobbyWebCommon.Wait until element is visible except stale       ${return_product_list_page.lbl_error_popup}

Click okay button on error message popup
    [Documentation]     Click okay button on error message popup
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_okay_on_error_popup}

Click select products top button
    [Documentation]     Click select products top button
    SeleniumLibrary.Scroll element into view    ${report_overview_page.xpt_focus_select_products}
    DobbyWebCommon.Click element when ready     ${return_product_list_page.btn_select_prod}
    light_portal_common_keywords.Wait for jquery loading completed

Click select product by name
    [Documentation]     Click select product by name
    [Arguments]  ${product_name}
    ${ckb_product_name}         String.Replace string   ${return_product_list_page.ckb_product_name}   ///text///   ${product_name}
    DobbyWebCommon.Click element when ready    ${ckb_product_name}

Click submit select products
    [Documentation]     Click submit select products
    DobbyWebCommon.Click element when ready    ${return_product_list_page.btn_submit_select_prod}

Check return id is created
    [Documentation]     Check return id is created
    [Arguments]     ${return_id}
    ${status_return_id_path}    Replace String      ${return_product_list_page.lbl_status_return_id}       ///text///      ${return_id}
    DobbyWebCommon.Wait until element is visible except stale       ${status_return_id_path}

Payment status should be
    [Documentation]     Payment status should be
    [Arguments]     ${payment_status}
    ${lbl_payment_status}         String.Replace string          ${return_product_list_page.lbl_payment_status}    ///text///     ${payment_status}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_payment_status}

Product transfer status should be
    [Documentation]     Product transfer status should be
    [Arguments]     ${transfer_status}
    ${lbl_transfer_status}         String.Replace string          ${return_product_list_page.lbl_transfer_status}    ///text///     ${transfer_status}
    DobbyWebCommon.Wait until element is visible except stale        ${lbl_transfer_status}

Search by return id
    [Documentation]     Search by return id
    [Arguments]     ${return_id}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.txt_search_id}        ${return_id}

Click more command
    [Arguments]         ${return_id}
    [Documentation]     Click more command
    # DobbyWebCommon.Wait until element is visible except stale     ${return_product_list_page.btn_notification}
    ${new_xpath}=    Replace String      //td[@class='name-buy-return']//a[text()='///text///']       ///text///       ${return_id}
    DobbyWebCommon.Click element when ready     ${new_xpath}

Click edit
    [Documentation]     Click edit
    DobbyWebCommon.Click element when ready     //div[@id='tour-action-other' and @class='btn-group']//span[text()='คำสั่ง']
    DobbyWebCommon.Click element when ready     //div[@id='tour-action-other' and @class='btn-group open']//ul/li/a[text()='แก้ไข']

Input shipping channel
    [Documentation]     Input shipping channel
    [Arguments]     ${shipping}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.txt_shipping_channel}      ${shipping}

Select by return code
    [Documentation]     Select by return code
    [Arguments]     ${return_id}
    ${return_id_selecter}    Replace String      ${return_product_list_page.btn_select_return_id}       ///text///       ${return_id}
    DobbyWebCommon.Click element when ready      ${return_id_selecter}

Verify shipping channel
    [Documentation]     Verify shipping channel
    [Arguments]     ${shipping_channel}
    ${shipping_selecter}    Replace String      ${return_product_list_page.lbl_shipping_channel}       ///text///       ${shipping_channel}
    DobbyWebCommon.Click element when ready     ${shipping_selecter}

Input amount product
    [Documentation]     Input amount product
    [Arguments]     ${amount}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.txt_amount_product}       ${amount}

Click transfer some products
    [Documentation]     Click transfer some products
    SeleniumLibrary.Scroll element into view      ${report_overview_page.xpt_focus_transfer_some}
    DobbyWebCommon.Click element when ready       ${return_product_list_page.btn_transfer_partial_goods}

Change number of goods transfer
    [Documentation]     Change number of goods transfer
    [Arguments]     ${number}
    light_portal_common_keywords.Auto keyword clear input text           ${return_product_list_page.txt_input_number_of_goods}
    DobbyWebCommon.Input text to element when ready         ${return_product_list_page.txt_input_number_of_goods}     ${number}

Click save button on goods transfer page
    [Documentation]     Click save button on goods transfer page
    DobbyWebCommon.Click element when ready         ${return_product_list_page.btn_save_on_transfer_page}

Click add more payment
    [Documentation]     Click add more payment
    DobbyWebCommon.Click element when ready         ${return_product_list_page.btn_add_more_payment}

Input amount payment
    [Documentation]     Input amount payment
    [Arguments]     ${amount_payment}
    light_portal_common_keywords.Auto keyword clear input text           ${return_product_list_page.btn_txt_input_payment}
    DobbyWebCommon.Input text to element when ready         ${return_product_list_page.btn_txt_input_payment}       ${amount_payment}

Click confirm payment data
    [Documentation]     Click confirm payment data
    DobbyWebCommon.Click element when ready         ${return_product_list_page.btn_confirm_payment_data}

Click delete payment data
    [Documentation]     Click delete payment data
    DobbyWebCommon.Click element when ready         ${return_product_list_page.btn_delete_payment_data}
    light_portal_common_keywords.Wait for jquery loading completed

Get total price
    [Documentation]   Get total price
    ${price}  DobbyWebCommon.Get text from element when ready    ${return_product_list_page.lbl_net_price}
    ${price}         String.Remove string       ${price}    ,
    ${price}            BuiltIn.Evaluate        ("%g"%${price})
    ${price}            BuiltIn.Evaluate        "{:,}".format(${price})
    ${half_price}       BuiltIn.Evaluate        ${price}/2
    ${double_price}     BuiltIn.Evaluate        ${price}*2
    [Return]    ${price}    ${half_price}   ${double_price}

Input product code or product name to search
    [Documentation]  Input product code or product name to search
    [Arguments]      ${product}
    DobbyWebCommon.Input text to element when ready     ${return_product_list_page.txt_search_product}       ${product}
    SeleniumLibrary.Press keys      None        ENTER

Wait until last element of search product is displayed
    [Documentation]     Wait until last element of search product is displayed
    DobbyWebCommon.Wait until element is visible except stale        ${return_product_list_page.lbl_last_elelment_of_page}