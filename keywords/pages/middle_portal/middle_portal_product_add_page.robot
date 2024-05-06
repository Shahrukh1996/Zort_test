*** Variables ***
&{xpt_add_button}           confirm_add_product=//div[@id='tour_add']//button[text()='บันทึก']
...                         coppy_code=//label[text()='รหัสคิวอาร์โค้ดและบาร์โค้ด']/following-sibling::div/a[text()='คัดลอกจากรหัสสินค้า']
...                         choose_file=//label[@class='file-input']/input[@id='fInsertFile']

&{xpt_add_details_input}    code=//span[text()='รหัสสินค้า']/ancestor::div[@class='form-group']//input[@id='code']
...                         name=//label[text()='ชื่อสินค้า']/ancestor::div[@class='form-group']//input[@id='addproductname']
...                         barcode=//label[text()='รหัสคิวอาร์โค้ดและบาร์โค้ด']/following-sibling::div/input[@id='addbarcode']

&{xpt_add_price_input}      purchase=//label[text()='ราคาซื้อ']/ancestor::div[@class='form-group']//input[@id='purchaseprice']
...                         selling=//label[text()='ราคาขาย']/ancestor::div[@class='form-group']//input[@id='sellprice']

&{xpt_add_warehouse_input}  stock=//label[text()='สินค้าเข้าที่']/ancestor::div[@class='form-group']//select[@id='addwarehouseid']
...                         quantity=//label[text()='ยอดยกมา']/ancestor::div[@class='form-group']//input[@id='startstock']



*** Keywords ***
Click confirm add product list
    [Documentation]  คลิกปุ่ม 'บันทึก'
    common_keywords_middle_portal.Scroll to footer of page
    common_keywords_middle_portal.Wait for jquery loading completed
    SeleniumLibrary.Click element  ${xpt_add_button.confirm_add_product}
    common_keywords_middle_portal.Wait for jquery loading completed

Input data of section detalis
    [Arguments]      ${details_data}
    [Documentation]  กรอกข้อมูลส่วน 'รายละเอียดสินค้า'
    FOR  ${index}  IN  @{details_data.keys()}
        common_keywords_middle_portal.Scroll to header of page
        common_keywords_middle_portal.Wait for jquery loading completed
        IF  '${index}' == 'code'
            common_keywords_middle_portal.Auto keyword clear text  ${xpt_add_details_input.${index}}
            ${code}=  common_keywords_middle_portal.Auto keyword random string  ${details_data ['${index}']}
            SeleniumLibrary.Input text  ${xpt_add_details_input.${index}}  ${code}
        ELSE IF  '${index}' == 'barcode'
            IF  '${details_data ['barcode']}' == 'non'
                SeleniumLibrary.Click element  ${xpt_add_button.coppy_code}
            ELSE
                SeleniumLibrary.Input text  ${xpt_add_details_input.barcode}  ${details_data ['${index}']}
            END
        ELSE IF  '${index}' == 'image'
                ${path}=  OperatingSystem.Join path  ${CURDIR}/../../../resources/testdata/middle_portal/${details_data ['${index}']}
                DobbyWebCommon.Browse file when ready  ${xpt_add_button.choose_file}  ${path}
        ELSE
            SeleniumLibrary.Input text  ${xpt_add_details_input.${index}}  ${details_data ['${index}']}
        END
    END
    [Return]  ${code}

Input data of section price
    [Arguments]      ${price_data}
    [Documentation]  กรอกข้อมูลส่วน 'ราคาสินค้า'
    FOR  ${index}  IN  @{price_data.keys()}
        SeleniumLibrary.Input text  ${xpt_add_price_input.${index}}  ${price_data ['${index}']}
    END

Input data of section warehouse
    [Arguments]      ${warehouse_data}
    [Documentation]  กรอกข้อมูลส่วน 'คลังสินค้า'
    FOR  ${index}  IN  @{warehouse_data.keys()}
        common_keywords_middle_portal.Scroll to footer of page
        common_keywords_middle_portal.Wait for jquery loading completed
        IF  '${index}' == 'stock'
            SeleniumLibrary.Select from list by label  ${xpt_add_warehouse_input.${index}}  ${warehouse_data ['${index}']}
        ELSE
            SeleniumLibrary.Input text  ${xpt_add_warehouse_input.${index}}  ${warehouse_data ['${index}']}
        END
    END