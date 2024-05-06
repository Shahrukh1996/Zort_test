
*** Variables ***
&{xpath_buy_information_input}  name=//div[@class='form-group']//label[text()='รายการ ']/ancestor::div[@class='form-group']//input[@id='number']

&{xpath_buy_product_input}      search=//input[@id='quicksearchproducttext']
&{xpath_buy_product_button}     select=//tbody/tr[@id='prow1']/td/span[@id='productcount1']/following-sibling::a[text()='เลือก']
...                             confirm_select=//div[@class='modal-content']/div[@class='modal-header']/h3[text()='เลือกสินค้า']/ancestor::div[@class='modal-content']/div[@class='modal-body']//div[@class='table-view']//tbody/tr/td/a[text()='เลือก']

&{xpath_buy_payment_button}     add_payment=//div[@class='form-group']//div[@id='paymentzone']/a[text()='เพิ่มการชำระเงิน']
...                             confirm_payment=//h3[text()='ชำระเงิน']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']/button[text()='ตกลง']

&{xpath_buy_transfer_button}    transfer_all=//input[@id='warehousetype1']
...                             add_stock=//button[@data-id='warehouseid']
...                             select_stock=//div[@class='dropdown-menu open']/ul/li/a/span[text()='**stock**']

&{light_portal_buy_add___information__text}     focus_tax=//label[text()='ประเภทภาษี']
&{light_portal_buy_add___information__input}    name=//label[text()='รายการ ']/ancestor::div[@class='row']//input[@id='number']
...                                             refer=//label[text()='อ้างอิง']/ancestor::div[@class='row']//input[@id='refname']
&{light_portal_buy_add___information__button}   date=//label[text()='วันที่ ']/ancestor::div[@class='row']//span[@class='glyphicon glyphicon-calendar']
...                                             tax=//label[text()='ประเภทภาษี']/ancestor::div[@class='row']//select[@id='vattypeid']

&{light_portal_buy_add___product__text}         focus_new_product=//span[text()='เพิ่มสินค้า']
...                                             focus_topic_product=//div[@class='box-white']//span[text()='สินค้า']
&{light_portal_buy_add___product__input}        search=//input[@id='quicksearchMultiproducttext']
...                                             code=//tr[@id='prow**index**']/td[@class='id']//span/input
...                                             name=//tr[@id='prow**index**']/td[@class='name']//span/input
...                                             amount=//tr[@id='prow**index**']/td[@class='amount']//input
...                                             price=//tr[@id='prow**index**']/td[@class='value']//input
...                                             discount=//tr[@id='prow**index**']/td[@class='discount']//input
&{light_portal_buy_add___product__button}       add=//div[@class='box-white']//a[text()='เลือกสินค้า']
...                                             select=//span[@id='notext']
...                                             confirm=//div[@id='multiproductdialog']//button[text()='เลือกสินค้า']

&{light_portal_buy_add___button}                confirm_buy=//div[@id='tour-save']/button[text()='บันทึก']
...                                             confirm_popUp_add_buy=//p[@id='successmsg2']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ตกลง']
...                                             confirm_popUp_no_change_contact=//p[@id='confirmupdatecontactmsg']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยกเลิก']


*** Keywords ***
Click confirm buy
    [Documentation]  กดปุ่ม 'บันทึกรายการซื้อ'
        light_portal_common_keywords.Scroll to footer of page
        SeleniumLibrary.Click element  ${light_portal_buy_add___button.confirm_buy}
        light_portal_buy___detail_page.Check toppic detail buy page

Click confirm popUp add buy
    [Documentation]  คลิกปุ่ม 'ตกลง'
    DobbyWebCommon.Click element when ready  ${light_portal_buy_add___button.confirm_popUp_add_buy}

Click confirm popUp no change contact
    [Documentation]  คลิกปุ่ม 'ยกเลิก'
    DobbyWebCommon.Click element when ready  ${light_portal_buy_add___button.confirm_popUp_no_change_contact}

