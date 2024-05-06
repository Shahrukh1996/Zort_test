*** Variables ***
&{xpt_returnsell_all_button}        confirm_add_returnsell=//div[@id='tour-save']/button[text()='บันทึก']

&{xpt_returnsell_basic_input}       name=//input[@id='number']
...                                 refer=//input[@id='refname']
...                                 dealer=//input[@id='quicksearchagenttext']
...                                 tax_type=//select[@id='vattypeid']
...                                 create_date=//input[@id='transactiondate']/..//span[@class='glyphicon glyphicon-calendar']
&{xpt_returnsell_basic_button}      add_dealer=//span[@id='agentzone']/a
...                                 select_dealer=//tbody//td[normalize-space(text())='///DEALER_NAME///']/following-sibling::td[@class='action']/a

&{xpt_returnsell_contact_text}      focus_titel_product=//div[@class='box-white']//span[text()='สินค้า']
&{xpt_returnsell_contact_input}     code=//fieldset[@id='tour-purchase-customer']//input[@id='customercode']
...                                 name=//fieldset[@id='tour-purchase-customer']//input[@id='customername']
...                                 phone=//fieldset[@id='tour-purchase-customer']//input[@id='customerphone']
...                                 email=//fieldset[@id='tour-purchase-customer']//input[@id='customeremail']
...                                 address=//fieldset[@id='tour-purchase-customer']//textarea[@id='customeraddress']
...                                 taxpayer=//fieldset[@id='tour-purchase-customer']//input[@id='customeridnumber']
...                                 branch_name=//fieldset[@id='tour-purchase-customer']//input[@id='customerbranchname']
...                                 branch_number=//fieldset[@id='tour-purchase-customer']//input[@id='customerbranchno']
&{xpt_returnsell_contact_button}    add_contact=//fieldset[@id='tour-purchase-customer']//span[@class='typeahead__button']
...                                 search_contact=//div[@class='modal-body']//input[@id='quicksearchcontacttext']
...                                 select_contact=//tbody//span[contains(text(), '///str///')]/ancestor::tr//a
...                                 checkbox_tax=//fieldset[@id='tour-purchase-customer']//input[@id='tmpmerchantstatus']

