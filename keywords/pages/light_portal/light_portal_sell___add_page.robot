
*** Variables ***
# --- other --------->
&{xpath_sell_product_text}       code_product=//th[@class='id' and text()='รหัส']
...                              name_product=//th[@class='name' and text()='ชื่อสินค้า']
&{xpath_sell_product_input}      search_product=//input[@id='quicksearchproducttext']
...                              code=//td[@class='id']//input[@id='productcode1']
...                              name=//td[@class='name']//input[@id='productname1']
...                              amount=//td[@class='amount']//input[@id='productnumber1']
...                              price=//td[@class='value']//input[@id='productpricepernumber1']
&{xpath_sell_product_button}     add_product=//span[@id='productcount1']/following-sibling::a[text()='เลือก']
...                              confirm_product=//div[contains(text(),'**product**')]/ancestor::tr/td/a[text()='เลือก']

&{xpath_sell_information_text}   dealer_information=//label[@for='agentzone' and text()='ตัวแทนจำหน่าย ']
&{xpath_sell_information_input}  name=//label[text()='รายการ ']/following-sibling::div/input[@id='number']
...                              refer=//label[text()='อ้างอิง']/following-sibling::div//input[@id='refname']
...                              funnel=//label[text()='ช่องทางการขาย']/following-sibling::div//input[@id='saleschannel']

&{xpath_sell_contact_text}       name_contact=//label[text()='ชื่อลูกค้า']
&{xpath_sell_contact_input}      code=//label[text()='รหัสลูกค้า']/following-sibling::div//input[@id='customercode']
...                              name=//label[text()='ชื่อลูกค้า']/following-sibling::div//input[@id='customername']
...                              phone=//label[text()='เบอร์โทรศัพท์ลูกค้า']/following-sibling::div//input[@id='customerphone']
...                              email=//label[text()='อีเมลลูกค้า']/following-sibling::div//input[@id='customeremail']
...                              address=//label[text()='ที่อยู่ลูกค้า']/following-sibling::div//textarea[@id='customeraddress']
...                              tax_number=//label[text()='เลขประจำตัวผู้เสียภาษี']/following-sibling::div//input[@id='customeridnumber']
...                              branch_name=//label[text()='ชื่อสาขา']/following-sibling::div//input[@id='customerbranchname']
...                              branch_bumber=//label[text()='เลขที่สาขา']/following-sibling::div//input[@id='customerbranchno']

&{xpath_sell_shipping_input}     tracking_no=//label[text()='Tracking No.']/following-sibling::div//input[@id='trackingno']

&{xpath_sell_recipient_button}   choice=//label[text()='ชื่อผู้รับ']/following-sibling::div/a/i

&{xpath_sell_transfer_button}    transfer_all=//input[@id='warehousetype1']
...                              add_stock=//button[@data-id='warehouseid']
...                              select_stock=//div[@class='dropdown-menu open']/ul/li/a/span[text()='**stock**']
...                              waiting=//select[@id='warehouseid0']
...                              transfer_waiting=//input[@id='warehousetype0']

&{xpath_sell_payment_button}     add_payment=//div[@class='form-group']//div[@id='paymentzone']/a[text()='เพิ่มการชำระเงิน']
...                              confirm_payment=//h3[text()='ชำระเงิน']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']/button[text()='ตกลง']

&{xpath_sell_button}             confirm_add_sell=//div[@id='tour-save']/button[text()='บันทึก']
...                              confirm_popUp_add_sell=//p[@id='successmsg2']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ตกลง']
...                              confirm_popUp_no_change_contact=//p[@id='confirmupdatecontactmsg']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยกเลิก']


&{light_portal_sell_add___text}                ele_confirm=//div[@id='tour-save']

# --- information --------->
&{light_portal_sell_add___information__text}   ele_field_dealer=//label[text()='ตัวแทนจำหน่าย ']
&{light_portal_sell_add___information__input}  refer=//label[text()='อ้างอิง']/following-sibling::div//input[@id='refname']
...                                            funnel=//label[text()='ช่องทางการขาย']/following-sibling::div//input[@id='saleschannel']
...                                            tax=//label[text()='ประเภทภาษี']/following-sibling::div//select[@id='vattypeid']
...                                            dealer=//label[text()='ตัวแทนจำหน่าย ']/following-sibling::div//span[@id='agentzone']/a[text()='เลือกตัวแทน']


