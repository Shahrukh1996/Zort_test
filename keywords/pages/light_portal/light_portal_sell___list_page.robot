*** Variables ***
&{light_portal_sell_list_page_input}                    quick_search=//input[@id='quicksearchtext']

&{light_portal_sell_list_page_button}                   advanced_mode=//div[@class='btn-group']/button[@id='btn-switch-filter']/i
...                                                     confirm_advanced_search=(//h3[text()='ค้นหาขั้นสูง']/ancestor::form[@id='old-filter']//input[@value='ค้นหา'])[1]
...                                                     close_advanced_search=//form[@id='old-filter']/div[@class='search-advance__header']//a[text()='ปิด']
...                                                     short_task=//div[@class='file-manager']/div/span[@class='pull-right']
...                                                     target_chk=//a[text()='**name**']/ancestor::tr/td[@class='chk']//input[@type='checkbox']
...                                                     target_list=//td[@class='name']//a[text()='**name**']
...                                                     delivery_service=//span[text()='บริการส่งสินค้า']
...                                                     all_list=//span[text()='บริการส่งสินค้า']/ancestor::div[@class='btn-group open']/ul[@class='dropdown-menu sub-nav']/li/a[text()='รวมรายการ']
...                                                     confirm_delivery_service_1=//button[@id='logistics-info' and text()='ต่อไป']
...                                                     confirm_delivery_service_2=//button[@id='confirm']
...                                                     warehouse=//select[@id='sender-warehouse']
...                                                     print_document=//div[@id='checkboxrecordarea0']/div[@class='btn-group']/button/span[text()='พิมพ์เอกสาร']
...                                                     print_document__print_doc=//div[@id='checkboxrecordarea0']/div[@class='btn-group open']/ul/li/a[text()='พิมพ์เอกสาร']
...                                                     print_document__print_box=//div[@id='checkboxrecordarea0']/div[@class='btn-group open']/ul/li/a[text()='พิมพ์ใบจ่าหน้าจดหมาย/กล่อง']
...                                                     size_sticker=//label[text()='สติ๊กเกอร์ 4"x6"']/ancestor::div[@class='d-flex']//input[@id='multisizeletter4']
...                                                     confirm_print_document=//div[@class='modal-footer']/button[text()='พิมพ์ฉลากจัดส่ง']

&{light_portal_sell_list_page_section_sender_input}     name=//input[@id='sender-name1']
...                                                     phone=//input[@id='sender-phone1']
...                                                     houseno=//input[@id='sender-houseno_1']
...                                                     province=//select[@id='sender-province_1']
...                                                     district=//select[@id='sender-district_1']
...                                                     subdistrict=//select[@id='sender-tambon_1']
...                                                     address=//textarea[@id='sender-address_1']

&{light_portal_sell_list_page_section_recipient_text}   select_weight=//select[@id='parcel-weight-**index**']
...                                                     select_dimension=//select[@id='parcel-dimension-**index**']
&{light_portal_sell_list_page_section_recipient_input}  weight=//div[@id='custom-weight-**index**']/input
...                                                     Width=//div[@id='custom-dimension-**index**']/div/input[@name='custom-width']
...                                                     length=//div[@id='custom-dimension-**index**']/div/input[@name='custom-length']
...                                                     height=//div[@id='custom-dimension-**index**']/div/input[@name='custom-height']
...                                                     name=//input[@id='recipient-name-**index**']
...                                                     phone=//input[@id='recipient-phone-**index**']
...                                                     houseno=//input[@id='recipient-houseno_-**index**']
...                                                     province=//select[@id='recipient-province_-**index**']
...                                                     district=//select[@id='recipient-district_-**index**']
...                                                     subdistrict=//select[@id='recipient-tambon_-**index**']
...                                                     address=//textarea[@id='recipient-address_-**index**']

&{light_portal_sell_list_page_section_transport_input}  kerry=//input[@id='kerry-express']/following-sibling::label//span[text()='Kerry Express']
...                                                     flash=//input[@id='flash-express']/following-sibling::label//span[text()='Flash Express']

&{light_portal_sell_list_page___print_doc__text}        set_overall=//div[@id='printableArea' and @class='fw-600']
...                                                     outer=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']
...                                                     inner_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']
...                                                     inner_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']
...                                                     inner_3=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']
...                                                     header_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']
...                                                     header_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div
...                                                     logo_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__logo']
...                                                     logo_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__logo']/span/img[@height='40']
...                                                     lot=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__lot' and text()='**lot**']
...                                                     service_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__service']
...                                                     service_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__service']/div[1][@style='font-size:12px;' and text()='**service**']
...                                                     service_3=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__service']/div[2]
...                                                     regcode=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__regcode']
...                                                     discode_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__discode']
...                                                     discode_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__discode']/div[1][@style='font-size:12px;' and text()='**discode**']
...                                                     discode_3=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__discode']/div[2]
...                                                     route_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__route']
...                                                     route_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__route']/div[1][@style='font-size:12px;' and text()='**route**']
...                                                     route_3=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__route']/div[2][text()='**route**']
...                                                     qrcode_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__qrcode']
...                                                     qrcode_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__qrcode']/div/canvas
...                                                     qrcode_3=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__qrcode']/div/img
...                                                     barcode_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__barcode']
...                                                     barcode_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__barcode']/span[@id='barcode-kerry']/label
...                                                     barcode_3=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__barcode']/span[@id='barcode-kerry']/label/img[@data-value='**name**' and @data-textmargin='0' and @data-margin='0' and @data-height='50' and @data-displayvalue='false']
...                                                     barcode_4=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__barcode']/span[@id='barcode-kerry']/label/div[text()='**name**']
...                                                     consignumber=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__header']/div[@class='koms__consignumber']
...                                                     sender=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__sender']
...                                                     senders=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__sender']/div[1]
...                                                     senders_text=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__sender']/div[1]/span[contains(text(),'ผู้ส่ง: **sender**')]
...                                                     recipient_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__sender']/div[2][text()='ผู้รับ: **recipient** โทร: **phone**']
...                                                     recipient_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__sender']/div[3][text()='ที่อยู่: **address**']
...                                                     recipient=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__recipient']
...                                                     recipient_left_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__recipient']/div[@class='koms__recipient-left']/div[1]
...                                                     recipient_left_1_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__recipient']/div[@class='koms__recipient-left']/div[1]/span
...                                                     recipient_left_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__recipient']/div[@class='koms__recipient-left']/div[2]
...                                                     recipient_right_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__recipient']/div[@class='koms__recipient-right']/div[1]
...                                                     recipient_right_2=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__recipient']/div[@class='koms__recipient-right']/div[2]
...                                                     recipient_right_2_1=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__recipient']/div[@class='koms__recipient-right']/div[2]/span
...                                                     sortation=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__sortation']
...                                                     order=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__order']
...                                                     order_header=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__order']/div[@class='koms__order-header']
...                                                     order_left=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__order']/div[@class='koms__order-header']/div[@class='koms__order-left' and text()='ลำดับ']
...                                                     order_right=//div[@id='printableArea']/div[@class='page-wrapper sticker4x6 alwaysbreak']/div[@class='kerry-font']/div[@class='w-kerry']/div[@class='koms']/div[@class='koms__order']/div[@class='koms__order-header']/div[@class='koms__order-right' and text()='รายการ']

&{light_portal_sell_list___text}                        el_toppic_advance_search=//form[@id='old-filter']//h3[@class='search-advance__title' and text()='ค้นหาขั้นสูง']
&{light_portal_sell_list___button}                      add_sell=//div[@id='addTransactionBtn']//button[text()='สร้าง']

&{light_portal_sell_list___table__text}                 create_date=//table/tbody/tr/td[@class='date' and contains(normalize-space(.),'**data**')]
...                                                     name=//table/tbody/tr/td[@class='name']//a[contains(normalize-space(.),'**data**')]
...                                                     contact=//table/tbody/tr/td[@class='customer']//a[contains(normalize-space(.),'**data**')]
...                                                     funnel=//table/tbody/tr/td[@class='channel']//span[contains(normalize-space(.),'**data**')]
...                                                     delivery_status=//table/tbody/tr/td[@class='shipping']//span[text()='COD']
...                                                     price=//table/tbody/tr/td[starts-with(@class, 'amount') and contains(normalize-space(.),'**data**')]
...                                                     transfer_status=//table/tbody/tr/td[starts-with(@class, 'status')]//u[contains(normalize-space(.),'**data**')]
...                                                     transfer_store=//table/tbody/tr/td[starts-with(@class, 'status')]//span[contains(normalize-space(.),'**data**')]
...                                                     payment_status=//table/tbody/tr/td[starts-with(@class, 'payment')]//u[contains(normalize-space(.),'**data**')]
...                                                     not_found=//div[@id='TransactionTable']//div[@class='t-responsive']//a[text()='สร้างรายการขายได้ที่นี่']/following-sibling::span[text()='เพื่อจัดการออเดอร์กับลูกค้า']
...                                                     expire_payment=//div[@id='TransactionTable']//tbody/tr/td[@class='name']//a[text()='**data**']/ancestor::tr/td[@class='payment text-center']/div[text()='หมดอายุ']
...                                                     expire_transfer=//div[@id='TransactionTable']//tbody/tr/td[@class='name']//a[text()='**data**']/ancestor::tr/td[@class='status text-center']/div[text()='หมดอายุ']
&{light_portal_sell_list___table__button}               chk=//div[@id='TransactionTable']//table/tbody/tr/td[@class='name']//a[text()='**name_sell**']/ancestor::tr/td[@class='chk']//input[@type='checkbox']
...                                                     list=//table/tbody/tr/td[@class='name']//a[text()='**name_sell**']
...                                                     kbub_list=//div[@id='TransactionTable']//tbody/tr/td[@class='name']/div/a[text()='**name_sell**']/ancestor::tr/td[@class='action text-right']/div[@class='btn-etc dropdown']/i
...                                                     kbub_delete=//div[@id='TransactionTable']//tbody/tr/td[@class='name']/div/a[text()='**name_sell**']/ancestor::tr/td[@class='action text-right']/div[@class='btn-etc dropdown open']/ul/li/a[text()='ลบรายการ']
...                                                     confirm_delete=//p[contains(text(),'ยืนยันการลบรายการ')]/ancestor::div[@class='modal-content']//div[@class='modal-footer ']//button[text()='ยืนยัน']

&{light_portal_sell_list___print_doc___text}            toppic_nomall=//p[@id='headerarea0']/span[text()='**data**']
...                                                     toppic_invoice=//div[@id='headerarea0']/span[text()='**data**']
&{light_portal_sell_list___print_doc___button}          size_doc=//div[@id='multipdfModal']//div[@class='form-group']//label[text()='ขนาด']/ancestor::div[@class='row']//label[contains(., '**size_doc**')]/input[@id='multisizepaper0']
...                                                     form_doc=//div[@id='multipdfModal']//div[@class='form-group']//label[text()='รูปแบบ']/ancestor::div[@class='row']//select[@id='multiformatpaper']
...                                                     toppic_doc=//div[@id='multipdfModal']//div[@class='form-group']//label[text()='หัวเรื่อง']/ancestor::div[@class='row']//input[@id='multipdfheadername']
...                                                     confirm_print_doc=//div[@id='multipdfModal']//div[@class='modal-footer ']//button[text()='พิมพ์เอกสาร']


*** Keywords ***
Click create sell
    [Documentation]  คลิกปุ่ม 'สร้างรายการขาย'
        SeleniumLibrary.Click element  ${light_portal_sell_list___button.add_sell}
        light_portal_common_keywords.Wait for jquery loading completed

Click kbub list
    [Arguments]      ${name_sell}
    [Documentation]  คลิกปุ่ม 'เคบับ'
        &{str_replace}=  BuiltIn.Create dictionary  **name_sell**=${name_sell}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__button.kbub_list}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        Sleep  5s