Input data section information
    [Arguments]      ${information_data}
    [Documentation]  กรอกส่วน 'ข้อมูลการซื้อ'
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_common_keywords.Scroll to header of page
    FOR  ${index}  IN  @{information_data.keys()}
        IF  '${index}' == 'name'
            light_portal_common_keywords.Scroll to header of page
            light_portal_common_keywords.Wait for jquery loading completed
            light_portal_common_keywords.Auto keyword clear input text  ${xpath_buy_information_input.${index}}
            ${name_buy}=  light_portal_common_keywords.Auto keyword random string  ${information_data ['${index}']}
            DobbyWebCommon.Input text to element when ready  ${xpath_buy_information_input.${index}}  ${name_buy}
        END
    END
    [Return]  ${name_buy}

Input data section product
    [Arguments]      ${product_data}
    [Documentation]  กรอกส่วน 'ข้อมูลสินค้า'
    FOR  ${index}  IN  @{product_data.keys()}
        IF  '${index}' == 'name'
            DobbyWebCommon.Click element when ready  ${xpath_buy_product_button.select}
            Sleep  2s
            DobbyWebCommon.Input text to element when ready  ${xpath_buy_product_input.search}  ${product_data ['${index}']}
            SeleniumLibrary.Press keys  None  RETURN
            light_portal_common_keywords.Wait for jquery loading completed
            DobbyWebCommon.Click element when ready  ${xpath_buy_product_button.confirm_select}
        END
    END

Input data section transfer
    [Arguments]      ${transfer_data}
    [Documentation]  กรอกส่วน 'ข้อมูลโอน'
    FOR  ${index}  IN  @{transfer_data.keys()}
        IF  '${index}' == 'stock'
            DobbyWebCommon.Click element when ready  ${xpath_buy_transfer_button.transfer_all}
            light_portal_common_keywords.Scroll to footer of page
            DobbyWebCommon.Click element when ready  ${xpath_buy_transfer_button.add_stock}
            &{str_replace}=  BuiltIn.Create dictionary  **stock**=${transfer_data ['${index}']}
            ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_buy_transfer_button.select_stock}  ${str_replace}
            DobbyWebCommon.Click element when ready  ${new_xpath}
        END
    END

Input data section payment
    [Documentation]  กรอกส่วน 'ข้อมูลชำระ'
    DobbyWebCommon.Click element when ready  ${xpath_buy_payment_button.add_payment}
    DobbyWebCommon.Click element when ready  ${xpath_buy_payment_button.confirm_payment}

Input name buy
    [Arguments]      ${name}
    [Documentation]  กรอกข้อมูล 'รายการ'
        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_buy_add___information__input.name}
        ${name_buy}=  light_portal_common_keywords.Auto keyword random string  ${name}
        SeleniumLibrary.Input text  ${light_portal_buy_add___information__input.name}  ${name_buy}
    [Return]  ${name_buy}

Input date buy
    [Arguments]      ${date}
    [Documentation]  กรอกข้อมูล 'วันที่'
    SeleniumLibrary.Click element  ${light_portal_buy_add___information__button.date}
    light_portal_common_keywords.Auto keyword datepicker  ${date}

Input refer buy
    [Arguments]      ${refer}
    [Documentation]  กรอกข้อมูล 'อ้างอิง'
        SeleniumLibrary.Input text  ${light_portal_buy_add___information__input.refer}  ${refer}
        Sleep  1s
        SeleniumLibrary.Click element  ${light_portal_buy_add___information__text.focus_tax}

Input tax buy
    [Arguments]      ${tax}
    [Documentation]  กรอกข้อมูล 'ประเภทภาษี'
        SeleniumLibrary.Select from list by label  ${light_portal_buy_add___information__button.tax}  ${tax}

Input product buy
    [Arguments]      ${index_int}  ${keys}  ${values}
    [Documentation]  กรอกข้อมูล 'รหัสสินค้า'
        SeleniumLibrary.Scroll Element Into View   ${light_portal_buy_add___product__text.focus_new_product}
        IF  ${index_int} > 1
                SeleniumLibrary.Click element  ${light_portal_buy_add___product__button.add}
        END
        ${index_str}=  BuiltIn.Convert to string  ${index_int}
        &{str_replace}=  BuiltIn.Create dictionary  **index**=${index_str}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_buy_add___product__input.${keys}}  ${str_replace}
        SeleniumLibrary.Input text  ${new_xpath}  ${values}
        SeleniumLibrary.Click element  ${light_portal_buy_add___product__text.focus_topic_product}
        Sleep  1s