*** Variables ***
${add_sell_list_page.txt_sell_code}          xpath=//fieldset[@id='tour-sale-info']//label[text()='รายการ ']/following-sibling::div/input
${add_sell_list_page.txt_date}               xpath=//fieldset[@id='tour-sale-info']//label[text()='วันที่ ']/following-sibling::div/div/input
${add_sell_list_page.txt_refer}              id=refname
${add_sell_list_page.txt_saleschannel}       id=saleschannel
${add_sell_list_page.txt_customer_name}      id=customername
${add_sell_list_page.txt_customer_code}      id=customercode
${add_sell_list_page.txt_customer_phone}     id=customerphone
${add_sell_list_page.txt_customere_mail}     id=customeremail
${add_sell_list_page.txt_customer_address}   id=customeraddress
${add_sell_list_page.lbl_set_taxpayer}       id=tmpmerchantstatus
${add_sell_list_page.txt_idnumber}           id=customeridnumber
${add_sell_list_page.txt_branch_name}        id=customerbranchname
${add_sell_list_page.txt_branch_no}          id=customerbranchno
${add_sell_list_page.btn_select_prod}              xpath=//a[contains(@class,'button') and text()='เลือกสินค้า']
${add_sell_list_page.txt_suggestion}               xpath=//div[@class='typeahead__result']//a[contains(.,"$suggestion")]
${add_sell_list_page.ckb_product_name}             xpath=//div[@id='multiproductdialog']//tbody//td//div[contains(text(),"$product_name")]//ancestor::tr//span[@id='notext']
${add_sell_list_page.btn_submit_select_prod}       xpath=//div[@id='multiproductdialog']//button[text()='เลือกสินค้า']
${add_sell_list_page.txt_shipping_channel}         id=shippingchannel
${add_sell_list_page.txt_description}              id=description
${add_sell_list_page.lbl_total_price}              id=amounttext
${add_sell_list_page.lbl_coppy_customer_data}      xpath=//fieldset[@id='tour-shipping-address']//a//span[text()='คัดลอกจากข้อมูลลูกค้า']
${add_sell_list_page.txt_tracking_no}              id=trackingno
${add_sell_list_page.btn_add_payment}              xpath=//div[@id='paymentzone']//a[text()='เพิ่มการชำระเงิน']
${add_sell_list_page.btn_submit_payment}           xpath=//div[@class='modal-content']//div[@class='modal-footer ']/button
${add_sell_list_page.lbl_transfer_order}           id=warehouseidarea0
${add_sell_list_page.txt_transfer_type}            xpath=//div[@id='warehouseidarea0']//ul[@class='dropdown-menu inner']//a/span[text()='$transfer_type']
${add_sell_list_page.btn_save}                     xpath=//div[@id='tour-save']/button[text()='บันทึก']
${add_sell_list_page.txt_product_amount_1}         id=productnumber1
${add_sell_list_page.lbl_product_price}            xpath=//span[@id='amounttext'][contains(text(), '10.01')]
${add_sell_list_page.txt_search_product}           id=quicksearchMultiproducttext
${add_sell_list_page.lbl_last_elelment_of_page}    xpath=//div[@id='multiproductdialog']//div[contains(text(), 'สินค้า-ทดสอบ')]
${add_sell_list_page.lbl_title_page}               xpath=//h1[contains(text(),'สร้างรายการขาย')]
${add_sell_list_page.xpt_focus}                    xpath=//table[@id='productrow']/ancestor::div[@class='t-responsive']/following-sibling::div[@class='row mt-2']

&{xpt_basic_input}                                 name=//fieldset[@id='tour-sale-info']//input[@id='number']
...                                                refer=//fieldset[@id='tour-sale-info']//input[@id='refname']
...                                                funnel=//fieldset[@id='tour-sale-info']//input[@id='saleschannel']
...                                                dealer=//fieldset[@id='tour-sale-info']//a[text()='เลือกตัวแทน']
...                                                tax_type=//fieldset[@id='tour-sale-info']//select[@id='vattypeid']
...                                                create_date=//fieldset[@id='tour-sale-info']//input[@id='transactiondate']/..//span[@class='glyphicon glyphicon-calendar']
...                                                expired_date=//fieldset[@id='tour-sale-info']//input[@id='expiredate']/following-sibling::span/span[@class='glyphicon glyphicon-calendar']