Click kbub delete
    [Arguments]      ${name_sell}
    [Documentation]  คลิกปุ่ม 'ลบรายการ'
        light_portal_common_keywords.Scroll to footer of page
        &{str_replace}=  BuiltIn.Create dictionary  **name_sell**=${name_sell}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__button.kbub_delete}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        Sleep  2s
        
Click confirm delete
    [Documentation]  คลิกปุ่ม 'ยืนยันลบรายการ'
        SeleniumLibrary.Click element  ${light_portal_sell_list___table__button.confirm_delete}
        light_portal_common_keywords.Wait for jquery loading completed

Click check box by name
    [Arguments]      ${name_sell}
    [Documentation]  คลิกปุ่ม 'เช็คบล็อก' โดยอิงจาก ชื่อ
        &{str_replace}=  BuiltIn.Create dictionary  **name_sell**=${name_sell}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__button.chk}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        Sleep  2s

Click list by name
    [Arguments]      ${name_sell}
    [Documentation]  คลิกปุ่ม 'รายการ' โดยอิงจาก ชื่อ
        &{str_replace}=  BuiltIn.Create dictionary  **name_sell**=${name_sell}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__button.list}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}
        light_portal_common_keywords.Wait for jquery loading completed

Click short task manager
    [Documentation]  คลิกย่อ 'task manager'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.short_task}
    Sleep  1s

Click open advanced search
    [Documentation]  คลิกปุ่ม 'เปิดค้นหาขั้นสูง'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.advanced_mode}
    light_portal_common_keywords.Auto keyword wait element  ${light_portal_sell_list___text.el_toppic_advance_search}

Click close advanced search
    [Documentation]  คลิกปุ่ม 'ปิดค้นหาขั้นสูง'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.close_advanced_search}
    Sleep  3s

Click confirm advanced search
    [Documentation]  คลิกปุ่ม 'ค้นหา'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.confirm_advanced_search}
    light_portal_common_keywords.Wait for jquery loading completed

Click size sticker
    [Documentation]  คลิกเลือก 'ขนาด : พิมพ์ใบแปะกล่อง'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.size_sticker}
    Sleep  2s

Click print document all
    [Documentation]  คลิกปุ่ม 'พิมพ์เอกสาร'
        SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.print_document}
        Sleep  2s

Click print document choice print doc
    [Documentation]  เลือกพิมพ์ 'พิมพ์เอกสาร'
        SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.print_document__print_doc}
        Sleep  2s

Click print document choice print box
    [Documentation]  เลือกพิมพ์ 'พิมพ์ใบแปะจดหมาย/กล่อง'
        SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.print_document__print_box}
        Sleep  2s

Click confirm print document
    [Documentation]  คลิกปุ่ม 'ยืนยัน : พิมพ์ใบแปะกล่อง'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.confirm_print_document}
    light_portal_common_keywords.Wait for jquery loading completed

Click delivery service
    [Documentation]  คลิกปุ่ม 'บริการส่งสินค้า'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.delivery_service}
    Sleep  2s

Click delivery service choice all list
    [Documentation]  คลิกปุ่ม 'บริการส่งสินค้า' > 'รวมรายการ'
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.all_list}
    light_portal_common_keywords.Wait for jquery loading completed

Click confirm delivery service 1
    [Documentation]  คลิกปุ่ม 'ต่อไป' ยืนยันกรอกข้อมูลบริการขนส่ง
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.confirm_delivery_service_1}
    light_portal_common_keywords.Wait for jquery loading completed

