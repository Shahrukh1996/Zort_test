*** Variables ***
&{xpt_edit_input}   barcode=//div[@class='modal-content']//label[text()='บาร์โค้ด']/following-sibling::div/input[@id='product-barcode']
...                 description=//label[text()='คำอธิบาย']/following-sibling::div/textarea[@id='description']
&{xpt_edit_button}  sec_barcode=//div[@class='tabsbar-vertical']/ul/li/a[text()='บาร์โค้ด/คิวอาร์โค้ด']
...                 sec_general=//div[@class='tabsbar-vertical']/ul/li/a[text()='ข้อมูลทั่วไป']
...                 add_barcode=//button[text()='เพิ่ม']
...                 coppy_code=//div[@class='modal-content']//label[text()='บาร์โค้ด']/following-sibling::div/a[text()='คัดลอกจากรหัสสินค้า']
...                 confirm_edit_barcode=//h4[text()='บาร์โค้ด']/ancestor::div[@class='modal-content']/div[@class='modal-footer']/button[text()='บันทึก']
...                 confirm_edit_general=//div[@id='menuProductProfile']//button[text()='บันทึก']
...                 back_to_page=//a[text()=' กลับไปยังหน้ารายละเอียดสินค้า']



*** Keywords ***
Click section general
    [Documentation]  คลิกปุ่ม 'ข้อมูลทั่วไป'
    Sleep  2s
    SeleniumLibrary.Click element  ${xpt_edit_button.sec_general}
    common_keywords_middle_portal.Wait for jquery loading completed

Click section barcode
    [Documentation]  คลิกปุ่ม 'บาร์โค้ด/คิวอาร์โค้ด'
    Sleep  2s
    SeleniumLibrary.Click element  ${xpt_edit_button.sec_barcode}
    common_keywords_middle_portal.Wait for jquery loading completed

Click add barcode
    [Documentation]  คลิกปุ่ม 'เพิ่ม'
    Sleep  2s
    SeleniumLibrary.Click element  ${xpt_edit_button.add_barcode}
    common_keywords_middle_portal.Wait for jquery loading completed

Click comfirm edit barcode
    [Documentation]  คลิกปุ่ม 'บันทึก'
    SeleniumLibrary.Click element  ${xpt_edit_button.confirm_edit_barcode}
    common_keywords_middle_portal.Wait for jquery loading completed

Click comfirm edit general
    [Documentation]  คลิกปุ่ม 'บันทึก'
    SeleniumLibrary.Click element  ${xpt_edit_button.confirm_edit_general}
    common_keywords_middle_portal.Wait for jquery loading completed

Click back to product detail
    [Documentation]  คลิกปุ่ม 'กลับไปยังหน้ารายละเอียดสินค้า'
    common_keywords_middle_portal.Scroll to header of page
    SeleniumLibrary.Click element  ${xpt_edit_button.back_to_page}
    common_keywords_middle_portal.Wait for jquery loading completed

Input data of general
    [Arguments]      ${barcode}  ${general_data}
    [Documentation]  กรอกข้อมูลส่วน 'ข้อมูลทั่วไป'
    FOR  ${index}  IN  @{general_data.keys()}
        SeleniumLibrary.Input text  ${xpt_edit_input.description}  ${general_data ['${index}']}
    END

Input data of barcode
    [Arguments]      ${barcode}  ${barcode_data}
    [Documentation]  กรอกข้อมูลส่วน 'บาร์โค้ด'
    IF  '${barcode_data ['barcode']}' == 'non'
        SeleniumLibrary.Click element  ${xpt_edit_button.coppy_code}
    ELSE
        SeleniumLibrary.Input text  ${xpt_edit_input.barcode}  ${barcode}
    END