*** Keywords ***

Get sell list code
    [Documentation]  Get sell list code
    ${code}   SeleniumLibrary.Get Value   ${add_sell_list_page.txt_sell_code}
    [Return]   ${code}

Get date of info
    [Documentation]  Get date of info
    ${date}   SeleniumLibrary.Get Value   ${add_sell_list_page.txt_date}
    [Return]   ${date}

Input refer
    [Documentation]  Input refer
    [Arguments]   ${refer}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_refer}   ${refer}

Input saleschannel
    [Documentation]  Input refsaleschanneler
    [Arguments]   ${saleschannel}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_saleschannel}   ${saleschannel}

Input customer name
    [Documentation]  Input customer name
    [Arguments]      ${customer_name}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_customer_name}   ${customer_name}

Input customer code
    [Documentation]  Input customer code
    [Arguments]      ${customer_code}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_customer_code}   ${customer_code}

Input customer phone number
    [Documentation]  Input customer phone number
    [Arguments]      ${txt_customer_phone}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_customer_phone}   ${txt_customer_phone}

Input customer email
    [Documentation]  Input customer email
    [Arguments]      ${customere_mail}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_customere_mail}    ${customere_mail}

Input customer address
    [Documentation]  Input customer email
    [Arguments]      ${customer_address}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_customer_address}   ${customer_address}

Click set taxpayer
    [Documentation]  Click set taxpayer
    DobbyWebCommon.Click element when ready            ${add_sell_list_page.lbl_set_taxpayer}

Input taxpayer identification number
    [Documentation]  Input taxpayer identification number
    [Arguments]      ${number}
    DobbyWebCommon.Input text to element when ready     ${add_sell_list_page.txt_idnumber}     ${number}

Input taxpayer branch name
    [Documentation]  Input taxpayer branch name
    [Arguments]      ${branch_name}
    DobbyWebCommon.Input text to element when ready     ${add_sell_list_page.txt_branch_name}   ${branch_name}

Input taxpayer branch number
    [Documentation]  Input taxpayer branch number
    [Arguments]      ${branch_no}
    DobbyWebCommon.Input text to element when ready     ${add_sell_list_page.txt_branch_no}       ${branch_no}

Click use suggestion data
    [Documentation]  Click use suggestion data
    [Arguments]    ${suggestion}
    ${txt_suggestion}         String.Replace string   ${add_sell_list_page.txt_suggestion}   $suggestion   ${suggestion}
    DobbyWebCommon.Click element when ready    ${txt_suggestion}

Click select products top button
    [Documentation]   Click select products top
    SeleniumLibrary.Scroll element into view   ${add_sell_list_page.xpt_focus}
    DobbyWebCommon.Click element when ready    ${add_sell_list_page.btn_select_prod}
    light_portal_common_keywords.Wait for jquery loading completed

Click select product by name
    [Documentation]   Click select product by name
    [Arguments]  ${product_name}
    ${ckb_product_name}         String.Replace string   ${add_sell_list_page.ckb_product_name}   $product_name   ${product_name}
    DobbyWebCommon.Click element when ready    ${ckb_product_name}

Click submit select products
    [Documentation]  Click submit select products
    DobbyWebCommon.Click element when ready    ${add_sell_list_page.btn_submit_select_prod}

Input shipping channel
    [Documentation]  Input shipping channel
    [Arguments]  ${shipping_channel}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_shipping_channel}      ${shipping_channel}

Input description
    [Documentation]   Input description
    [Arguments]  ${description}
    DobbyWebCommon.Input text to element when ready    ${add_sell_list_page.txt_description}    ${description}

Get total price
    [Documentation]   Get total price
    ${price}  DobbyWebCommon.Get text from element when ready    ${add_sell_list_page.lbl_total_price}
    ${price}         String.Remove string    ${price}    ,
    ${price}             BuiltIn.Evaluate              ("%g"%${price})
    ${price}             BuiltIn.Evaluate              "{:,}".format(${price})
    [Return]  ${price}