Click confirm delivery service 2
    [Documentation]  คลิกปุ่ม 'ยืนยัน' ยืนยันเรียกบริการขนส่ง
    Sleep  2s
    SeleniumLibrary.Click element  ${light_portal_sell_list_page_button.confirm_delivery_service_2}
    light_portal_common_keywords.Wait for jquery loading completed

Click confirm print doc
    [Documentation]  คลิกปุ่ม 'ยืนยัน' พิมพ์เอกสาร
    SeleniumLibrary.Click element  ${light_portal_sell_list___print_doc___button.confirm_print_doc}

Click sell list by name
    [Arguments]      ${name_sell}
    [Documentation]  คลิก 'รายการขาย' โดยอ้างอิง 'ชื่อรายการ'
    &{str_replace}=  BuiltIn.Create dictionary  **name**=${name_sell}
    ${new_xpath}=    light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_button.target_list}  ${str_replace}
    SeleniumLibrary.Click element  ${new_xpath}
    light_portal_common_keywords.Wait for jquery loading completed

Select warehouse of delivery service
    [Arguments]      ${transport_detail}
    [Documentation]  เลือก 'รายการขาย' โดยอ้างอิง 'ชื่อรายการ'
    Sleep  1s
    SeleniumLibrary.Select from list by label  ${light_portal_sell_list_page_button.warehouse}  ${transport_detail}

Select sell list by name
    [Arguments]      ${name_sell}
    [Documentation]  เลือก 'รายการขาย' โดยอ้างอิง 'ชื่อรายการ'
    &{str_replace}=  BuiltIn.Create dictionary  **name**=${name_sell}
    ${new_xpath}=    light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_button.target_chk}  ${str_replace}
    SeleniumLibrary.Click element  ${new_xpath}

Select print doc size
    [Arguments]      ${size_doc}
    [Documentation]  เลือก 'ขนาด' พิมพ์เอกสาร
        &{str_replace}=  BuiltIn.Create dictionary  **size_doc**=${size_doc}
        ${new_xpath}=    light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___print_doc___button.size_doc}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Select print doc form
    [Arguments]      ${form_doc}
    [Documentation]  เลือก 'รูปแบบ' พิมพ์เอกสาร
        SeleniumLibrary.Select from list by label  ${light_portal_sell_list___print_doc___button.form_doc}  ${form_doc}

Select print doc toppic
    [Arguments]      ${toppic_doc}
    [Documentation]  เลือก 'หัวเรื่อง' พิมพ์เอกสาร
        SeleniumLibrary.Input text  ${light_portal_sell_list___print_doc___button.toppic_doc}  ${toppic_doc}
        Sleep  2s

Input data for quick search by sell name
    [Arguments]  ${sell_list_name}
    light_portal_common_keywords.Auto keyword clear input text  ${light_portal_sell_list_page_input.quick_search}
    SeleniumLibrary.Input text  ${light_portal_sell_list_page_input.quick_search}  ${sell_list_name}

Input data section transport channel
    [Arguments]      ${transport_data}
    [Documentation]  กรอกข้อมูล 'ขนส่ง'
    IF       '${transport_data}' == 'Kerry Express'
                Sleep  1s
                SeleniumLibrary.Click element  ${light_portal_sell_list_page_section_transport_input.kerry}
    ELSE IF  '${transport_data}' == 'Flash Express'
                Sleep  1s
                SeleniumLibrary.Click element  ${light_portal_sell_list_page_section_transport_input.flash}
    END

Input data section sender information
    [Arguments]      ${sender_data}
    [Documentation]  กรอกข้อมูล 'ผู้ส่ง'
    FOR  ${index}  IN  @{sender_data.keys()}
        IF  '${index}' == 'province'
            Sleep  1s
            SeleniumLibrary.Select from list by label  ${light_portal_sell_list_page_section_sender_input.${index}}  ${sender_data ['${index}']}
        ELSE IF  '${index}' == 'district'
            Sleep  1s
            SeleniumLibrary.Select from list by label  ${light_portal_sell_list_page_section_sender_input.${index}}  ${sender_data ['${index}']}
        ELSE IF  '${index}' == 'subdistrict'
            Sleep  1s
            SeleniumLibrary.Select from list by label  ${light_portal_sell_list_page_section_sender_input.${index}}  ${sender_data ['${index}']}
        ELSE
            Sleep  1s
            light_portal_common_keywords.Auto keyword clear input text  ${light_portal_sell_list_page_section_sender_input.${index}}
            SeleniumLibrary.Input text  ${light_portal_sell_list_page_section_sender_input.${index}}  ${sender_data ['${index}']}
        END
    END

Input data section recipient information
    [Arguments]      ${recipient_data}
    [Documentation]  กรอกข้อมูล 'ผู้รับ'
    FOR  ${index}  IN  @{recipient_data.keys()}
        ${str_index}=  BuiltIn.Convert to string  ${index}
        FOR  ${index2}  IN  @{recipient_data[${index}].keys()}
            IF       '${index2}' == 'weight'
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_text.select_weight}  ${str_replace}
                        SeleniumLibrary.Select from list by label  ${new_xpath}   กำหนดเอง
                        Sleep  1s
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}
            ELSE IF  '${index2}' == 'dimension'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_text.select_dimension}  ${str_replace}
                        SeleniumLibrary.Select from list by label  ${new_xpath}   กำหนดเอง
                        Sleep  1s
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.Width}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}'] ['Width']}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.length}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}'] ['length']}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.height}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}'] ['height']}
            ELSE IF  '${index2}' == 'name'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}
            ELSE IF  '${index2}' == 'phone'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}
            ELSE IF  '${index2}' == 'houseno'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}          
            ELSE IF  '${index2}' == 'address'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Input text  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}
            ELSE IF  '${index2}' == 'province'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Select from list by label  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}
            ELSE IF  '${index2}' == 'district'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Select from list by label  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}
            ELSE IF  '${index2}' == 'subdistrict'
                        Sleep  1s
                        &{str_replace}=  BuiltIn.Create dictionary  **index**=${str_index}
                        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page_section_recipient_input.${index2}}  ${str_replace}
                        SeleniumLibrary.Select from list by label  ${new_xpath}  ${recipient_data[${index}] ['${index2}']}
            END
        END
    END

Check expect data paper
    [Arguments]      ${data}
    [Documentation]  เช็คข้อมูลเปลี่ยบเทียบของกระดาษ
        IF  ${data} == ['0', '0']
            BuiltIn.Should be equal as strings  Don't match data  ['0', '0']
        END

