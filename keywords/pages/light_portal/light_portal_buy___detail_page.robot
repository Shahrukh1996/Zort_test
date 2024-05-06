*** Variables ***

&{light_portal_buy_detail___text}             toppic_detail_buy_page=//div[@class='content']/div[@class='container-fluid']//h1[contains(normalize-space(.),'รายละเอียดรายการซื้อ')]

&{light_portal_buy_detail___contact__text}    branch_name_contact=//div[@id='tour-transaction-info']/div[2]//div[text()='ชื่อสาขา']
&{light_portal_buy_detail___contact__button}  name_contact=//div[text()='ชื่อผู้ติดต่อ']/following-sibling::div/a[text()='contact-name-detail']

&{light_portal_buy_detail___product__text}    focus_note=//span[text()='หมายเหตุ']
&{light_portal_buy_detail___product__button}  serial=(//table/tbody/tr/td)[2]//img

&{light_portal_buy_detail___serial__input}    store=//h3[text()='เพิ่ม Serial Number']/ancestor::div[@class='modal-content']//select[@id='serialnowarehouseid']
...                                           serial_on=//h3[text()='เพิ่ม Serial Number']/ancestor::div[@class='modal-content']//div[@id='serialList']//input[@id='serialNo_**index**']
&{light_portal_buy_detail___serial__button}   confirm=//h3[text()='เพิ่ม Serial Number']/ancestor::div[@class='modal-content']//button[text()='บันทึก']


*** Keywords ***
Focus note product
    [Documentation]  เลื่อนไปยัง 'หมายเหตุ'
        SeleniumLibrary.Scroll Element Into View  ${light_portal_buy_detail___product__text.focus_note}

Focus branch name contact
    [Documentation]  เลื่อนไปยัง 'ชื่อสาขา'
        SeleniumLibrary.Scroll Element Into View  ${light_portal_buy_detail___contact__text.branch_name_contact}

Check toppic detail buy page
    [Documentation]  เช็คคาวมพร้อม 'หน้ารายละเอียดรายการซื้อ'
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_buy_detail___text.toppic_detail_buy_page}

Click name contact of buy detail
    [Documentation]  คลิกปุ่ม 'ชื่อผู้ติดต่อ' หน้ารายละเอียด 
        SeleniumLibrary.Click element  ${light_portal_buy_detail___contact__button.name_contact}

Click serial product
    [Documentation]  คลิกปุ่ม 'ซีเรียว'
        SeleniumLibrary.Click element  ${light_portal_buy_detail___product__button.serial}
        light_portal_common_keywords.Wait for jquery loading completed

Click confirm of serial number
    [Documentation]  คลิกปุ่ม 'บันทึก'
        SeleniumLibrary.Click element  ${light_portal_buy_detail___serial__button.confirm}
        light_portal_common_keywords.Wait for jquery loading completed

Select warehouse of serial number
    [Arguments]      ${store}
    [Documentation]  เลือกข้อมูล 'คลังสินค้า'
        SeleniumLibrary.Select from list by label  ${light_portal_buy_detail___serial__input.store}  ${store}

Input serial of serial number
    [Arguments]      ${serial}
    [Documentation]  กรอกข้อมูล 'เลขซีเรียว'
        FOR  ${index_int}  IN  @{serial.keys()}
                ${index_str}=  BuiltIn.Convert to string  ${index_int}
                &{str_replace}=  BuiltIn.Create dictionary  **index**=${index_str}
                ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_buy_detail___serial__input.serial_on}  ${str_replace}
                SeleniumLibrary.Input text  ${new_xpath}  ${serial [${index_int}] ['serial_on']}
                SeleniumLibrary.Press keys  None  RETURN
                Sleep  1s
        END