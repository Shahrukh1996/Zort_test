
*** Variables ***
&{light_portal_sell_detail_page__text}    scroll_fogus_product=//div[@id='tour-transaction-product']//span[text()='สินค้า']
...                                       scroll_fogus_playment=//div[@id='tour-action-payment']/div/h2[contains(normalize-space(.),'การชำระเงิน')]
...                                       scroll_fogus_transfer=//div[@class='box-white']/div/h2[contains(normalize-space(.),'การโอนสินค้า')]
...                                       scroll_fogus_chat=//div[@class='container-fluid']/div/div/h2[contains(normalize-space(.),'พูดคุย')]
...                                       el_toppic_page=//div[@class='content']//h1[contains(normalize-space(.),'รายละเอียดรายการขาย')]
&{light_portal_sell_detail_page__button}  name_contact=//div[text()='ชื่อลูกค้า']/following-sibling::div/a[text()='contact-name-detail']
...                                       order=//div[@id='tour-action-other' and @class='btn-group']//span[text()='คำสั่ง']
...                                       order_edit=//div[@id='tour-action-other' and @class='btn-group open']//ul/li/a[text()='แก้ไข']
...                                       order_cancel=//div[@id='tour-action-other' and @class='btn-group open']//ul/li/a[text()='ยกเลิกรายการ']
...                                       confirm_edit=//button[text()='บันทึก']
...                                       confirm_cancel=//div[@class='modal-body']//p[text()='ยืนยันการยกเลิกรายการ']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']
...                                       cancel_edit_contact=//p[@id='confirmupdatecontactmsg']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยกเลิก']
...                                       add_payment=//div[@id='showpayment']/following-sibling::div/a[text()=' ชำระเพิ่ม']/i
...                                       confirm_payment=//button[text()='ยืนยันการชำระเงิน']
...                                       transfer_all=//div[@id='tour-action-transfer']/div/button/span[text()='โอนสินค้าออกจากคลัง']
...                                       confirm_transfer_all=//div[@class='modal-header']/h3[text()='โอนสินค้าออกจากคลัง']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']/button[text()='บันทึก']
...                                       log_sell_list=//a[text()='ดูกิจกรรมของรายการ']

&{light_portal_sell_detail___main_status__text}  payment=//h2[text()='สถานะการชำระเงิน']/ancestor::div[@class='text-right']//span[text()='**status**']
...                                              transfer=//h2[text()='สถานะการโอนสินค้า']/ancestor::div[@class='text-right']//span[text()='**status**']
...                                              delivery=//h2[text()='การจัดส่งสินค้า']/following-sibling::p[text()='**status**']

&{light_portal_sell_detail___sub_status__text}   payment=//h2[contains(normalize-space(.),'การชำระเงิน')]/ancestor::div[@id='tour-action-payment']//div[@id='showpayment']/span[text()='**status**']
...                                              transfer=//h2[contains(normalize-space(.),'การโอนสินค้า')]/ancestor::div[@class='box-white']//span[text()='**status**']/ancestor::div[@class='box-white']//a[text()='**store**']

&{light_portal_sell_detail___information__text}  name=//div[text()='รายการ']/following-sibling::div[text()='**data**']
...                                              create_date=//div[text()='วันที่']/following-sibling::div[text()='**data**']
...                                              funnel=//div[text()='ช่องทางการขาย']/following-sibling::div/span[contains(normalize-space(.),'**data**')]

&{light_portal_sell_detail___contact__text}      user=//div[text()='ผู้สร้างรายการ']/following-sibling::div[contains(normalize-space(.),'**data**')]
...                                              name=//div[text()='ชื่อลูกค้า']/following-sibling::div/a[contains(normalize-space(.),'**data**')]
...                                              code=//div[text()='รหัสลูกค้า']/following-sibling::div[contains(normalize-space(.),'**data**')]