Check overall paper
    [Documentation]  เช็คกระดาษ 'การตั้งค่าโดยรวม'
    # เช็ค css
    ${set_overall_paper}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.set_overall}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${overall_font_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${set_overall_paper},null).getPropertyValue('font-style');
        ${overall_font_family}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${set_overall_paper},null).getPropertyValue('font-family');
        ${overall_font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${set_overall_paper},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${overall_font_style}   normal
            BuiltIn.Should contain  ${overall_font_family}  thsarabunnew, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${overall_font_weight}  600

Check outer paper
    [Arguments]      ${choice_print}
    [Documentation]  เช็คกระดาษ 'ด้านนอก'
    # เช็ค css
    ${outer_paper}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.outer}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper},null).getPropertyValue('width');
        ${outer_height}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper},null).getPropertyValue('height');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper},null).getPropertyValue('margin');
        ${outer_padding}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper},null).getPropertyValue('padding');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper},null).getPropertyValue('position');
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper},null).getPropertyValue('font-size');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper},null).getPropertyValue('background');

            IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
                        Log  ${outer_width}
                        Log  ${outer_height}
                        Log  ${outer_margin}
                        Log  ${outer_padding}
                        Log  ${outer_position}
                        Log  ${outer_font_size}
                        Log  ${outer_background}

                        ${expect___outer_width}=       BuiltIn.Create list    377.938px    377.948px
                        ${expect___outer_height}=      BuiltIn.Create list    563.141px    563.146px
                        ${expect___outer_margin}=      BuiltIn.Create list    0px 770.531px    0px 442.698px 0px 442.688px
                        ${expect___outer_padding}=     BuiltIn.Create list    5px    5px
                        ${expect___outer_position}=    BuiltIn.Create list    relative    relative
                        ${expect___outer_font_size}=   BuiltIn.Create list    11px    11px
                        ${expect___outer_background}=  BuiltIn.Create list    rgb(255, 255, 255) none repeat scroll 0% 0% / auto padding-box border-box    rgb(255, 255, 255) none repeat scroll 0% 0% / auto padding-box border-box

                        ${result___outer_width}=       light_portal_common_keywords.Auto keyword expect data for multi list  ${outer_width}       ${expect___outer_width}
                        light_portal_sell___list_page.Check expect data paper  ${result___outer_width}
                        ${result___outer_height}=      light_portal_common_keywords.Auto keyword expect data for multi list  ${outer_height}      ${expect___outer_height}
                        light_portal_sell___list_page.Check expect data paper  ${result___outer_height}
                        ${result___outer_margin}=      light_portal_common_keywords.Auto keyword expect data for multi list  ${outer_margin}      ${expect___outer_margin}
                        light_portal_sell___list_page.Check expect data paper  ${result___outer_margin}
                        ${result___outer_padding}=     light_portal_common_keywords.Auto keyword expect data for multi list  ${outer_padding}     ${expect___outer_padding}
                        light_portal_sell___list_page.Check expect data paper  ${result___outer_padding}
                        ${result___outer_position}=    light_portal_common_keywords.Auto keyword expect data for multi list  ${outer_position}    ${expect___outer_position}
                        light_portal_sell___list_page.Check expect data paper  ${result___outer_position}
                        ${result___outer_font_size}=   light_portal_common_keywords.Auto keyword expect data for multi list  ${outer_font_size}   ${expect___outer_font_size}
                        light_portal_sell___list_page.Check expect data paper  ${result___outer_font_size}
                        ${result___outer_background}=  light_portal_common_keywords.Auto keyword expect data for multi list  ${outer_background}  ${expect___outer_background}
                        light_portal_sell___list_page.Check expect data paper  ${result___outer_background}

            ELSE IF  '${choice_print}' == 'ใบแปะกล่องแบบสติ๊กเกอร์'
                        BuiltIn.Should contain  ${outer_width}       377.938px
                        BuiltIn.Should contain  ${outer_height}      563.141px
                        BuiltIn.Should contain  ${outer_margin}      0px 763.031px
                        BuiltIn.Should contain  ${outer_padding}     5px
                        BuiltIn.Should contain  ${outer_font_size}   11px
                        BuiltIn.Should contain  ${outer_position}    relative
                        BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255) none repeat scroll 0% 0% / auto padding-box border-box
            END

Check inner paper
    [Documentation]  เช็คกระดาษ 'ด้านใน'
    # เช็ค css ส่วนที่ 1
    ${inner_1_paper}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.inner_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_1_font_family}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_1_paper},null).getPropertyValue('font-family');
            BuiltIn.Should contain  ${inner_1_font_family}  Boon
    # เช็ค css ส่วนที่ 2
    ${inner_2_paper}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.inner_2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_2_width}=             SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_2_paper},null).getPropertyValue('width');
        ${inner_2_height}=            SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_2_paper},null).getPropertyValue('height');
        ${inner_2_margin}=            SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_2_paper},null).getPropertyValue('margin');
        ${inner_2_margin_top}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_2_paper},null).getPropertyValue('margin-top');
        ${inner_2_background_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_2_paper},null).getPropertyValue('background-color');
            &{str__inner_2_width}=      BuiltIn.Create dictionary  px=
            ${replace__inner_2_width}=  light_portal_common_keywords.Auto keyword replace string  ${inner_2_width}  ${str__inner_2_width}
            ${int__inner_2_width}=      BuiltIn.Convert to number  ${replace__inner_2_width}
                BuiltIn.Should Be Equal As Numbers  ${int__inner_2_width}  367  precision=0
            &{str__inner_2_height}=      BuiltIn.Create dictionary  px=
            ${replace__inner_2_height}=  light_portal_common_keywords.Auto keyword replace string  ${inner_2_height}  ${str__inner_2_height}
            ${int__inner_2_height}=      BuiltIn.Convert to number  ${replace__inner_2_height}
                BuiltIn.Should Be Equal As Numbers  ${int__inner_2_height}  555  precision=0
            @{inner_2_margin_s}=            String.Split string  ${inner_2_margin}
            &{str__inner_2_margin_s}=       BuiltIn.Create dictionary  px=
            ${replace__inner_2_margin_s1}=  light_portal_common_keywords.Auto keyword replace string  ${inner_2_margin_s}[1]  ${str__inner_2_margin_s}
            ${replace__inner_2_margin_s3}=  light_portal_common_keywords.Auto keyword replace string  ${inner_2_margin_s}[3]  ${str__inner_2_margin_s}
            ${int__inner_2_margin_s1}=      BuiltIn.Convert to number  ${replace__inner_2_margin_s1}
            ${int__inner_2_margin_s3}=      BuiltIn.Convert to number  ${replace__inner_2_margin_s3}
                BuiltIn.Should contain  ${inner_2_margin_s}[0]  2px
                BuiltIn.Should Be Equal As Numbers  ${int__inner_2_margin_s1}  1  precision=0
                BuiltIn.Should contain  ${inner_2_margin_s}[2]  0px
                BuiltIn.Should Be Equal As Numbers  ${int__inner_2_margin_s3}  1  precision=0
            BuiltIn.Should contain  ${inner_2_margin_top}  2px
            BuiltIn.Should contain  ${inner_2_background_color}  rgb(255, 255, 255)
    # เช็ค css ส่วนที่ 3
    ${inner_3_paper}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.inner_3}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_3_border}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_3_paper},null).getPropertyValue('border');
        ${inner_3_height}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_3_paper},null).getPropertyValue('height');
        ${inner_3_word_wrap}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_3_paper},null).getPropertyValue('word-wrap');
            &{str__inner_3_height}=      BuiltIn.Create dictionary  px=
            ${replace__inner_3_height}=  light_portal_common_keywords.Auto keyword replace string  ${inner_3_height}  ${str__inner_3_height}
            ${int__inner_3_height}=      BuiltIn.Convert to number  ${replace__inner_3_height}
                BuiltIn.Should Be Equal As Numbers  ${int__inner_3_height}  555  precision=0

            # @{inner_3_border_s}=            String.Split string  ${inner_3_border}
            # &{str__inner_3_border_s}=       BuiltIn.Create dictionary  px=
            # ${replace__inner_3_border_s1}=  light_portal_common_keywords.Auto keyword replace string  ${inner_3_border_s}[0]  ${str__inner_3_border_s}
            # ${int__inner_3_border_s1}=      BuiltIn.Convert to number  ${replace__inner_3_border_s1}
            #     BuiltIn.Should Be Equal As Numbers  ${int__inner_3_border_s1}  1  precision=0
            #     BuiltIn.Should contain  ${inner_3_border_s}[1]  solid
            #     BuiltIn.Should contain  ${inner_3_border_s}[2]  rgb(0, 0, 0)
            BuiltIn.Should contain  ${inner_3_border}     solid rgb(0, 0, 0)
            BuiltIn.Should contain  ${inner_3_word_wrap}  break-word