Click copy from customer data for recipient
    [Documentation]  Click copy from customer data for recipient
    DobbyWebCommon.Click element when ready    ${add_sell_list_page.lbl_coppy_customer_data}

Input tracking number
    [Documentation]  Input tracking number
    [Arguments]  ${tracking_no}
    DobbyWebCommon.Input text to element when ready   ${add_sell_list_page.txt_tracking_no}     ${tracking_no}

Click add payment
    [Documentation]  Click add payment
    DobbyWebCommon.Click element when ready      ${add_sell_list_page.btn_add_payment}

Input payment price
    [Documentation]  Input payment price
    [Arguments]  ${price}
    light_portal_common_keywords.Auto keyword clear input text       id=tmppaymentamount
    DobbyWebCommon.Input text to element when ready     id=tmppaymentamount     ${price}

Click payment submit
    [Documentation]   Click payment submit
    DobbyWebCommon.Click element when ready    ${add_sell_list_page.btn_submit_payment}

Click select transfer goods
    [Documentation]   Click select transfer goods
    [Arguments]   ${transfer_type}
    DobbyWebCommon.Click element when ready        ${add_sell_list_page.lbl_transfer_order}
    ${txt_transfer_type}   String.Replace string   ${add_sell_list_page.txt_transfer_type}   $transfer_type   ${transfer_type}
    DobbyWebCommon.Click element when ready    ${txt_transfer_type}

Click save button
    [Documentation]  Click save button
    DobbyWebCommon.Click element when ready    ${add_sell_list_page.btn_save}

Input amount product
    [Documentation]   Input amount product
    [Arguments]  ${amount}
    DobbyWebCommon.Input text to element when ready     id=productnumber2     ${amount}
    SeleniumLibrary.Press keys      None        TAB

Click save button and confirm to go to next page
    [Documentation]     Click save button and confirm to go to next page
    light_portal_add_sell_list_page.Click save button
    light_portal_common_keywords.Auto keyword wait element  //div[@class='content']//h1[contains(normalize-space(.),'รายละเอียดรายการขาย')]
    # light_portal_common_keywords.Wait for last element of any page is displayed

Change amount product
    [Documentation]   Change amount product after save
    [Arguments]  ${amount}
    DobbyWebCommon.Input text to element when ready     ${add_sell_list_page.txt_product_amount_1}     ${amount}
    SeleniumLibrary.Press keys      None        TAB

Input product code or product name to search
    [Documentation]  Input product code or product name to search
    [Arguments]      ${product}
    DobbyWebCommon.Input text to element when ready     ${add_sell_list_page.txt_search_product}       ${product}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_common_keywords.Wait for jquery loading completed

Wait until last element of search product is displayed
    [Documentation]     Wait until last element of search product is displayed
    DobbyWebCommon.Wait until element is visible except stale        ${add_sell_list_page.lbl_last_elelment_of_page}

Verify title add sell list page
    [Documentation]     Verify title add sell list page
    DobbyWebCommon.Wait until element is visible except stale       ${add_sell_list_page.lbl_title_page}

Input data basic of sell list
    [Documentation]    กรอกข้อมูลพื้นฐานของรายการขาย
    [Arguments]        ${basic_data}
    FOR  ${index}  IN  @{basic_data.keys()}
        IF  '${index}' == 'create_date' or '${index}' == 'expired_date'
            DobbyWebCommon.Click element when ready             ${xpt_basic_input.${index}}
            light_portal_common_keywords.Auto keyword datepicker             ${basic_data ['${index}']}
        ELSE IF  '${index}' == 'dealer'
            DobbyWebCommon.Click element when ready            ${xpt_basic_input.${index}}
        ELSE IF  '${index}' == 'name'
            ${basic_data_name}=    light_portal_common_keywords.Auto keyword random string    ${basic_data ['${index}']}
            DobbyWebCommon.Input text to element when ready     ${xpt_basic_input.${index}}    ${basic_data_name}
        ELSE IF  '${index}' == 'tax_type'
            SeleniumLibrary.Select from list by label           ${xpt_basic_input.${index}}    ${basic_data ['${index}']}
        ELSE
            DobbyWebCommon.Input text to element when ready     ${xpt_basic_input.${index}}    ${basic_data ['${index}']}
        END
    END