*** Keywords ***

# --- information --------->

Click element dealer
    [Documentation]  คลิก 'ตัวแทนจำหน่าย'
        SeleniumLibrary.Click element  ${light_portal_sell_add___information__text.ele_field_dealer}

Input funnel information
    [Arguments]      ${funnel}
    [Documentation]  กรอก 'ช่องทางการขาย'
        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_sell_add___information__input.funnel}
        SeleniumLibrary.Input text  ${light_portal_sell_add___information__input.funnel}  ${funnel}

# --- other --------->

Click confirm sell
    [Documentation]  คลิกปุ่ม 'บันทึกรายการขาย'
        light_portal_common_keywords.Scroll to footer of page
        SeleniumLibrary.Click element  ${xpath_sell_button.confirm_add_sell}
        Sleep  2s
        light_portal_sell___detail_page.Check toppic page

Click confirm popUp add sell
    [Documentation]  คลิกปุ่ม 'ตกลง'
        DobbyWebCommon.Click element when ready  ${xpath_sell_button.confirm_popUp_add_sell}

Click confirm popUp no change contact
    [Documentation]  คลิกปุ่ม 'ยกเลิก'
        DobbyWebCommon.Click element when ready  ${xpath_sell_button.confirm_popUp_no_change_contact}

Input data information of sell add
    [Arguments]      ${information_data}
    [Documentation]  กรอกข้อมูล 'การขาย' หน้า (สร้างรายการขาย)
        FOR  ${index}  IN  @{information_data.keys()}
            IF  '${index}' == 'name'
                light_portal_common_keywords.Auto keyword clear input text  ${xpath_sell_information_input.${index}}
                ${name_sell}=  light_portal_common_keywords.Auto keyword random string  ${information_data ['${index}']}
                SeleniumLibrary.Input text  ${xpath_sell_information_input.${index}}  ${name_sell}
            ELSE
                SeleniumLibrary.Input text  ${xpath_sell_information_input.${index}}  ${information_data ['${index}']}
                Sleep  2s
                SeleniumLibrary.Click element  ${xpath_sell_information_text.dealer_information}
            END
        END
    [Return]  ${name_sell}

Input data contact of sell add
    [Arguments]      ${contact_data}
    [Documentation]  กรอกข้อมูล 'ลูกค้า' หน้า (สร้างรายการขาย)
        FOR  ${index}  IN  @{contact_data.keys()}
            IF  '${index}' == 'code'
                light_portal_common_keywords.Auto keyword clear input text  ${xpath_sell_contact_input.${index}}
                ${code_contact}=  light_portal_common_keywords.Auto keyword random string  ${contact_data ['${index}']}
                SeleniumLibrary.Input text  ${xpath_sell_contact_input.${index}}  ${code_contact}
            ELSE IF  '${index}' == 'name'
                SeleniumLibrary.Input text  ${xpath_sell_contact_input.${index}}  ${contact_data ['${index}']}
                Sleep  2s
                SeleniumLibrary.Click element  ${xpath_sell_contact_text.name_contact}
            ELSE
                SeleniumLibrary.Input text  ${xpath_sell_contact_input.${index}}  ${contact_data ['${index}']}
            END
        END
    [Return]  ${code_contact}