Check header paper
    [Arguments]      ${choice_print}  ${test_data}  ${name_sell_1}
    [Documentation]  เช็ค 'ส่วนหัว' ของกระดาษ
    # เช็ค css ส่วนที่ 1
    ${header_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.header_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${header_1__width}=                  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_1},null).getPropertyValue('width');
        ${header_1__display}=                SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_1},null).getPropertyValue('display');
        ${header_1__grid_template_rows}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_1},null).getPropertyValue('grid-template-rows');
        ${header_1__grid_template_columns}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_1},null).getPropertyValue('grid-template-columns');
            BuiltIn.Should contain  ${header_1__width}                  364.609px
            BuiltIn.Should contain  ${header_1__display}                grid
            BuiltIn.Should contain  ${header_1__grid_template_rows}     47.2344px 47.2344px 47.2344px 47.2344px
            BuiltIn.Should contain  ${header_1__grid_template_columns}  72.9219px 72.9219px 72.9219px 72.9219px 72.9219px
    # เช็ค css ส่วนที่ 2
    ${header_2}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.header_2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${header_2__display}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_2},null).getPropertyValue('display');
        ${header_2__font_size}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_2},null).getPropertyValue('font-size');
        ${header_2__text_align}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_2},null).getPropertyValue('text-align');
        ${header_2__align_items}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_2},null).getPropertyValue('align-items');
        ${header_2__border_right}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_2},null).getPropertyValue('border-right');
        ${header_2__border_bottom}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_2},null).getPropertyValue('border-bottom');
        ${header_2__justify_content}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${header_2},null).getPropertyValue('justify-content');
            BuiltIn.Should contain  ${header_2__display}          flex
            BuiltIn.Should contain  ${header_2__font_size}        15px
            BuiltIn.Should contain  ${header_2__text_align}       center
            BuiltIn.Should contain  ${header_2__align_items}      center
            BuiltIn.Should contain  ${header_2__border_right}     1px solid rgb(0, 0, 0)
            BuiltIn.Should contain  ${header_2__border_bottom}    1px solid rgb(0, 0, 0)
            BuiltIn.Should contain  ${header_2__justify_content}  center
                # เช็ค ส่วนประกอบอื่นๆ
                light_portal_sell___list_page.Check header of logo
                light_portal_sell___list_page.Check header of lot           ${test_data ['print_document'] ['sec2']}
                light_portal_sell___list_page.Check header of service       ${choice_print}  ${test_data ['print_document'] ['sec3']}
                light_portal_sell___list_page.Check header of regcode       ${choice_print}
                ${discode_3}=  light_portal_sell___list_page.Check header of discode  ${choice_print}  ${test_data ['print_document'] ['sec5']}
                light_portal_sell___list_page.Check header of route         ${choice_print}  ${test_data ['print_document'] ['sec6']}  ${discode_3}
                light_portal_sell___list_page.Check header of qrcode
                light_portal_sell___list_page.Check header of barcode       ${name_sell_1}
                light_portal_sell___list_page.Check header of consignumber  ${test_data ['print_document'] ['sec9']}

Check sender paper
    [Arguments]      ${choice_print}  ${test_data}
    [Documentation]  เช็ค 'ส่วนผู้ส่ง' ของกระดาษ
    # เช็ค css
    ${sender}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.sender}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${sender__height}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sender},null).getPropertyValue('height');
        ${sender__padding}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sender},null).getPropertyValue('padding');
        ${sender__font_size}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sender},null).getPropertyValue('font-size');
        ${sender__border_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sender},null).getPropertyValue('border-bottom');
            BuiltIn.Should contain  ${sender__height}         98.2656px
            BuiltIn.Should contain  ${sender__padding}        7px
            BuiltIn.Should contain  ${sender__font_size}      11px
            BuiltIn.Should contain  ${sender__border_bottom}  1px solid rgb(0, 0, 0)
                # เช็ค css ส่วน ผู้ส่ง
                ${senders}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.senders}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${sender__margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sender},null).getPropertyValue('margin-bottom');
                        BuiltIn.Should contain  ${sender__margin_bottom}  0px

                IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
                        # เช็ค value ส่วน ผู้ส่ง
                            &{str_senders_text}=    BuiltIn.Create dictionary  **sender**=${test_data ['delivery_service'] ['sender_data'] ['name']}
                            ${xpath_senders_text}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.senders_text}  ${str_senders_text}
                            SeleniumLibrary.Wait until element is visible   ${xpath_senders_text}
                        # เช็ค value ส่วน ผู้รับ เบอร์โทร
                            &{str_recipient_1}=    BuiltIn.Create dictionary  **recipient**=${test_data ['delivery_service'] ['recipient_data'][1] ['name']}  **phone**=${test_data ['delivery_service'] ['recipient_data'][1] ['phone']}
                            ${xpath_recipient_1}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.recipient_1}  ${str_recipient_1}
                            SeleniumLibrary.Wait until element is visible   ${xpath_recipient_1}
                        # เช็ค value ส่วน ที่อยู่
                            &{str_recipient_2}=    BuiltIn.Create dictionary  **address**=${test_data ['delivery_service'] ['recipient_data'][1] ['address']}
                            ${xpath_recipient_2}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.recipient_2}  ${str_recipient_2}
                            SeleniumLibrary.Wait until element is visible   ${xpath_recipient_2}
                ELSE IF  '${choice_print}' == 'ใบแปะกล่องแบบสติ๊กเกอร์'
                            # เช็ค value ส่วน ผู้ส่ง
                                &{str_senders_text}=    BuiltIn.Create dictionary  **sender**=Zortout
                                ${xpath_senders_text}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.senders_text}  ${str_senders_text}
                                SeleniumLibrary.Wait until element is visible   ${xpath_senders_text}
                            # เช็ค value ส่วน ผู้รับ เบอร์โทร
                                &{str_recipient_1}=    BuiltIn.Create dictionary  **recipient**=${test_data ['add_sell'][0] ['contact_data'] ['name']}  **phone**=${test_data ['add_sell'][0] ['contact_data'] ['phone']}
                                ${xpath_recipient_1}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.recipient_1}  ${str_recipient_1}
                                SeleniumLibrary.Wait until element is visible   ${xpath_recipient_1}
                            # เช็ค value ส่วน ที่อยู่
                                &{str_recipient_2}=    BuiltIn.Create dictionary  **address**=${test_data ['add_sell'][0] ['contact_data'] ['address']}
                                ${xpath_recipient_2}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.recipient_2}  ${str_recipient_2}
                                SeleniumLibrary.Wait until element is visible   ${xpath_recipient_2}
                END