&{xpt_returnsell_product_text}      focus_header_product=//div[@id='tour-productlist']//thead
&{xpt_returnsell_product_input}     code=(//tbody/tr[contains(@id,'prow')]//input[contains(@id,'productcode')])[///str///]
...                                 name=(//tbody/tr[contains(@id,'prow')]//input[contains(@id,'productname')])[///str///]
...                                 price=(//tbody/tr[contains(@id,'prow')]//input[contains(@id,'productpricepernumber')])[///str///]
...                                 amount=(//tbody/tr[contains(@id,'prow')]//input[contains(@id,'productnumber')])[///str///]
...                                 rebate=(//tbody/tr[contains(@id,'prow')]//input[contains(@id,'discountpernumber')])[///str///]
&{xpt_returnsell_product_button}    add_product_single=//div[@id='tour-productlist']//span[text()='เพิ่มสินค้า']
...                                 add_product_multiple=//div[@class='box-white']//a[text()='เลือกสินค้า']
...                                 search_product=//input[@id='quicksearchMultiproducttext']
...                                 select_product_list=//div[contains(text(), '///str1///')]/div[contains(text(), '///str2///')]/ancestor::tr//span[@id='notext']
...                                 confirm_select_product=//div[@id='multiproductdialog']//button[text()='เลือกสินค้า']


*** Keywords ***
Click confirm create list
    [Documentation]    ยืนยันสร้างรายการ 'รับคืนสินค้า'
    DobbyWebCommon.Click element when ready     ${xpt_returnsell_all_button.confirm_add_returnsell}

Input data basic
    [Arguments]        ${basic}
    [Documentation]    กรอกข้อมูลพื้นฐาน
    FOR  ${index}  IN  @{basic.keys()}
        IF  '${index}' == 'name'
            ${name_data}=    light_portal_common_keywords.Auto keyword random string    ${basic ['${index}']}
            DobbyWebCommon.Input text to element when ready     ${xpt_returnsell_basic_input.${index}}    ${name_data}
        ELSE IF  '${index}' == 'dealer'
            DobbyWebCommon.Click element when ready             ${xpt_returnsell_basic_button.add_dealer}
            light_portal_common_keywords.Auto keyword clear input text       ${xpt_returnsell_basic_input.${index}}
            DobbyWebCommon.Input text to element when ready     ${xpt_returnsell_basic_input.${index}}    ${basic ['${index}']}
            SeleniumLibrary.Press keys    None    ENTER
            light_portal_common_keywords.Wait for jquery loading completed
            &{str_replace}=     BuiltIn.Create dictionary    ///DEALER_NAME///=${basic ['${index}']}
            ${new_xpath}=       light_portal_common_keywords.Auto keyword replace string    ${xpt_returnsell_basic_button.select_dealer}    ${str_replace}
            DobbyWebCommon.Click element when ready    ${new_xpath}
        ELSE IF  '${index}' == 'create_date'
            DobbyWebCommon.Click element when ready    ${xpt_returnsell_basic_input.${index}}
            light_portal_common_keywords.Auto keyword datepicker    ${basic ['${index}']}
        ELSE IF  '${index}' == 'tax_type'
            SeleniumLibrary.Select from list by label           ${xpt_returnsell_basic_input.${index}}    ${basic ['${index}']}
        ELSE
            DobbyWebCommon.Input text to element when ready     ${xpt_returnsell_basic_input.${index}}    ${basic ['${index}']}
        END
    END

Input data contact
    [Arguments]        ${contact}
    [Documentation]    กรอกข้อมูลของลูกค้า
    IF  ${contact ['choice_add_customer']}
        DobbyWebCommon.Click element when ready             ${xpt_returnsell_contact_button.add_contact}
        light_portal_common_keywords.Auto keyword clear input text       ${xpt_returnsell_contact_button.search_contact}
        DobbyWebCommon.Input text to element when ready     ${xpt_returnsell_contact_button.search_contact}    ${contact ['customer_detail'] ['name']}
        SeleniumLibrary.Press keys    None    ENTER
        &{str_replace}=     BuiltIn.Create dictionary    ///str///=${contact ['customer_detail'] ['code']}
        ${new_xpath}=       light_portal_common_keywords.Auto keyword replace string    ${xpt_returnsell_contact_button.select_contact}     ${str_replace}
        DobbyWebCommon.Click element when ready    ${new_xpath}
    ELSE
        FOR  ${index}  IN  @{contact ['customer_detail'].keys()}
            DobbyWebCommon.Input text to element when ready    ${xpt_returnsell_contact_input.${index}}    ${contact ['customer_detail'] ['${index}']}
        END
        IF  ${contact ['choice_add_tax']}
            SeleniumLibrary.Scroll element into view        ${xpt_returnsell_contact_text.focus_titel_product}
            DobbyWebCommon.Click element when ready         ${xpt_returnsell_contact_button.checkbox_tax}
            FOR  ${index}  IN  @{contact ['tax_detail'].keys()}
                DobbyWebCommon.Input text to element when ready    ${xpt_returnsell_contact_input.${index}}    ${contact ['tax_detail'] ['${index}']}
            END
        END
    END

Input data product
    [Arguments]        ${product}
    [Documentation]    กรอกข้อมูลของสินค้า
    IF  ${product ['choice_add_product']}
        SeleniumLibrary.Scroll element into view    ${xpt_returnsell_product_text.focus_header_product}
        DobbyWebCommon.Click element when ready     ${xpt_returnsell_product_button.add_product_multiple}
        FOR  ${index}  IN  @{product ['list'].keys()}
            light_portal_common_keywords.Wait for jquery loading completed
            light_portal_common_keywords.Auto keyword clear input text       ${xpt_returnsell_product_button.search_product}
            DobbyWebCommon.Input text to element when ready     ${xpt_returnsell_product_button.search_product}    ${product ['list'] ['${index}'] ['name']}
            SeleniumLibrary.Press keys    None    ENTER
            &{str_replace}=     BuiltIn.Create dictionary    ///str1///=${product ['list'] ['${index}'] ['name']}    ///str2///=${product ['list'] ['${index}'] ['code']}
            ${new_xpath}=       light_portal_common_keywords.Auto keyword replace string    ${xpt_returnsell_product_button.select_product_list}    ${str_replace}
            DobbyWebCommon.Click element when ready    ${new_xpath}
        END
        BuiltIn.Sleep    1s
        DobbyWebCommon.Click element when ready    ${xpt_returnsell_product_button.confirm_select_product}
        ${count_product}=    BuiltIn.Get length    ${product ['list']}
        @{keys_product}=     Collections.Get dictionary keys    ${product ['list']}    sort_keys=${False}
        FOR  ${index}  IN RANGE  ${count_product}
            ${product_no}=      BuiltIn.Set variable    ${keys_product}[${index}]
            ${str_index}=       BuiltIn.Convert to string    ${index +2}

            &{str_replace_rebate}=     BuiltIn.Create dictionary    ///str///=${str_index}
            ${new_xpath_rebate}=       light_portal_common_keywords.Auto keyword replace string     ${xpt_returnsell_product_input.rebate}     ${str_replace_rebate}
            DobbyWebCommon.Input text to element when ready    ${new_xpath_rebate}     ${product ['list'] ['${product_no}'] ['rebate']}

            &{str_replace_amount}=     BuiltIn.Create dictionary    ///str///=${str_index}
            ${new_xpath_amount}=       light_portal_common_keywords.Auto keyword replace string     ${xpt_returnsell_product_input.amount}     ${str_replace_amount}
            DobbyWebCommon.Input text to element when ready    ${new_xpath_amount}     ${product ['list'] ['${product_no}'] ['amount']}
        END
    ELSE
        ${count_product}=    BuiltIn.Get length    ${product ['list']}
        @{keys_product}=     Collections.Get dictionary keys    ${product ['list']}    sort_keys=${False}
        FOR  ${index}  IN RANGE  ${count_product}
            ${product_no}=    BuiltIn.Set variable    ${keys_product}[${index}]
            FOR  ${keys_product_detalt}  IN  @{product ['list'] ['${product_no}'].keys()}
                ${str_index}=       BuiltIn.Convert to string    ${index +1}
                &{str_replace}=     BuiltIn.Create dictionary    ///str///=${str_index}
                ${new_xpath}=       light_portal_common_keywords.Auto keyword replace string    ${xpt_returnsell_product_input.${keys_product_detalt}}    ${str_replace}
                light_portal_common_keywords.Wait for jquery loading completed
                DobbyWebCommon.Input text to element when ready    ${new_xpath}     ${product ['list'] ['${product_no}'] ['${keys_product_detalt}']}
            END
            DobbyWebCommon.Click element when ready    ${xpt_returnsell_product_button.add_product_single}
        END
    END