&{light_portal_sell_detail___product__text}      code=//th[text()='รหัส']/ancestor::div[@id='tour-transaction-product']//td[contains(normalize-space(.),'**list**')]/following-sibling::td/a[contains(normalize-space(.),'**data**')]
...                                              name=//th[text()='ชื่อสินค้า']/ancestor::div[@id='tour-transaction-product']//td[contains(normalize-space(.),'**list**')]/following-sibling::td/div//a[text()='**data**']
...                                              amount=//th[text()='จำนวน']/ancestor::div[@id='tour-transaction-product']//td[contains(normalize-space(.),'**list**')]/following-sibling::td[contains(normalize-space(.),'**data**')]
...                                              price=//th[text()='มูลค่าต่อหน่วย']/ancestor::div[@id='tour-transaction-product']//td[contains(normalize-space(.),'**list**')]/following-sibling::td[4][text()='**data**']
...                                              focus_note=//span[text()='หมายเหตุ']
&{light_portal_sell_detail___product__button}    serial=//a[text()='**name_product**']/ancestor::tr/td//img
...                                              add_serial=//ul[@class='dropdown-menu sub-nav']//a[text()='เพิ่ม Serial Number']

&{light_portal_sell_detail___delivery__text}     channel=//div[text()='ช่องทางจัดส่ง']/following-sibling::div[contains(normalize-space(.),'**data**')]

&{light_portal_sell_detail___recipient__text}    name=//div[text()='ชื่อผู้รับ']/following-sibling::div[contains(normalize-space(.),'**data**')]
...                                              phone=//div[text()='เบอร์โทรศัพท์ผู้รับ']/following-sibling::div[contains(normalize-space(.),'**data**')]
...                                              email=//div[text()='อีเมลผู้รับ']/following-sibling::div[contains(normalize-space(.),'**data**')]
...                                              address=//div[text()='ที่อยู่/จัดส่ง']/following-sibling::div[contains(normalize-space(.),'**data**')]

&{light_portal_sell_detail___serial__button}     select_serial=//table[@class='table zort-table']/tbody/tr/td[text()='**serial_on**']/following-sibling::td/a[text()='เพิ่ม']

&{light_portal_log_sell_page__text}              log_list=//div[@id='UserLogTable']//table/tbody/tr/td[contains(normalize-space(.),'**user**')]/following-sibling::td[contains(normalize-space(.),'**detail**')]

&{light_portal_sell___print_doc___button}        print_document=//div[@id='tour-print-button-group']//button/span[text()='พิมพ์เอกสาร']
...                                              print_document__print_doc=//div[@id='tour-print-button-group']//ul/li[@id='tour-print-dropdown-button']/a[text()='พิมพ์เอกสาร']
...                                              size_doc=//div[@id='formatmainarea']//label[text()='ขนาด']/ancestor::div[@class='row']//label[contains(., '**size_doc**')]/input[@id='sizepaper0']
...                                              form_doc=//div[@id='formatpaperarea']//label[text()='รูปแบบ']/ancestor::div[@class='row']//select[@id='formatpaper']
...                                              toppic_doc=//div[@id='generalarea']//label[text()='หัวเรื่อง']/ancestor::div[@class='row']//input[@id='pdfheadername']
...                                              confirm_print_doc=//div[@id='pdfModal']//div[@class='modal-footer ']//button[@id='printpdfbtn' and text()='พิมพ์เอกสาร']
# --- Verify print doc --------->
&{light_portal_sell_detail___print_doc___text}  toppic_nomall=//p[@id='headerarea']/span[text()='**data**']
...                                             toppic_invoice=//div[@id='headerarea']/span[text()='**data**']
# --- share link --------->
# --- Verify share link --------->
&{light_portal_sell_detail___share_link___text}    toppic=//h1[@class='title-page' and text()='**data** ']
&{light_portal_sell_detail___share_link___button}  share_link=//div[@id='sellDetail_nextPrviousArea']/following-sibling::div//span[text()='Share Link']
...                                                coppy_link=//div[@id='sellDetail_nextPrviousArea']/following-sibling::div//input[@id='publiclink']