Check recipient paper
    [Arguments]      ${choice_print}  ${test_data}
    [Documentation]  เช็ค 'ส่วนผู้รับ' ของกระดาษ
    # เช็ค css
    ${recipient}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.recipient}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${recipient__height}=                 SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient},null).getPropertyValue('height');
        ${recipient__display}=                SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient},null).getPropertyValue('display');
        ${recipient__padding}=                SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient},null).getPropertyValue('padding');
        ${recipient__font_size}=              SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient},null).getPropertyValue('font-size');
        ${recipient__border_bottom}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient},null).getPropertyValue('border-bottom');
        ${recipient__grid_template_columns}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient},null).getPropertyValue('grid-template-columns');
            BuiltIn.Should contain  ${recipient__height}                 45.3438px
            BuiltIn.Should contain  ${recipient__display}                grid
            BuiltIn.Should contain  ${recipient__padding}                7px
            BuiltIn.Should contain  ${recipient__font_size}              11px
            BuiltIn.Should contain  ${recipient__border_bottom}          1px solid rgb(0, 0, 0)
            BuiltIn.Should contain  ${recipient__grid_template_columns}  175.297px 175.312px

                IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
                        # เช็ค value ส่วน ตำบล
                            ${recipient_left_1}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_left_1}
                            BuiltIn.Should contain  ${recipient_left_1}  ตําบล: ${test_data ['delivery_service'] ['recipient_data'][1] ['subdistrict']}
                        # เช็ค value ส่วน จังหวัด
                            ${recipient_left_2}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_left_2}
                            BuiltIn.Should contain  ${recipient_left_2}  จังหวัด: ${test_data ['delivery_service'] ['recipient_data'][1] ['province']}
                        # เช็ค css ส่วน ตำบล
                        ${recipient_left_1_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.recipient_left_1_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                            ${recipient_left_1_1__font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_left_1_1},null).getPropertyValue('font-size');
                            ${recipient_left_1_1__font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_left_1_1},null).getPropertyValue('font-weight');
                            ${recipient_left_1_1__line_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_left_1_1},null).getPropertyValue('line-height');
                                BuiltIn.Should contain  ${recipient_left_1_1__font_size}    13px
                                BuiltIn.Should contain  ${recipient_left_1_1__font_weight}  700
                                BuiltIn.Should contain  ${recipient_left_1_1__line_height}  1
                        # เช็ค value ส่วน อำเภอ
                            ${recipient_right_1}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_right_1}
                            BuiltIn.Should contain  ${recipient_right_1}  อำเภอ: ${test_data ['delivery_service'] ['recipient_data'][1] ['district']}
                        # เช็ค value ส่วน รหัสไปรษณีย์
                            ${recipient_right_2}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_right_2}
                            BuiltIn.Should contain  ${recipient_right_2}  รหัสไปรษณีย์: ${test_data ['delivery_service'] ['recipient_data'][1] ['zipcode']}
                        # เช็ค css ส่วน รหัสไปรษณีย์
                        ${recipient_right_2_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.recipient_right_2_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                            ${recipient_right_2_1__font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_right_2_1},null).getPropertyValue('font-size');
                            ${recipient_right_2_1__font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_right_2_1},null).getPropertyValue('font-weight');
                            ${recipient_right_2_1__line_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_right_2_1},null).getPropertyValue('line-height');
                                BuiltIn.Should contain  ${recipient_right_2_1__font_size}    13px
                                BuiltIn.Should contain  ${recipient_right_2_1__font_weight}  700
                                BuiltIn.Should contain  ${recipient_right_2_1__line_height}  1
                ELSE IF  '${choice_print}' == 'ใบแปะกล่องแบบสติ๊กเกอร์'
                            # เช็ค value ส่วน ตำบล
                            ${recipient_left_1}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_left_1}
                            BuiltIn.Should contain  ${recipient_left_1}  ตําบล: 
                            # เช็ค value ส่วน จังหวัด
                                ${recipient_left_2}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_left_2}
                                BuiltIn.Should contain  ${recipient_left_2}  จังหวัด: 
                            # เช็ค css ส่วน ตำบล
                            ${recipient_left_1_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.recipient_left_1_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                                ${recipient_left_1_1__font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_left_1_1},null).getPropertyValue('font-size');
                                ${recipient_left_1_1__font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_left_1_1},null).getPropertyValue('font-weight');
                                ${recipient_left_1_1__line_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_left_1_1},null).getPropertyValue('line-height');
                                    BuiltIn.Should contain  ${recipient_left_1_1__font_size}    13px
                                    BuiltIn.Should contain  ${recipient_left_1_1__font_weight}  700
                                    BuiltIn.Should contain  ${recipient_left_1_1__line_height}  1
                            # เช็ค value ส่วน อำเภอ
                                ${recipient_right_1}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_right_1}
                                BuiltIn.Should contain  ${recipient_right_1}  อำเภอ: 
                            # เช็ค value ส่วน รหัสไปรษณีย์
                                ${recipient_right_2}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.recipient_right_2}
                                BuiltIn.Should contain  ${recipient_right_2}  รหัสไปรษณีย์: 
                            # เช็ค css ส่วน รหัสไปรษณีย์
                            ${recipient_right_2_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.recipient_right_2_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                                ${recipient_right_2_1__font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_right_2_1},null).getPropertyValue('font-size');
                                ${recipient_right_2_1__font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_right_2_1},null).getPropertyValue('font-weight');
                                ${recipient_right_2_1__line_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${recipient_right_2_1},null).getPropertyValue('line-height');
                                    BuiltIn.Should contain  ${recipient_right_2_1__font_size}    13px
                                    BuiltIn.Should contain  ${recipient_right_2_1__font_weight}  700
                                    BuiltIn.Should contain  ${recipient_right_2_1__line_height}  1
                END

Check sortation paper
    [Arguments]      ${choice_print}  ${test_data}
    [Documentation]  เช็ค 'ส่วนลำดับรายการ' ของกระดาษ
    # เช็ค css
    ${sortation}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.sortation}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${sortation__height}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sortation},null).getPropertyValue('height');
        ${sortation__font_size}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sortation},null).getPropertyValue('font-size');
        ${sortation__text_align}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sortation},null).getPropertyValue('text-align');
        ${sortation__font_weight}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sortation},null).getPropertyValue('font-weight');
        ${sortation__border_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${sortation},null).getPropertyValue('border-bottom');
            BuiltIn.Should contain  ${sortation__height}         45.3438px
            BuiltIn.Should contain  ${sortation__font_size}      32px
            BuiltIn.Should contain  ${sortation__text_align}     center
            BuiltIn.Should contain  ${sortation__font_weight}    700
            BuiltIn.Should contain  ${sortation__border_bottom}  1px solid rgb(0, 0, 0)
    IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
            # เช็ค value
                ${sortation_text}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.sortation}
                BuiltIn.Should contain  ${sortation_text}  ${test_data ['print_document'] ['sec12']}
    END

Check order paper
    [Documentation]  เช็ค 'ส่วนลิสรายการ' ของกระดาษ
    # เช็ค css ส่วนที่ 1
    ${order}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.order}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${order__font_size}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order},null).getPropertyValue('font-size');
            BuiltIn.Should contain  ${order__font_size}  10px
    # เช็ค css ส่วนที่ 2
    ${order_header}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.order_header}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${order_header__display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_header},null).getPropertyValue('display');
        ${order_header__border_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_header},null).getPropertyValue('border-bottom');
            BuiltIn.Should contain  ${order_header__display}        flex
            BuiltIn.Should contain  ${order_header__border_bottom}  1px solid rgb(0, 0, 0)
    # เช็ค css ส่วน ลำดับ
    ${order_left}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.order_left}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${order_left__width}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_left},null).getPropertyValue('width');
        ${order_left__padding}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_left},null).getPropertyValue('padding');
        ${order_left__text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_left},null).getPropertyValue('text-align');
        ${order_left__line_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_left},null).getPropertyValue('line-height');
            BuiltIn.Should contain  ${order_left__width}        36.625px
            BuiltIn.Should contain  ${order_left__padding}      3px
            BuiltIn.Should contain  ${order_left__text_align}   right
            BuiltIn.Should contain  ${order_left__line_height}  1
    # เช็ค css ส่วน รายการ
    ${order_right}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.order_right}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${order_right__width}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_right},null).getPropertyValue('width');
        ${order_right__padding}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_right},null).getPropertyValue('padding');
        ${order_right__line_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${order_right},null).getPropertyValue('line-height');
            BuiltIn.Should contain  ${order_left__width}        36.625px
            BuiltIn.Should contain  ${order_left__padding}      3px
            BuiltIn.Should contain  ${order_left__line_height}  1