Input data product of sell add
    [Arguments]      ${product_data}
    [Documentation]  กรอกข้อมูล'สินค้า' หน้า (สร้างรายการขาย)
        FOR  ${index1}  IN  @{product_data.keys()}
            IF  '${index1}' == 'system'
                FOR  ${index2}  IN  @{product_data ['${index1}'].keys()}
                    IF  '${index2}' == 'name'
                        SeleniumLibrary.Click element  ${xpath_sell_product_button.add_product}
                        light_portal_common_keywords.Wait for jquery loading completed
                        Sleep  2s
                        SeleniumLibrary.Input text  ${xpath_sell_product_input.search_product}  ${product_data ['${index1}'] ['${index2}']}
                        SeleniumLibrary.Press keys  None  RETURN
                        light_portal_common_keywords.Wait for jquery loading completed
                        Sleep  2s
                        &{str_replace}=  BuiltIn.Create dictionary  **product**=${product_data ['${index1}'] ['${index2}']}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_sell_product_button.confirm_product}  ${str_replace}
                        SeleniumLibrary.Click element  ${new_xpath}
                    END
                END
            ELSE IF  '${index1}' == 'custom'
                FOR  ${index3}  IN  @{product_data ['${index1}'].keys()}
                    IF  '${index3}' == 'code'
                        light_portal_common_keywords.Auto keyword clear input text  ${xpath_sell_product_input.${index3}}
                        ${code_product}=  light_portal_common_keywords.Auto keyword random string  ${product_data ['${index1}'] ['${index3}']}
                        SeleniumLibrary.Input text  ${xpath_sell_product_input.${index3}}  ${code_product}
                        Sleep  2s
                        SeleniumLibrary.Click element  ${xpath_sell_product_text.code_product}
                    ELSE IF  '${index3}' == 'name'
                        SeleniumLibrary.Input text  ${xpath_sell_product_input.${index3}}  ${product_data ['${index1}'] ['${index3}']}
                        Sleep  2s
                        SeleniumLibrary.Click element  ${xpath_sell_product_text.name_product}
                    ELSE
                        SeleniumLibrary.Input text  ${xpath_sell_product_input.${index3}}  ${product_data ['${index1}'] ['${index3}']}
                    END
                END
            END
        END

Input data recipient of sell add
    [Arguments]      ${recipient_data}
    [Documentation]  กรอกข้อมูล 'ผู้รับ' หน้า (สร้างรายการขาย)
        FOR  ${index}  IN  @{recipient_data.keys()}
            IF  '${index}' == 'system'
                SeleniumLibrary.Click element  ${xpath_sell_recipient_button.choice}
            END
        END

Input data shipping of sell add
    [Arguments]      ${shipping_data}
    [Documentation]  กรอกข้อมูล 'การจัดส่งสินค้า' หน้า (สร้างรายการขาย)
        FOR  ${index}  IN  @{shipping_data.keys()}
            IF  '${index}' == 'date'
                Log to console  TEST
            ELSE
                SeleniumLibrary.Input text  ${xpath_sell_shipping_input.${index}}  ${shipping_data ['${index}']}
            END
        END

Input data transfer of sell add
    [Arguments]      ${transfer_data}
    [Documentation]  กรอกข้อมูล 'โอนสินค้า' หน้า (สร้างรายการขาย)
        FOR  ${index}  IN  @{transfer_data.keys()}
            IF  '${index}' == 'stock'
                DobbyWebCommon.Click element when ready  ${xpath_sell_transfer_button.transfer_all}
                light_portal_common_keywords.Scroll to footer of page
                DobbyWebCommon.Click element when ready  ${xpath_sell_transfer_button.add_stock}
                &{str_replace}=  BuiltIn.Create dictionary  **stock**=${transfer_data ['${index}']}
                ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_sell_transfer_button.select_stock}  ${str_replace}
                DobbyWebCommon.Click element when ready  ${new_xpath}
            ELSE IF  '${index}' == 'waiting'
                light_portal_common_keywords.Scroll to footer of page
                SeleniumLibrary.Click element  ${xpath_sell_transfer_button.transfer_waiting}
                SeleniumLibrary.Select from list by label  ${xpath_sell_transfer_button.${index}}  ${transfer_data ['${index}']}
            END
        END

Input data payment of sell add
    [Documentation]  กรอกข้อมูล 'ชำระเงิน' หน้า (สร้างรายการขาย)
        DobbyWebCommon.Click element when ready  ${xpath_sell_payment_button.add_payment}
        DobbyWebCommon.Click element when ready  ${xpath_sell_payment_button.confirm_payment}