*** Keywords ***

# --- share link --------->
Click share link
    [Documentation]  คลิกปุ่ม 'share link'
        SeleniumLibrary.Click element  ${light_portal_sell_detail___share_link___button.share_link}

Get share link
    [Documentation]  เก็บข้อมูล 'link url'
        ${url}=  SeleniumLibrary.Get element attribute  ${light_portal_sell_detail___share_link___button.coppy_link}  value
    [return]  ${url}

# --- xxxx --------->
Click name contact of sell detail
    [Documentation]  คลิกปุ่ม 'ชื่อผู้ติดต่อ' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Scroll Element Into View  ${light_portal_sell_detail_page__text.scroll_fogus_product}
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.name_contact}

Click order of sell detail
    [Documentation]  คลิกปุ่ม 'คำสั่ง' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.order}

Click edit of sell detail
    [Documentation]  คลิกปุ่ม 'แก้ไข' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.order_edit}
        light_portal_common_keywords.Wait for jquery loading completed

Click cancel of sell detail
    [Documentation]  คลิกปุ่ม 'ยกเลิกรายการ' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.order_cancel}

Click confirm cancel of sell detail
    [Documentation]  คลิกปุ่ม 'ยืนยัน ของ ยกเลิกรายการ' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.confirm_cancel}
        light_portal_common_keywords.Wait for jquery loading completed

Click confirm print doc
    [Documentation]  คลิกปุ่ม 'ยืนยัน' พิมพ์เอกสาร
    SeleniumLibrary.Click element  ${light_portal_sell___print_doc___button.confirm_print_doc}

Click cancel edit contact of sell detail
    [Documentation]  คลิกปุ่ม 'ยกเลิก ของ แก้ไขข้อมูลลูกค้า' หน้า (รายละเอียดการขาย)
        light_portal_common_keywords.Auto keyword wait element  //p[@id='confirmupdatecontactmsg']
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.cancel_edit_contact}

Click log sell list of sell detail
    [Documentation]  คลิกปุ่ม 'ดูกิจกรรมของรายการ' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.log_sell_list}
        light_portal_common_keywords.Wait for jquery loading completed

Click print document all
    [Documentation]  คลิกปุ่ม 'พิมพ์เอกสาร'
        SeleniumLibrary.Click element  ${light_portal_sell___print_doc___button.print_document}
        Sleep  2s

Click print document choice print doc
    [Documentation]  เลือกพิมพ์ 'พิมพ์เอกสาร'
        SeleniumLibrary.Click element  ${light_portal_sell___print_doc___button.print_document__print_doc}
        Sleep  2s

Click serial product
    [Arguments]      ${name_product}
    [Documentation]  คลิกปุ่ม 'ซีเรียว'
        &{str_replace}=  BuiltIn.Create dictionary  **name_product**=${name_product}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___product__button.serial}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        SeleniumLibrary.Click element  ${light_portal_sell_detail___product__button.add_serial}
        light_portal_common_keywords.Wait for jquery loading completed

Select print doc size
    [Arguments]      ${size_doc}
    [Documentation]  เลือก 'ขนาด' พิมพ์เอกสาร
        &{str_replace}=  BuiltIn.Create dictionary  **size_doc**=${size_doc}
        ${new_xpath}=    light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell___print_doc___button.size_doc}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Select print doc form
    [Arguments]      ${form_doc}
    [Documentation]  เลือก 'รูปแบบ' พิมพ์เอกสาร
        SeleniumLibrary.Select from list by label  ${light_portal_sell___print_doc___button.form_doc}  ${form_doc}

Select print doc toppic
    [Arguments]      ${toppic_doc}
    [Documentation]  เลือก 'หัวเรื่อง' พิมพ์เอกสาร
        SeleniumLibrary.Input text  ${light_portal_sell___print_doc___button.toppic_doc}  ${toppic_doc}
        Sleep  2s