Check header of logo
    [Documentation]  เช็คส่วน 'logo'
    # เช็ค css ส่วนที่ 1
    ${logo_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.logo_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${logo_1__grid_area}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${logo_1},null).getPropertyValue('grid-area');
            BuiltIn.Should contain  ${logo_1__grid_area}  1 / 1 / 2 / 3
    # เช็ค css ส่วนที่ 2
    ${logo_2}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.logo_2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${logo_2__border}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${logo_2},null).getPropertyValue('border');
        ${logo_2__padding}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${logo_2},null).getPropertyValue('padding');
        ${logo_2__vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${logo_2},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${logo_2__border}          0
            BuiltIn.Should contain  ${logo_2__padding}         0
            BuiltIn.Should contain  ${logo_2__vertical_align}  middle

Check header of lot
    [Arguments]      ${sec2}
    [Documentation]  เช็คส่วน 'lot'
    # เช็ค value
    &{str_lot}=    BuiltIn.Create dictionary  **lot**=${sec2}
    ${xpath_lot}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.lot}  ${str_lot}
        SeleniumLibrary.Wait until element is visible   ${xpath_lot}
    # เช็ค css
    ${lot}=  BuiltIn.Set variable  document.evaluate("${xpath_lot}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${logo__grid_area}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${lot},null).getPropertyValue('grid-area');
        ${logo__font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${lot},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${logo__grid_area}    1 / 3 / 2 / 4
            BuiltIn.Should contain  ${logo__font_weight}  700

Check header of service
    [Arguments]      ${choice_print}  ${sec3}
    [Documentation]  เช็ค 'service'
    # เช็ค css
    ${service_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.service_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${service_1__grid_area}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${service_1},null).getPropertyValue('grid-area');
        ${service_1__line_height}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${service_1},null).getPropertyValue('line-height');
        ${service_1__font_weight}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${service_1},null).getPropertyValue('font-weight');
        ${service_1__border_right}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${service_1},null).getPropertyValue('border-right');
        ${service_1__flex_direction}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${service_1},null).getPropertyValue('flex-direction');
            BuiltIn.Should contain  ${service_1__grid_area}       1 / 4 / 2 / 6
            BuiltIn.Should contain  ${service_1__line_height}     16.5px
            BuiltIn.Should contain  ${service_1__font_weight}     700
            BuiltIn.Should contain  ${service_1__border_right}    0px none rgb(62, 62, 62)
            BuiltIn.Should contain  ${service_1__flex_direction}  column
    # เช็ค toppic
    &{str_service}=    BuiltIn.Create dictionary  **service**=${sec3}
    ${xpath_service}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.service_2}  ${str_service}
        SeleniumLibrary.Wait until element is visible   ${xpath_service}
    # เช็ค value
    IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
            ${service_3}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.service_3}
                String.Should be upper case  ${service_3}
            ${length}=  BuiltIn.Get length  ${service_3}
                BuiltIn.Should be equal as integers  ${length}  2
    END

Check header of regcode
    [Arguments]      ${choice_print}
    [Documentation]  เช็ค 'regcode'
    # เช็ค css
    ${regcode_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.regcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${regcode__grid_area}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${regcode_1},null).getPropertyValue('grid-area');
        ${regcode__font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${regcode_1},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${regcode__grid_area}    2 / 1 / 3 / 2
            BuiltIn.Should contain  ${regcode__font_weight}  700
    # เช็ค value
    IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
            ${regcode_2}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.regcode}
                String.Should be upper case  ${regcode_2}
            ${length}=  BuiltIn.Get length  ${regcode_2}
                BuiltIn.Should be equal as integers  ${length}  1
    END

Check header of discode
    [Arguments]      ${choice_print}  ${sec5}
    [Documentation]  เช็ค 'discode'
    # เช็ค css
    ${discode_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.discode_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${discode_1__grid_area}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${discode_1},null).getPropertyValue('grid-area');
        ${discode_1__line_height}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${discode_1},null).getPropertyValue('line-height');
        ${discode_1__font_weight}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${discode_1},null).getPropertyValue('font-weight');
        ${discode_1__flex_direction}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${discode_1},null).getPropertyValue('flex-direction');
            BuiltIn.Should contain  ${discode_1__grid_area}       2 / 2 / 3 / 3
            BuiltIn.Should contain  ${discode_1__line_height}     16.5px
            BuiltIn.Should contain  ${discode_1__font_weight}     700
            BuiltIn.Should contain  ${discode_1__flex_direction}  column
    # เช็ค toppic
        &{str_discode}=    BuiltIn.Create dictionary  **discode**=${sec5}
        ${xpath_discode}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.discode_2}  ${str_discode}
        SeleniumLibrary.Wait until element is visible   ${xpath_discode}
    # เช็ค value
        ${discode_3}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.discode_3}
    IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
            String.Should be upper case  ${discode_3}
            ${length}=  BuiltIn.Get length  ${discode_3}
            BuiltIn.Should be equal as integers  ${length}  3
    END
    [Return]  ${discode_3}

Check header of route
    [Arguments]      ${choice_print}  ${sec6}  ${discode_3}
    [Documentation]  เช็ค 'route'
    # เช็ค css
    ${route_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.route_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${route_1__grid_area}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${route_1},null).getPropertyValue('grid-area');
        ${route_1__line_height}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${route_1},null).getPropertyValue('line-height');
        ${route_1__font_weight}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${route_1},null).getPropertyValue('font-weight');
        ${route_1__flex_direction}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${route_1},null).getPropertyValue('flex-direction');
            BuiltIn.Should contain  ${route_1__grid_area}       2 / 3 / 3 / 4
            BuiltIn.Should contain  ${route_1__line_height}     16.5px
            BuiltIn.Should contain  ${route_1__font_weight}     700
            BuiltIn.Should contain  ${route_1__flex_direction}  column
    # เช็ค toppic
    &{str_route_2}=    BuiltIn.Create dictionary  **route**=${sec6}[0]
    ${xpath_route_2}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.route_2}  ${str_route_2}
        SeleniumLibrary.Wait until element is visible   ${xpath_route_2}
    # เช็ค value
    IF  '${choice_print}' == 'ส่งสินค้าแบบรวมรายการ'
            ${route_3}=        BuiltIn.Set Variable  ${discode_3}${sec6}[1]
            &{str_route_3}=    BuiltIn.Create dictionary  **route**=${route_3}
            ${xpath_route_3}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.route_3}  ${str_route_3}
                SeleniumLibrary.Wait until element is visible   ${xpath_route_3}
    END

Check header of qrcode
    [Documentation]  เช็ค 'qrcode'
    # เช็ค css ส่วนที่ 1
    ${qrcode_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.qrcode_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${qrcode_1__grid_area}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_1},null).getPropertyValue('grid-area');
        ${qrcode_1__border_right}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_1},null).getPropertyValue('border-right');
            BuiltIn.Should contain  ${qrcode_1__grid_area}     2 / 4 / 5 / 6
            BuiltIn.Should contain  ${qrcode_1__border_right}  0px none rgb(62, 62, 62)
    # เช็ค css ส่วนที่ 2
    ${qrcode_2}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.qrcode_2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${qrcode_2__width}=           SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_2},null).getPropertyValue('width');
        ${qrcode_2__height}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_2},null).getPropertyValue('height');
        ${qrcode_2__display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_2},null).getPropertyValue('display');
        ${qrcode_2__vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_2},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${qrcode_2__width}           135px
            BuiltIn.Should contain  ${qrcode_2__height}          auto
            BuiltIn.Should contain  ${qrcode_2__display}         none
            BuiltIn.Should contain  ${qrcode_2__vertical_align}  baseline
    # เช็ค css ส่วนที่ 3
    ${qrcode_3}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.qrcode_3}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${qrcode_3__width}=           SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_3},null).getPropertyValue('width');
        ${qrcode_3__height}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_3},null).getPropertyValue('height');
        ${qrcode_3__border}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_3},null).getPropertyValue('border');
        ${qrcode_3__display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_3},null).getPropertyValue('display');
        ${qrcode_3__padding}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_3},null).getPropertyValue('padding');
        ${qrcode_3__vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode_3},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${qrcode_3__width}           135px
            BuiltIn.Should contain  ${qrcode_3__height}          135px
            BuiltIn.Should contain  ${qrcode_3__border}          0
            BuiltIn.Should contain  ${qrcode_3__display}         block
            BuiltIn.Should contain  ${qrcode_3__padding}         0
            BuiltIn.Should contain  ${qrcode_3__vertical_align}  middle

