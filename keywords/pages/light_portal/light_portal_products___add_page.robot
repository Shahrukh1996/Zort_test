*** Variables ***
&{light_portal_products_add___input}   code=//span[text()='รหัสสินค้า']/ancestor::div[@class='row']//input[@id='code']
...                                    name=//label[text()='ชื่อสินค้า']/ancestor::div[@class='row']//input[@id='addproductname']
...                                    feature=//label[text()='คุณสมบัติ']/ancestor::div[@class='row']//select[@id='varianttype']
...                                    category=//label[text()='หมวดหมู่']/ancestor::div[@class='row']//select[@id='categoryid']
...                                    purchase=//label[text()='ราคาซื้อ']/ancestor::div[@class='row']//input[@id='purchaseprice']
...                                    selling=//label[text()='ราคาขาย']/ancestor::div[@class='row']//input[@id='sellprice']
...                                    amount=//label[text()='ยอดยกมา']/ancestor::div[@class='row']//input[@id='startstock']
...                                    store=//label[text()='สินค้าเข้าที่']/ancestor::div[@class='row']//select[@id='addwarehouseid']
&{light_portal_products_add___button}  confirm_create=//div[@id='tour_add']/button[text()='บันทึก']
...                                    type_product=//span[text()='สินค้า']/ancestor::label[@class='d-flex']//input[@id='producttype0']
...                                    type_service=//span[text()='บริการ']/ancestor::label[@class='d-flex']//input[@id='producttype1']
...                                    serial_true=//label[text()='Serial Number']/ancestor::div[@class='d-flex']//input[@id='haveserialno']
...                                    expiration_true=//label[text()='ล็อต/วันหมดอายุ']/ancestor::div[@class='d-flex']//input[@id='isexpirylot']


*** Keywords ***
Click confirm create product
    [Documentation]  กดปุ่ม 'บันทึกสร้างสินค้า'
        light_portal_common_keywords.Scroll to footer of page
        SeleniumLibrary.Click element  ${light_portal_products_add___button.confirm_create}
        light_portal_common_keywords.Wait for jquery loading completed

Input code product
    [Arguments]      ${code}  ${str_random}
    [Documentation]  กรอกข้อมูล 'รหัสสินค้า'
        ${code_product}=  BuiltIn.Set Variable  ${code}${str_random}
        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_products_add___input.code}
        SeleniumLibrary.Input text  ${light_portal_products_add___input.code}  ${code_product}
    [Return]  ${code_product}

Input name product
    [Arguments]      ${name}  ${str_random}
    [Documentation]  กรอกข้อมูล 'ชื่อสินค้า'
        ${name_product}=  BuiltIn.Set Variable  ${name}${str_random}
        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_products_add___input.name}
        SeleniumLibrary.Input text  ${light_portal_products_add___input.name}  ${name_product}
    [Return]  ${name_product}

Input type product
    [Arguments]      ${type}
    [Documentation]  กรอกข้อมูล 'ประเภท'
        IF       '${type}' == 'สินค้า'
                    SeleniumLibrary.Click element  ${light_portal_products_add___button.type_product}
        ELSE IF  '${type}' == 'บริการ'
                    SeleniumLibrary.Click element  ${light_portal_products_add___button.type_service}
        END

Input feature product
    [Arguments]      ${feature}
    [Documentation]  กรอกข้อมูล 'คุณสมบัติ'
        SeleniumLibrary.Select from list by label  ${light_portal_products_add___input.feature}  ${feature}

Input category product
    [Arguments]      ${category}
    [Documentation]  กรอกข้อมูล 'หมวดหมู่'
        SeleniumLibrary.Select from list by label  ${light_portal_products_add___input.category}  ${category}

Input purchase product
    [Arguments]      ${purchase}
    [Documentation]  กรอกข้อมูล 'ราคาซื้อ'
        SeleniumLibrary.Input text  ${light_portal_products_add___input.purchase}  ${purchase}

Input selling product
    [Arguments]      ${selling}
    [Documentation]  กรอกข้อมูล 'ราคาขาย'
        SeleniumLibrary.Input text  ${light_portal_products_add___input.selling}  ${selling}

Input serial product
    [Arguments]      ${serial}
    [Documentation]  กรอกข้อมูล 'serial'
        IF  ${serial} == True
                SeleniumLibrary.Click element  ${light_portal_products_add___button.serial_true}
        END

Input expiration product
    [Arguments]      ${expiration}
    [Documentation]  กรอกข้อมูล 'วันหมดอายุ'
        IF  ${expiration} == True
                SeleniumLibrary.Click element  ${light_portal_products_add___button.expiration_true}
        END

Input amount product
    [Arguments]      ${amount}
    [Documentation]  กรอกข้อมูล 'ยอดยกมา'
        SeleniumLibrary.Input text  ${light_portal_products_add___input.amount}  ${amount}

Input store product
    [Arguments]      ${store}
    [Documentation]  กรอกข้อมูล 'สินค้าเข้าที่'
        SeleniumLibrary.Select from list by label  ${light_portal_products_add___input.store}  ${store}