Select serial of serial number
    [Arguments]      ${serial_on}
    [Documentation]  เลือกข้อมูล 'เลขซีเรียว'
        &{str_replace}=  BuiltIn.Create dictionary  **serial_on**=${serial_on}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___serial__button.select_serial}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        light_portal_common_keywords.Wait for jquery loading completed

Scroll fogus to chat of sell detail
    [Documentation]  เลื่อนไปยังส่วน 'พูดคุย' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Scroll Element Into View  ${light_portal_sell_detail_page__text.scroll_fogus_chat}

Scroll fogus to playment of sell detail
    [Documentation]  เลื่อนไปยังส่วน 'การชำระเงิน' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Scroll Element Into View  ${light_portal_sell_detail_page__text.scroll_fogus_playment}

Scroll fogus to transfer of sell detail
    [Documentation]  เลื่อนไปยังส่วน 'การโอนสินค้า' หน้า (รายละเอียดการขาย)
        SeleniumLibrary.Scroll Element Into View  ${light_portal_sell_detail_page__text.scroll_fogus_transfer}

Focus note product
    [Documentation]  เลื่อนไปยัง 'หมายเหตุ'
        SeleniumLibrary.Scroll Element Into View  ${light_portal_sell_detail___product__text.focus_note}

Payment of sell detail
    [Documentation]  ทำการชำระเงิน หน้า (รายละเอียดการขาย)
        light_portal_sell___detail_page.Scroll fogus to transfer of sell detail
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.add_payment}
        Sleep  2s
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.confirm_payment}
        light_portal_common_keywords.Wait for jquery loading completed

Transfer of sell detail
    [Documentation]  ทำการโอนสินค้า หน้า (รายละเอียดการขาย)
        light_portal_sell___detail_page.Scroll fogus to chat of sell detail
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.transfer_all}
        Sleep  2s
        SeleniumLibrary.Click element  ${light_portal_sell_detail_page__button.confirm_transfer_all}
        light_portal_common_keywords.Wait for jquery loading completed

Check data of log sell list
    [Arguments]      ${name_sell}  ${user}  ${detail}
    [Documentation]  เช็ค log หน้า (ล็อกรายการขาย)
        &{detail_str_replace}=  BuiltIn.Create dictionary  ()=(${name_sell})
        ${new_detail}=  light_portal_common_keywords.Auto keyword replace string  ${detail}  ${detail_str_replace}

        &{str_replace}=  BuiltIn.Create dictionary  **user**=${user}  **detail**=${new_detail}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_log_sell_page__text.log_list}  ${str_replace}

        ${result}=  BuiltIn.Run keyword and return status  SeleniumLibrary.Wait until element is visible  ${new_xpath}  ${min_timeout}
        IF  ${result} == False
                ${day}=    light_portal_common_keywords.Get current day
                ${month}=  light_portal_common_keywords.Get current month
                ${year}=   light_portal_common_keywords.Get current year
                SeleniumLibrary.Capture Page Screenshot  C:/Users/totsawat.a_zortout/Documents/zortautomatetest/results/light_portal/SELL_04_01/error_log_sell_list_${day}${month}${year}.png
                BuiltIn.Log  ไม่มีรายการ [ LOG : "${new_detail}" ]
                SeleniumLibrary.Wait until element is visible  ${new_xpath}
        END

Check toppic page
    [Documentation]  เช็คความพร้อม 'หัวข้อ' หน้ารายละเอียดการขาย
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_sell_detail_page__text.el_toppic_page}

# --- Verify detail --------->