Check header of barcode
    [Arguments]      ${name_sell_1}
    [Documentation]  เช็ค 'barcode'
    # เช็ค css ส่วนที่ 1
    ${barcode_1}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.barcode_1}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${barcode_1__padding}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_1},null).getPropertyValue('padding');
        ${barcode_1__grid_area}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_1},null).getPropertyValue('grid-area');
            BuiltIn.Should contain  ${barcode_1__padding}      5px
            BuiltIn.Should contain  ${barcode_1__grid_area}    3 / 1 / 4 / 4
    # เช็ค css ส่วนที่ 2
    ${barcode_2}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.barcode_2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${barcode_2__color}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('color');
        ${barcode_2__display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('display');
        ${barcode_2__font_size}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('font-size');
        ${barcode_2__max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('max-width');
        ${barcode_2__text_align}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('text-align');
        ${barcode_2__font_weight}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('font-weight');
        ${barcode_2__font_family}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('font-family');
        ${barcode_2__margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_2},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${barcode_2__color}          rgb(62, 62, 62)
            BuiltIn.Should contain  ${barcode_2__display}        inline-block
            BuiltIn.Should contain  ${barcode_2__font_size}      14px
            BuiltIn.Should contain  ${barcode_2__max_width}      100%
            BuiltIn.Should contain  ${barcode_2__text_align}     center
            BuiltIn.Should contain  ${barcode_2__font_weight}    500
            BuiltIn.Should contain  ${barcode_2__font_family}    boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${barcode_2__margin_bottom}  4px
    # เช็ค css ส่วนที่ 3
    &{str_barcode_3}=    BuiltIn.Create dictionary  **name**=${name_sell_1}
    ${xpath_barcode_3}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.barcode_3}  ${str_barcode_3}
        SeleniumLibrary.Wait until element is visible   ${xpath_barcode_3}
    ${barcode_3}=  BuiltIn.Set variable  document.evaluate("${xpath_barcode_3}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${barcode_3__border}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_3},null).getPropertyValue('border');
        ${barcode_3__padding}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_3},null).getPropertyValue('padding');
        ${barcode_3__max_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_3},null).getPropertyValue('max-width');
        ${barcode_3__vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_3},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${barcode_3__border}          0
            BuiltIn.Should contain  ${barcode_3__padding}         0
            BuiltIn.Should contain  ${barcode_3__max_width}       75%
            BuiltIn.Should contain  ${barcode_3__vertical_align}  middle
    # เช็ค css ส่วนที่ 4
    &{str_barcode_4}=    BuiltIn.Create dictionary  **name**=${name_sell_1}
    ${xpath_barcode_4}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list_page___print_doc__text.barcode_4}  ${str_barcode_4}
        SeleniumLibrary.Wait until element is visible   ${xpath_barcode_4}
    ${barcode_4}=  BuiltIn.Set variable  document.evaluate("${xpath_barcode_4}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${barcode_4__font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_4},null).getPropertyValue('font-size');
        ${barcode_4__text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcode_4},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${barcode_4__font_size}   10px
            BuiltIn.Should contain  ${barcode_4__text_align}  center

Check header of consignumber
    [Arguments]      ${sec9}
    [Documentation]  เช็ค 'consignumber'
    # เช็ค css
    ${consignumber}=  BuiltIn.Set variable  document.evaluate("${light_portal_sell_list_page___print_doc__text.consignumber}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${consignumber__grid_area}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${consignumber},null).getPropertyValue('grid-area');
        ${consignumber__font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${consignumber},null).getPropertyValue('font-size');
        ${consignumber__font_weight}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${consignumber},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${consignumber__grid_area}    4 / 1 / 5 / 4
            BuiltIn.Should contain  ${consignumber__font_size}    24px
            BuiltIn.Should contain  ${consignumber__font_weight}  700
    # เช็ค value
    ${consignumber_text}=  SeleniumLibrary.Get text  ${light_portal_sell_list_page___print_doc__text.consignumber}
        String.Should be upper case  ${consignumber_text}
        BuiltIn.Should start with    ${consignumber_text}  ${sec9}

# --- Verify --------->

Check delete sell list
    [Documentation]  เช็ค 'การลบรายการ'
        SeleniumLibrary.Wait until element is visible  ${light_portal_sell_list___table__text.not_found}

# --- Verify list --------->

Check column cre date
    [Arguments]      ${date}
    [Documentation]  เช็คข้อมูล คอลัมน์ 'วันที่'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${date}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.create_date}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check column name
    [Arguments]      ${name}
    [Documentation]  เช็คข้อมูล คอลัมน์ 'รายการ'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${name}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.name}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check column contact
    [Arguments]      ${contact}
    [Documentation]  เช็คข้อมูล คอลัมน์ 'ลูกค้า'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${contact}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.contact}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check column funnel
    [Arguments]      ${funnel}
    [Documentation]  เช็คข้อมูล คอลัมน์ 'ช่องทาง'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${funnel}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.funnel}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check column deli date
    [Documentation]  เช็คข้อมูล คอลัมน์ 'วันส่งสินค้า'
        SeleniumLibrary.Wait until element is visible  ${light_portal_sell_list___table__text.delivery_status}

Check column price
    [Arguments]      ${price}
    [Documentation]  เช็คข้อมูล คอลัมน์ 'มูลค่า'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${price}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.price}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check column status payment
    [Arguments]      ${status_payment}
    [Documentation]  เช็คข้อมูล คอลัมน์ 'สถานะชำระ'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${status_payment}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.payment_status}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check column status transfer
    [Arguments]      ${status_transfer}
    [Documentation]  เช็คข้อมูล คอลัมน์ 'สถานะโอน'
        Log  [เช็คสถานะ]
        &{str_status}=  BuiltIn.Create dictionary  **data**=${status_transfer[0]}
        ${xpath_status}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.transfer_status}  ${str_status}
        SeleniumLibrary.Wait until element is visible  ${xpath_status}
        Log  [เช็คคลังสินค้า]
        &{str_store}=  BuiltIn.Create dictionary  **data**=${status_transfer[1]}
        ${xpath_store}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.transfer_store}  ${str_store}
        SeleniumLibrary.Wait until element is visible  ${xpath_store}

Check nomall toppic
    [Arguments]      ${toppic_doc}
    [Documentation]  เช็คข้อมูล 'หัวเรื่อง'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${toppic_doc}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___print_doc___text.toppic_nomall}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check invoice toppic
    [Arguments]      ${toppic_doc}
    [Documentation]  เช็คข้อมูล 'หัวเรื่อง'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${toppic_doc}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___print_doc___text.toppic_invoice}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check expire date column payment
    [Arguments]      ${sell_name}
    [Documentation]  เช็ควันหมดอายุ คอลัมน์ 'สถานะชำระ'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${sell_name}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.expire_payment}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}

Check expire date column transfer
    [Arguments]      ${sell_name}
    [Documentation]  เช็ควันหมดอายุ คอลัมน์ 'สถานะโอน'
        &{str_replace}=  BuiltIn.Create dictionary  **data**=${sell_name}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_sell_list___table__text.expire_transfer}  ${str_replace}
        SeleniumLibrary.Wait until element is visible  ${new_xpath}