Check main status payment
    [Arguments]      ${status}
    [Documentation]  เช็คสถานะหลัก 'ชำระเงิน'
        &{str_replace}=  BuiltIn.Create dictionary  **status**=${status}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___main_status__text.payment}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check main status transfer
    [Arguments]      ${status}
    [Documentation]  เช็คสถานะหลัก 'โอนสินค้า'
        &{str_replace}=  BuiltIn.Create dictionary  **status**=${status}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___main_status__text.transfer}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check main status delivery
    [Arguments]      ${status}
    [Documentation]  เช็คสถานะหลัก 'การขนส่ง'
        &{str_replace}=  BuiltIn.Create dictionary  **status**=${status}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___main_status__text.delivery}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check sub status payment
    [Arguments]      ${status}
    [Documentation]  เช็คสถานะรอง 'ชำระเงิน'
        &{str_replace}=  BuiltIn.Create dictionary  **status**=${status}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___sub_status__text.payment}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check sub status transfer
    [Arguments]      ${status}
    [Documentation]  เช็คสถานะรอง 'โอนสินค้า'
        &{str_replace}=  BuiltIn.Create dictionary  **status**=${status}[0]  **store**=${status}[1]
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___sub_status__text.transfer}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check data information
    [Arguments]      ${data}
    [Documentation]  เช็คข้อมูล 'พื้นฐาน'
        FOR  ${keys}  IN  @{data.keys()}
            &{str_replace}=  BuiltIn.Create dictionary  **data**=${data ['${keys}']}
            ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___information__text.${keys}}  ${str_replace}
            SeleniumLibrary.Wait until element is visible  ${new_xpath}
        END

Check data contact
    [Arguments]      ${data}
    [Documentation]  เช็คข้อมูล 'ผู้ติดต่อ'
        FOR  ${keys}  IN  @{data.keys()}
            &{str_replace}=  BuiltIn.Create dictionary  **data**=${data ['${keys}']}
            ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___contact__text.${keys}}  ${str_replace}
            SeleniumLibrary.Wait until element is visible  ${new_xpath}
        END

Check data product
    [Arguments]      ${data}
    [Documentation]  เช็คข้อมูล 'สินค้า'
        FOR  ${list}  IN  @{data.keys()}
            FOR  ${keys}  IN  @{data[${list}].keys()}
                ${list_str}  BuiltIn.Convert to string  ${list}
                &{str_replace}=  BuiltIn.Create dictionary  **list**=${list_str}  **data**=${data[${list}] ['${keys}']}
                ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___product__text.${keys}}  ${str_replace}
                SeleniumLibrary.Wait until element is visible  ${new_xpath}
            END
        END

Check data delivery
    [Arguments]      ${data}
    [Documentation]  เช็คข้อมูล 'ขนส่ง'
        FOR  ${keys}  IN  @{data.keys()}
            &{str_replace}=  BuiltIn.Create dictionary  **data**=${data ['${keys}']}
            ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___delivery__text.${keys}}  ${str_replace}
            SeleniumLibrary.Wait until element is visible  ${new_xpath}
        END

Check data recipient
    [Arguments]      ${data}
    [Documentation]  เช็คข้อมูล 'ผู้รับ'
        FOR  ${keys}  IN  @{data.keys()}
            &{str_replace}=  BuiltIn.Create dictionary  **data**=${data ['${keys}']}
            ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___recipient__text.${keys}}  ${str_replace}
            SeleniumLibrary.Wait until element is visible  ${new_xpath}
        END

# --- Verify print doc --------->

Check nomall toppic
    [Arguments]      ${toppic_doc}
    [Documentation]  เช็คข้อมูล 'หัวเรื่อง'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${toppic_doc}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___print_doc___text.toppic_nomall}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check invoice toppic
    [Arguments]      ${toppic_doc}
    [Documentation]  เช็คข้อมูล 'หัวเรื่อง'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${toppic_doc}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___print_doc___text.toppic_invoice}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

# --- Verify share link --------->

Check share link for toppic
    [Arguments]      ${toppic}
    [Documentation]  เช็คข้อมูล 'หัวเรื่อง'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${toppic}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_detail___share_link___text.toppic}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}