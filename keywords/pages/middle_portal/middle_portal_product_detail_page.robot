*** Variables ***
&{xpt_detail_text}          qrcode=//span[@id='qrcodeproduct']/canvas[@width='256' and @height='256']
...                         barcode=//label[@class='text-center']/img[@class='barcode']
...                         code=//label[@class='text-center']/div[text()='**code**']
&{xpt_detail_button}        edit=//span[text()='แก้ไข']
...                         print=//span[text()='พิมพ์เอกสาร']
...                         type_print=//label[text()='ประเภท']/ancestor::div[@class='row']//label[text()='**type**']/../..//input
...                         format_print=//label[text()='รูปแบบ']/ancestor::div[@class='row']//label[text()='**format**']/../..//input
...                         confirm_print=//div[@class='modal-header']//h3[contains(text(),'พิมพ์เอกสาร')]/ancestor::div[@class='modal-content']//div[@class='modal-footer ']/button[text()='พิมพ์เอกสาร']
...                         setting=//label[text()='กำหนดจำนวนบาร์โค้ด']

&{xpt_detail_print_input}   amount=//div[@id='barcodetable']//tbody//input[@id='barcodenumber0']


*** Keywords ***
Click order for edit
    [Documentation]  คลิกปุ่ม 'คำสั่ง แก้ไข'
    SeleniumLibrary.Click element  ${xpt_detail_button.edit}
    common_keywords_middle_portal.Wait for jquery loading completed
    common_keywords_middle_portal.Scroll to header of page

Click order for print barcode
    [Documentation]  คลิกปุ่ม 'คำสั่ง พิมพ์เอกสาร'
    SeleniumLibrary.Click element  ${xpt_detail_button.print}
    common_keywords_middle_portal.Wait for jquery loading completed

Click confirm print barcode
    [Documentation]  คลิกปุ่ม 'พิมพ์เอกสาร'
    SeleniumLibrary.Click element  ${xpt_detail_button.confirm_print}
    common_keywords_middle_portal.Wait for jquery loading completed

Select type print barcode
    [Arguments]      ${type}
    [Documentation]  เลือก 'ประเภท'
    &{str_replace}=  BuiltIn.Create dictionary  **type**=${type}
    ${new_xpath}=    common_keywords_middle_portal.Auto keyword replace string  ${xpt_detail_button.type_print}  ${str_replace}
    SeleniumLibrary.Click element  ${new_xpath}

Select format print barcode
    [Arguments]      ${format}  ${amount}
    [Documentation]  เลือก 'รูปแบบ'
    &{str_replace}=  BuiltIn.Create dictionary  **format**=${format}
    ${new_xpath}=    common_keywords_middle_portal.Auto keyword replace string  ${xpt_detail_button.format_print}  ${str_replace}
    SeleniumLibrary.Click element  ${new_xpath}
    IF  '${format}' == 'บาร์โค้ด 2 คอลัมน์ (A4)'
        SeleniumLibrary.Click element  ${xpt_detail_button.setting}
        SeleniumLibrary.Input text     ${xpt_detail_print_input.amount}  ${amount}
    ELSE IF  '${format}' == 'บาร์โค้ด 3 คอลัมน์ (A4)'
        SeleniumLibrary.Click element  ${xpt_detail_button.setting}
        SeleniumLibrary.Input text     ${xpt_detail_print_input.amount}  ${amount}
    ELSE IF  '${format}' == 'บาร์โค้ด 1 คอลัมน์ (สติ๊กเกอร์ 5x3 ซม.)'
        SeleniumLibrary.Click element  ${xpt_detail_button.setting}
        SeleniumLibrary.Input text     ${xpt_detail_print_input.amount}  ${amount}
    ELSE IF  '${format}' == 'บาร์โค้ด 3 คอลัมน์ (สติ๊กเกอร์)'
        SeleniumLibrary.Click element  ${xpt_detail_button.setting}
        SeleniumLibrary.Input text     ${xpt_detail_print_input.amount}  ${amount}
    END

Check qrcode
    [Documentation]  เช็คการแสดง 'คิวอาร์โค้ด'
    SeleniumLibrary.Wait until element is visible  ${xpt_detail_text.qrcode}

Check is not qrcode
    [Documentation]  เช็คไม่แสดง 'คิวอาร์โค้ด'
    SeleniumLibrary.Wait until element is not visible  ${xpt_detail_text.qrcode}

Check barcode
    [Arguments]      ${code}
    [Documentation]  เช็คการแสดง 'บาร์โค้ด'
    SeleniumLibrary.Wait until element is visible  ${xpt_detail_text.barcode}
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${xpath}=  common_keywords_middle_portal.Auto keyword replace string  ${xpt_detail_text.code}  ${str_replace}
    SeleniumLibrary.Wait until element is visible  ${xpath}

Check is not barcode
    [Arguments]      ${code}
    [Documentation]  เช็คไม่แสดง 'บาร์โค้ด'
    SeleniumLibrary.Wait until element is not visible  ${xpt_detail_text.barcode}
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${xpath}=  common_keywords_middle_portal.Auto keyword replace string  ${xpt_detail_text.code}  ${str_replace}
    SeleniumLibrary.Wait until element is not visible  ${xpath}

Check print case nomall bc
    [Arguments]      ${code}  ${bc_nomall}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'บาร์โค้ดทั่วไป'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='fullproductview ']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       1024px
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px 104.667px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('page-break-inside');
        ${inner_border_collapse}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('border-collapse');
        ${inner_border_spacing}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('border-spacing');
        ${inner_background_color}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('background-color');
            BuiltIn.Should contain  ${inner_page_break_inside}  auto
            BuiltIn.Should contain  ${inner_border_collapse}    separate
            BuiltIn.Should contain  ${inner_border_spacing}     0
            BuiltIn.Should contain  ${inner_background_color}   rgba(0, 0, 0, 0)

    # เช็คส่วนของ : รูป
    ${image}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[1]//table[@width='100%']//table[@cellpadding='10']/tbody/tr/td[1]/img[@width='120']
        SeleniumLibrary.Wait until element is visible  ${image}

    # เช็คส่วนของ : ชื่อ
    ${names}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[1]//table[@width='100%']//table[@cellpadding='10']/tbody/tr/td[2]//b[text()='**name**']
        &{str_replace_name}=  BuiltIn.Create dictionary  **name**=${bc_nomall ['name']}
        ${xpath_name}=  common_keywords_middle_portal.Auto keyword replace string  ${names}  ${str_replace_name}
        SeleniumLibrary.Wait until element is visible  ${xpath_name}

    # เช็คส่วนของ : หัวข้อรายละเอียด
    ${toppic_description}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[3]/td/table[@cellspacing='10']/tbody/tr/td[@valign='top' and @align='right'][1]/b/big[text()='รายละเอียด:']
        SeleniumLibrary.Wait until element is visible  ${toppic_description}

    # เช็คส่วนของ : ข้อมูลรายละเอียด
    ${data_description}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[3]/td/table[@cellspacing='10']/tbody/tr/td[@valign='top'][2]/big[text()='**des**']
        &{str_replace_description}=  BuiltIn.Create dictionary  **des**=${bc_nomall ['description']}
        ${xpath_description}=  common_keywords_middle_portal.Auto keyword replace string  ${data_description}  ${str_replace_description}
        SeleniumLibrary.Wait until element is visible  ${xpath_description}

    # เช็คส่วนของ : ราคา
    ${price}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][1]/span[@class='priceview']/big/big/big/b[text()='**price** บาท']
        &{str_replace_price}=  BuiltIn.Create dictionary  **price**=${bc_nomall ['selling']}
        ${xpath_price}=  common_keywords_middle_portal.Auto keyword replace string  ${price}  ${str_replace_price}
        SeleniumLibrary.Wait until element is visible  ${xpath_price}

    # เช็คส่วนของ : โค้ด
    ${codes}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][2]/span[text()='**code**'][1]
        &{str_replace_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_code}=  common_keywords_middle_portal.Auto keyword replace string  ${codes}  ${str_replace_code}
        SeleniumLibrary.Wait until element is visible  ${xpath_code}

    # เช็คส่วนของ : แท็บบาร์โค้ด
    ${section_tap_barcode}=  BuiltIn.Set variable  document.evaluate("(//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][2]/span[2]/label[@class='text-center']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${tap_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_tap_barcode},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${tap_text_align}  center
    ${tap_barcode_product}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][2]/span[2]/label[@class='text-center']/*[name()='svg']/*[name()='g' and @transform='translate(0, 0)']
        SeleniumLibrary.Wait until element is visible  ${tap_barcode_product}

    # เช็คส่วนของ : โค้ดบาร์โค้ด
    ${section_code_barcode}=  BuiltIn.Set variable  document.evaluate("(//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][2]/span[2]/label[@class='text-center']/div[@class='text-center']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${code_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_code_barcode},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${code_text_align}  center
    ${code_barcode_product}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][2]/span[2]/label[@class='text-center']/div[@class='text-center' and text()='**code**']
        &{str_replace_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${code_barcode_product}  ${str_replace_code_barcode}
        SeleniumLibrary.Wait until element is visible  ${xpath_code_barcode}

    # เช็คเส้นคั่นที่ 1
    ${middle_line_1}=  BuiltIn.Set variable  document.evaluate("(//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[2]/td//hr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${margin_top_1}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_1},null).getPropertyValue('margin-top');
        ${margin_bottom_1}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_1},null).getPropertyValue('margin-bottom');
        ${border_top_1}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_1},null).getPropertyValue('border-top');
            BuiltIn.Should contain  ${margin_top_1}     20px
            BuiltIn.Should contain  ${margin_bottom_1}  20px
            BuiltIn.Should contain  ${border_top_1}     0.666667px solid rgb(238, 238, 238)

    # เช็คเส้นคั่นที่ 2
    ${middle_line_2}=  BuiltIn.Set variable  document.evaluate("(//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[4]/td/hr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${margin_top_2}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_2},null).getPropertyValue('margin-top');
        ${margin_bottom_2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_2},null).getPropertyValue('margin-bottom');
        ${border_top_2}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_2},null).getPropertyValue('border-top');
            BuiltIn.Should contain  ${margin_top_2}     20px
            BuiltIn.Should contain  ${margin_bottom_2}  20px
            BuiltIn.Should contain  ${border_top_2}     0.666667px solid rgb(238, 238, 238)

    # เช็คเส้นคั่นท้าย
    ${abutment_line_0}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='fullproductview ']/hr[@class='fullproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${border_top_0}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${abutment_line_0},null).getPropertyValue('border-top');
        ${margin_top_0}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${abutment_line_0},null).getPropertyValue('margin-top');
        ${margin_bottom_0}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${abutment_line_0},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${border_top_0}     0.666667px dotted rgb(0, 0, 0)
            BuiltIn.Should contain  ${margin_top_0}     20px
            BuiltIn.Should contain  ${margin_bottom_0}  20px

Check print case catalog bc
    [Arguments]      ${code}  ${bc_catalog}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'บาร์โค้ดแค็ตตาล็อก'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_font_size}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       1024px
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px 104.667px
            BuiltIn.Should contain  ${outer_font_size}   20px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_sec1_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_sec1_page_break_inside}  auto

    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_sec2_page_break_after}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
        ${inner_sec2_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_sec2_page_break_after}   auto
            BuiltIn.Should contain  ${inner_sec2_page_break_inside}  avoid

    # เช็ค 1 แถวต้องมี 1 บาร์โค้ด ขนาด 1:3
    ${section_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_padding}   4px 4px 1px
        ${section_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-width');
        ${section_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-color');
        ${section_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-style');
        ${section_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-width');
        ${section_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_border_bottom_width}   0.666667px
            BuiltIn.Should contain  ${section_1_border_bottom_color}   rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_border_bottom_style}   dashed
            BuiltIn.Should contain  ${section_1_border_right_width}    0.666667px
            BuiltIn.Should contain  ${section_1_border_right_style}    dashed

    ${section_2}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[2]
        SeleniumLibrary.Wait until element is visible  ${section_2}

    ${section_3}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[3]
        SeleniumLibrary.Wait until element is visible  ${section_3}

    # เช็คส่วนของ : รูป
    ${section_1_image}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[1]/td[1][@width='120' and @align='center' and @valign='top']/img[@width='120']
        SeleniumLibrary.Wait until element is visible  ${section_1_image}

    # เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[1]/td[2][@align='left' and @valign='top']/span[1][@class='nameview' and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${bc_catalog ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}

    # เช็คส่วนของ : โค้ด
    ${section_1_code}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[1]/td[2][@align='left' and @valign='top']/span[2][@class='codeview' and text()='**code**' and br]
        &{replace_section_1_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_1_code}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code}  ${replace_section_1_code}
        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code}

    # เช็คส่วนของ : ราคา
    ${section_1_price}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[1]/td[2][@align='left' and @valign='top']/span[3][@class='priceview' and text()='**price** บาท' and br]
        &{replace_section_1_price}=  BuiltIn.Create dictionary  **price**=${bc_catalog ['selling']}
        ${xpath_section_1_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_price}  ${replace_section_1_price}
        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_price}

    # เช็คส่วนของ : บาร์โค้ด
    ${section_1_barcode}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[2]/td[@align='center' and @valign='middle' and @colspan='2']/span[@class='barcodeview']/label[@class='text-center']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcode},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${section_1_text_align}  center
                # แท็บบาร์โค้ด
                ${section_1_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[2]/td[@align='center' and @valign='middle' and @colspan='2']/span[@class='barcodeview']/label[@class='text-center']/*[name()='svg' and @class='barcode' and @data-value='**code**']
                &{replace_section_1_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                ${xpath_section_1_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_tab_barcode}  ${replace_section_1_tab_barcode}
                    SeleniumLibrary.Wait until element is visible  ${xpath_section_1_tab_barcode}
                ${section_1_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_1_max_width}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('max-width');
                    ${section_1_background}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${section_1_max_width}   100%
                        BuiltIn.Should contain  ${section_1_background}  rgb(255, 255, 255)
                # โค้ดบาร์โค้ด
                ${section_1_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[2]/td[@align='center' and @valign='middle' and @colspan='2']/span[@class='barcodeview']/label[@class='text-center']/div[@class='text-center' and text()='**code**']
                &{replace_section_1_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                ${xpath_section_1_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code_barcode}  ${replace_section_1_code_barcode}
                    SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code_barcode}
                ${section_1_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_1_barcode_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${section_1_barcode_text_align}  center

Check print case 2column a4 bc
    [Arguments]      ${code}  ${bc_2column}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'บาร์โค้ด 2 คอลัมน์ (A4)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
            BuiltIn.Should contain  ${outer_font_size}   20px
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       1024px
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px 104.667px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_page_break_inside_sec1}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_page_break_inside_sec1}  auto

    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_page_break_after_sec2}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
        ${inner_page_break_inside_sec2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_page_break_after_sec2}   auto
            BuiltIn.Should contain  ${inner_page_break_inside_sec2}  avoid

    # (ส่วนที่ 1) เช็ค 1 แถวมี 2 บาร์โค้ด a4 ขนาด 1:2
    ${section_1_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_1_padding}  4px 4px 1px
        ${section_1_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-bottom-width');
        ${section_1_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-bottom-color');
        ${section_1_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-bottom-style');
        ${section_1_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-right-width');
        ${section_1_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_1_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_1_1_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_1_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_1_1_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_1_1_border_right_style}   dashed

    ${section_1_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_2_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_2},null).getPropertyValue('min-height');
        ${section_1_2_overflow_y}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_2},null).getPropertyValue('overflow-y');
        ${section_1_2_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_2},null).getPropertyValue('position');
            BuiltIn.Should contain  ${section_1_2_min_height}  100%
            BuiltIn.Should contain  ${section_1_2_overflow_y}  hidden
            BuiltIn.Should contain  ${section_1_2_position}    relative

    ${section_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-width');
        ${section_2_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-color');
        ${section_2_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-style');
            BuiltIn.Should contain  ${section_2_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_2_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_2_border_bottom_style}  dashed

    # (ส่วนที่ 1) เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[1]/span[@class='nameview' and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${bc_2column ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}

    # (ส่วนที่ 1) เช็คส่วนของ : โค้ด
    ${section_1_code}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[2][@align='right' and @valign='top']/span[@class='codeview' and text()='**code**']
        &{replace_section_1_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_1_code}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code}  ${replace_section_1_code}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code}

    # (ส่วนที่ 1) เช็คส่วนของ : ราคา
    ${section_1_price}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[1][@class='priceview pull-left' and text()='**price** บาท']
        &{replace_section_1_price}=  BuiltIn.Create dictionary  **price**=${bc_2column ['selling']}
        ${xpath_section_1_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_price}  ${replace_section_1_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_price}

    # (ส่วนที่ 1) เช็คส่วนของ : บาร์โค้ด
    ${section_1_barcodes}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/span[@class='barcodeview']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_barcodes_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('font-family');
        ${section_1_barcodes_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('font-size');
        ${section_1_barcodes_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('color');
        ${section_1_barcodes_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_1_barcodes_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_1_barcodes_font_size}    14px
            BuiltIn.Should contain  ${section_1_barcodes_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_1_barcodes_font_weight}  400
        ${section_1_barcodes_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('display');
        ${section_1_barcodes_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('max-width');
        ${section_1_barcodes_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_1_barcodes_display}        inline-block
            BuiltIn.Should contain  ${section_1_barcodes_max_width}      100%
            BuiltIn.Should contain  ${section_1_barcodes_margin_bottom}  5px

    # (ส่วนที่ 1) เช็คส่วนของ : แท็บบาร์โค้ด
    ${section_1_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/span[@class='barcodeview']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
        &{replace_section_1_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_1_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_tab_barcode}  ${replace_section_1_tab_barcode}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_tab_barcode}
    ${section_1_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('max-width');
        ${section_1_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('background');
            BuiltIn.Should contain  ${section_1_tab_barcodes_max_width}   100%
            BuiltIn.Should contain  ${section_1_tab_barcodes_background}  rgb(255, 255, 255)

    # (ส่วนที่ 1) เช็คส่วนของ : โค้ดบาร์โค้ด
    ${section_1_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/span[@class='barcodeview']/label/div[@class='text-center' and text()='**code**']
        &{replace_section_1_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_1_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code_barcode}  ${replace_section_1_code_barcode}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code_barcode}
    ${section_1_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_code_barcodes},null).getPropertyValue('font-size');
             BuiltIn.Should contain  ${section_1_code_barcodes_font_size}    10px
        ${section_1_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_code_barcodes},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${section_1_code_barcodes_text_align}   center

    # (ส่วนที่ 2) เช็คส่วนของ : ชื่อ
    ${section_2_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[1]/span[@class='nameview' and text()='**name**']
        &{replace_section_2_name}=  BuiltIn.Create dictionary  **name**=${bc_2column ['name']}
        ${xpath_section_2_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_name}  ${replace_section_2_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_name}

    # (ส่วนที่ 2) เช็คส่วนของ : โค้ด
    ${section_2_code}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[2][@align='right' and @valign='middle']/span[@class='codeview' and text()='**code**']
        &{replace_section_2_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_2_code}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_code}  ${replace_section_2_code}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_code}

    # (ส่วนที่ 2) เช็คส่วนของ : ราคา
    ${section_2_price}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[1][@class='priceview pull-left' and text()='**price** บาท']
        &{replace_section_2_price}=  BuiltIn.Create dictionary  **price**=${bc_2column ['selling']}
        ${xpath_section_2_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_price}  ${replace_section_2_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_price}

    # (ส่วนที่ 2) เช็คส่วนของ : บาร์โค้ด
    ${section_2_barcodes}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_barcodes_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('font-family');
        ${section_2_barcodes_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('font-size');
        ${section_2_barcodes_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('color');
        ${section_2_barcodes_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_2_barcodes_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_2_barcodes_font_size}    14px
            BuiltIn.Should contain  ${section_2_barcodes_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_2_barcodes_font_weight}  400
        ${section_2_barcodes_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('display');
        ${section_2_barcodes_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('max-width');
        ${section_2_barcodes_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_2_barcodes_display}        inline-block
            BuiltIn.Should contain  ${section_2_barcodes_max_width}      100%
            BuiltIn.Should contain  ${section_2_barcodes_margin_bottom}  5px

    # (ส่วนที่ 2) เช็คส่วนของ : แท็บบาร์โค้ด
    ${section_2_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
        &{replace_section_2_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_2_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_tab_barcode}  ${replace_section_2_tab_barcode}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_tab_barcode}
    ${section_2_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_tab_barcodes},null).getPropertyValue('max-width');
        ${section_2_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_tab_barcodes},null).getPropertyValue('background');
            BuiltIn.Should contain  ${section_2_tab_barcodes_max_width}   100%
            BuiltIn.Should contain  ${section_2_tab_barcodes_background}  rgb(255, 255, 255)

    # (ส่วนที่ 2) เช็คส่วนของ : โค้ดบาร์โค้ด
    ${section_2_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/label/div[@class='text-center' and text()='**code**']
        &{replace_section_2_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_2_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_code_barcode}  ${replace_section_2_code_barcode}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_code_barcode}
    ${section_2_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_code_barcodes},null).getPropertyValue('font-size');
             BuiltIn.Should contain  ${section_2_code_barcodes_font_size}    10px
        ${section_2_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_code_barcodes},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${section_2_code_barcodes_text_align}   center

Check print case 3column a4 bc
    [Arguments]      ${code}  ${bc_3column}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'บาร์โค้ด 3 คอลัมน์ (A4)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
            BuiltIn.Should contain  ${font_size}   15px
        ${width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${width}       1024px
            BuiltIn.Should contain  ${min_height}  1043.15px
            BuiltIn.Should contain  ${display}     block
            BuiltIn.Should contain  ${position}    relative
            BuiltIn.Should contain  ${margin}      0px 104.667px
            BuiltIn.Should contain  ${color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${page_break_inside_sec1}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${page_break_inside_sec1}  auto

    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${height_sec2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('height');
            BuiltIn.Should contain  ${height_sec2}  103.927px
        ${page_break_after_sec2}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
        ${page_break_inside_sec2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${page_break_after_sec2}   auto
            BuiltIn.Should contain  ${page_break_inside_sec2}  avoid

    # เช็ค 1 แถวมี 3 บาร์โค้ด a4 ขนาด 1:3
    ${section_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_padding}  4px 4px 1px
        ${section_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-width');
        ${section_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-color');
        ${section_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-style');
        ${section_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-width');
        ${section_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_1_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_1_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_1_border_right_style}   dashed
    
    ${section_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_2_padding}  4px 4px 1px
        ${section_2_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-width');
        ${section_2_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-color');
        ${section_2_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-style');
        ${section_2_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-width');
        ${section_2_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_2_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_2_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_2_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_2_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_2_border_right_style}   dashed

    ${section_3}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_3_padding}  4px 4px 1px
        ${section_3_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-width');
        ${section_3_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-color');
        ${section_3_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-style');
            BuiltIn.Should contain  ${section_3_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_3_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_3_border_bottom_style}  dashed

    # (ส่วนที่ 1) เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[1]/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${bc_3column ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}

    ${section_1_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_names_overflow}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('overflow');
        ${section_1_names_max_height}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_1_names_overflow}      hidden
            BuiltIn.Should contain  ${section_1_names_max_height}    42px

    # (ส่วนที่ 1) เช็คส่วนของ : ราคา
    ${section_1_price}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[2][@style='text-align:right;']/div[contains(@class,'priceview') and text()='**price** บาท']
        &{replace_section_1_price}=  BuiltIn.Create dictionary  **price**=${bc_3column ['selling']}
        ${xpath_section_1_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_price}  ${replace_section_1_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_price}

    # (ส่วนที่ 1) เช็คส่วนของ : บาร์โค้ด
    ${section_1_barcodes}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_barcodes_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('font-family');
        ${section_1_barcodes_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('font-size');
        ${section_1_barcodes_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('color');
        ${section_1_barcodes_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_1_barcodes_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_1_barcodes_font_size}    14px
            BuiltIn.Should contain  ${section_1_barcodes_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_1_barcodes_font_weight}  400
        ${section_1_barcodes_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('display');
        ${section_1_barcodes_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('max-width');
        ${section_1_barcodes_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_1_barcodes_display}        inline-block
            BuiltIn.Should contain  ${section_1_barcodes_max_width}      100%
            BuiltIn.Should contain  ${section_1_barcodes_margin_bottom}  5px

                # แท็บบาร์โค้ด
                ${section_1_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
                    &{replace_section_1_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_1_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_tab_barcode}  ${replace_section_1_tab_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_tab_barcode}
                ${section_1_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_1_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('max-width');
                    ${section_1_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${section_1_tab_barcodes_max_width}   100%
                        BuiltIn.Should contain  ${section_1_tab_barcodes_background}  rgb(255, 255, 255)

                # โค้ดบาร์โค้ด
                ${section_1_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/div[@class='text-center' and text()='**code**']
                    &{replace_section_1_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_1_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code_barcode}  ${replace_section_1_code_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code_barcode}
                ${section_1_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_1_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_code_barcodes},null).getPropertyValue('font-size');
                        BuiltIn.Should contain  ${section_1_code_barcodes_font_size}    10px
                    ${section_1_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${section_1_code_barcodes_text_align}   center

    # (ส่วนที่ 2) เช็คส่วนของ : ชื่อ
        ${section_2_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[1]/div[contains(@class,'nameview') and text()='**name**']
            &{replace_section_2_name}=  BuiltIn.Create dictionary  **name**=${bc_3column ['name']}
            ${xpath_section_2_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
                SeleniumLibrary.Wait until element is visible  ${xpath_section_2_name}

        ${section_2_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
            ${section_2_names_overflow}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('overflow');
            ${section_2_names_max_height}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('max-height');
                BuiltIn.Should contain  ${section_2_names_overflow}      hidden
                BuiltIn.Should contain  ${section_2_names_max_height}    42px

    # (ส่วนที่ 2) เช็คส่วนของ : ราคา
    ${section_2_price}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[2][@style='text-align:right;']/div[contains(@class,'priceview') and text()='**price** บาท']
        &{replace_section_2_price}=  BuiltIn.Create dictionary  **price**=${bc_3column ['selling']}
        ${xpath_section_2_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_price}  ${replace_section_2_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_price}

    # (ส่วนที่ 2) เช็คส่วนของ : บาร์โค้ด
    ${section_2_barcodes}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_barcodes_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('font-family');
        ${section_2_barcodes_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('font-size');
        ${section_2_barcodes_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('color');
        ${section_2_barcodes_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_2_barcodes_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_2_barcodes_font_size}    14px
            BuiltIn.Should contain  ${section_2_barcodes_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_2_barcodes_font_weight}  400
        ${section_2_barcodes_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('display');
        ${section_2_barcodes_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('max-width');
        ${section_2_barcodes_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_2_barcodes_display}        inline-block
            BuiltIn.Should contain  ${section_2_barcodes_max_width}      100%
            BuiltIn.Should contain  ${section_2_barcodes_margin_bottom}  5px

                # แท็บบาร์โค้ด
                ${section_2_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
                    &{replace_section_2_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_2_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_tab_barcode}  ${replace_section_2_tab_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_tab_barcode}
                ${section_2_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_2_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_tab_barcodes},null).getPropertyValue('max-width');
                    ${section_2_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${section_2_tab_barcodes_max_width}   100%
                        BuiltIn.Should contain  ${section_2_tab_barcodes_background}  rgb(255, 255, 255)

                # โค้ดบาร์โค้ด
                ${section_2_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/div[@class='text-center' and text()='**code**']
                    &{replace_section_2_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_2_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_code_barcode}  ${replace_section_2_code_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_2_code_barcode}
                ${section_2_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_2_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_code_barcodes},null).getPropertyValue('font-size');
                        BuiltIn.Should contain  ${section_2_code_barcodes_font_size}    10px
                    ${section_2_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${section_2_code_barcodes_text_align}   center

    # (ส่วนที่ 3) เช็คส่วนของ : ชื่อ
    ${section_3_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[1]/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_3_name}=  BuiltIn.Create dictionary  **name**=${bc_3column ['name']}
        ${xpath_section_3_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_name}  ${replace_section_3_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_3_name}

    ${section_3_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_names_overflow}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('overflow');
        ${section_3_names_max_height}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_3_names_overflow}      hidden
            BuiltIn.Should contain  ${section_3_names_max_height}    42px

    # (ส่วนที่ 3) เช็คส่วนของ : ราคา
    ${section_3_price}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[2][@style='text-align:right;']/div[contains(@class,'priceview') and text()='**price** บาท']
        &{replace_section_3_price}=  BuiltIn.Create dictionary  **price**=${bc_3column ['selling']}
        ${xpath_section_3_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_price}  ${replace_section_3_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_3_price}

    # (ส่วนที่ 3) เช็คส่วนของ : บาร์โค้ด
    ${section_3_barcodes}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_barcodes_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes},null).getPropertyValue('font-family');
        ${section_3_barcodes_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes},null).getPropertyValue('font-size');
        ${section_3_barcodes_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes},null).getPropertyValue('color');
        ${section_3_barcodes_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_3_barcodes_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_3_barcodes_font_size}    14px
            BuiltIn.Should contain  ${section_3_barcodes_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_3_barcodes_font_weight}  400
        ${section_3_barcodes_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes},null).getPropertyValue('display');
        ${section_3_barcodes_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes},null).getPropertyValue('max-width');
        ${section_3_barcodes_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_3_barcodes_display}        inline-block
            BuiltIn.Should contain  ${section_3_barcodes_max_width}      100%
            BuiltIn.Should contain  ${section_3_barcodes_margin_bottom}  5px

                # แท็บบาร์โค้ด
                ${section_3_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
                    &{replace_section_3_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_3_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_tab_barcode}  ${replace_section_3_tab_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_3_tab_barcode}
                ${section_3_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_3_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_tab_barcodes},null).getPropertyValue('max-width');
                    ${section_3_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${section_3_tab_barcodes_max_width}   100%
                        BuiltIn.Should contain  ${section_3_tab_barcodes_background}  rgb(255, 255, 255)

                # โค้ดบาร์โค้ด
                ${section_3_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/div[@class='text-center' and text()='**code**']
                    &{replace_section_3_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_3_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_code_barcode}  ${replace_section_3_code_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_3_code_barcode}
                ${section_3_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_3_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_code_barcodes},null).getPropertyValue('font-size');
                        BuiltIn.Should contain  ${section_3_code_barcodes_font_size}    10px
                    ${section_3_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${section_3_code_barcodes_text_align}   center

Check print case 1column stk bc
    [Arguments]      ${code}  ${bc_1column_stk}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'บาร์โค้ด 1 คอลัมน์ (สติ๊กเกอร์ 5x3 ซม.)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       204.094px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_margin}      0px 522.958px 0px 522.948px
            BuiltIn.Should contain  ${outer_font_size}   15px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_height}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('height');
        ${inner_padding_left}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('padding-left');
        ${inner_padding_right}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('padding-right');
            BuiltIn.Should contain  ${inner_height}         100px
            BuiltIn.Should contain  ${inner_padding_left}   8px
            BuiltIn.Should contain  ${inner_padding_right}  8px

    # เช็คส่วนของ : ชื่อ
    ${names_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[@class='infosection ']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${names_sec1_display}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('display');
        ${names_sec1_flex_direction}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('flex-direction');
        ${names_sec1_justify_content}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('justify-content');
        ${names_sec1_padding}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${names_sec1_display}          flex
            BuiltIn.Should contain  ${names_sec1_flex_direction}   row
            BuiltIn.Should contain  ${names_sec1_justify_content}  space-between
            BuiltIn.Should contain  ${names_sec1_padding}          10px 0

    ${name_sec2}=  BuiltIn.Set variable  //page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[@class='infosection ']/div[contains(@class,'nameview') and text()='**name**']
        &{replace_name_sec2}=  BuiltIn.Create dictionary  **name**=${bc_1column_stk ['name']}
        ${xpath_name_sec2}=  common_keywords_middle_portal.Auto keyword replace string  ${name_sec2}  ${replace_name_sec2}
            SeleniumLibrary.Wait until element is visible  ${xpath_name_sec2}
        ${names_sec2}=  BuiltIn.Set variable  document.evaluate("${xpath_name_sec2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
            ${names_sec2_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('text-align');
                BuiltIn.Should contain  ${names_sec2_text_align}  left
            ${names_sec2_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('white-space');
            ${names_sec2_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('overflow');
            ${names_sec2_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('text-overflow');
                BuiltIn.Should contain  ${names_sec2_white_space}    nowrap
                BuiltIn.Should contain  ${names_sec2_overflow}       hidden
                BuiltIn.Should contain  ${names_sec2_text_overflow}  ellipsis
    
    # เช็คส่วนของ : ราคา
    ${price}=  BuiltIn.Set variable  //page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[@class='infosection ']/div[2][@class='priceview truncate w50' and @style='text-align: right' and text()='**price** บาท']
        &{replace_price}=  BuiltIn.Create dictionary  **price**=${bc_1column_stk ['selling']}
        ${xpath_price}=  common_keywords_middle_portal.Auto keyword replace string  ${price}  ${replace_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_price}

    # เช็คส่วนของ : บาร์โค้ด
    ${barcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[contains(@class,'barcodeview')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${barcodes_sec1_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec1},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${barcodes_sec1_text_align}    center
    ${barcodes_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[contains(@class,'barcodeview')]/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${barcodes_sec2_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec2},null).getPropertyValue('font-family');
        ${barcodes_sec2_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec2},null).getPropertyValue('font-size');
        ${barcodes_sec2_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec2},null).getPropertyValue('color');
        ${barcodes_sec2_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec2},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${barcodes_sec2_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${barcodes_sec2_font_size}    14px
            BuiltIn.Should contain  ${barcodes_sec2_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${barcodes_sec2_font_weight}  400
        ${barcodes_sec2_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec2},null).getPropertyValue('display');
        ${barcodes_sec2_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec2},null).getPropertyValue('max-width');
        ${barcodes_sec2_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${barcodes_sec2},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${barcodes_sec2_display}        inline-block
            BuiltIn.Should contain  ${barcodes_sec2_max_width}      100%
            BuiltIn.Should contain  ${barcodes_sec2_margin_bottom}  5px
                # แท็บบาร์โค้ด
                ${tab_barcode}=  BuiltIn.Set variable  //page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[contains(@class,'barcodeview')]/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
                    &{replace_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${tab_barcode}  ${replace_tab_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_tab_barcode}
                ${tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${tab_barcodes},null).getPropertyValue('max-width');
                    ${tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${tab_barcodes_max_width}   100%
                        BuiltIn.Should contain  ${tab_barcodes_background}  rgb(255, 255, 255)
                # โค้ดบาร์โค้ด
                ${code_barcode}=  BuiltIn.Set variable  //page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[contains(@class,'barcodeview')]/label/div[@class='text-center' and text()='**code**']
                    &{replace_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${code_barcode}  ${replace_code_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_code_barcode}
                ${code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${code_barcodes},null).getPropertyValue('font-size');
                        BuiltIn.Should contain  ${code_barcodes_font_size}    10px
                    ${code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${code_barcodes_text_align}   center

Check print case 3column stk bc
    [Arguments]      ${code}  ${bc_3column_stk}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'บาร์โค้ด 3 คอลัมน์ (สติ๊กเกอร์)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
            BuiltIn.Should contain  ${outer_font_size}   15px
        ${outer_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
            BuiltIn.Should contain  ${outer_width}   600.938px
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_paper_size_sec1_width}=              SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('width');
        ${inner_paper_size_sec1_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
        ${inner_paper_size_sec1_border_collapse}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('border-collapse');
        ${inner_paper_size_sec1_border_spacing}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('border-spacing');
            BuiltIn.Should contain  ${inner_paper_size_sec1_width}              600.938px
            BuiltIn.Should contain  ${inner_paper_size_sec1_page_break_inside}  auto
            BuiltIn.Should contain  ${inner_paper_size_sec1_border_collapse}    separate
            BuiltIn.Should contain  ${inner_paper_size_sec1_border_spacing}     0

    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_paper_size_sec2_height}=             SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('height');
        ${inner_paper_size_sec2_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
        ${inner_paper_size_sec2_page_break_after}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
            BuiltIn.Should contain  ${inner_paper_size_sec2_height}             103.927px
            BuiltIn.Should contain  ${inner_paper_size_sec2_page_break_inside}  avoid
            BuiltIn.Should contain  ${inner_paper_size_sec2_page_break_after}   auto
    
    # เช็ค 1 แถวมี 3 บาร์โค้ด stk ขนาด 1:3
    ${section_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_padding}  4px 4px 1px
        ${section_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-width');
        ${section_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-color');
        ${section_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-style');
        ${section_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-width');
        ${section_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_1_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_1_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_1_border_right_style}   dashed

    ${section_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_2_padding}  4px 4px 1px
        ${section_2_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-width');
        ${section_2_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-color');
        ${section_2_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-style');
        ${section_2_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-width');
        ${section_2_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_2_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_2_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_2_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_2_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_2_border_right_style}   dashed

    ${section_3}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_3_padding}  4px 4px 1px
        ${section_3_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-width');
        ${section_3_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-color');
        ${section_3_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-style');
            BuiltIn.Should contain  ${section_3_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_3_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_3_border_bottom_style}  dashed
    
    # (ส่วนที่ 1) เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${bc_3column_stk ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}
    ${section_1_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_names_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_1_names_max_height}  42px
        ${section_1_names_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('white-space');
        ${section_1_names_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('overflow');
        ${section_1_names_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_1_names_white_space}    nowrap
            BuiltIn.Should contain  ${section_1_names_overflow}       hidden
            BuiltIn.Should contain  ${section_1_names_text_overflow}  ellipsis

    # (ส่วนที่ 1) เช็คส่วนของ : ราคา
    ${section_1_price}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[2][@style='text-align:right;']/div[contains(@class,'priceview') and text()='**price** บาท']
        &{replace_section_1_price}=  BuiltIn.Create dictionary  **price**=${bc_3column_stk ['selling']}
        ${xpath_section_1_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_price}  ${replace_section_1_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_price}
    ${section_1_prices}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_price}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_prices_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_prices},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_1_prices_max_height}  42px
        ${section_1_prices_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_prices},null).getPropertyValue('white-space');
        ${section_1_prices_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_prices},null).getPropertyValue('overflow');
        ${section_1_prices_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_prices},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_1_prices_white_space}    nowrap
            BuiltIn.Should contain  ${section_1_prices_overflow}       hidden
            BuiltIn.Should contain  ${section_1_prices_text_overflow}  ellipsis
    
    # (ส่วนที่ 1) เช็คส่วนของ : บาร์โค้ด
    ${section_1_barcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_barcodes_sec1_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec1},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${section_1_barcodes_sec1_text_align}  center
    ${section_1_barcodes_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_barcodes_sec2_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec2},null).getPropertyValue('font-family');
        ${section_1_barcodes_sec2_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec2},null).getPropertyValue('font-size');
        ${section_1_barcodes_sec2_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec2},null).getPropertyValue('color');
        ${section_1_barcodes_sec2_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec2},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_1_barcodes_sec2_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_1_barcodes_sec2_font_size}    14px
            BuiltIn.Should contain  ${section_1_barcodes_sec2_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_1_barcodes_sec2_font_weight}  400
        ${section_1_barcodes_sec2_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec2},null).getPropertyValue('display');
        ${section_1_barcodes_sec2_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec2},null).getPropertyValue('max-width');
        ${section_1_barcodes_sec2_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_barcodes_sec2},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_1_barcodes_sec2_display}        inline-block
            BuiltIn.Should contain  ${section_1_barcodes_sec2_max_width}      100%
            BuiltIn.Should contain  ${section_1_barcodes_sec2_margin_bottom}  5px
                # แท็บบาร์โค้ด
                ${section_1_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
                    &{replace_section_1_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_1_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_tab_barcode}  ${replace_section_1_tab_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_tab_barcode}
                ${section_1_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_1_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('max-width');
                    ${section_1_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${section_1_tab_barcodes_max_width}   100%
                        BuiltIn.Should contain  ${section_1_tab_barcodes_background}  rgb(255, 255, 255)
                # โค้ดบาร์โค้ด
                ${section_1_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/div[@class='text-center' and text()='**code**']
                    &{replace_section_1_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_1_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code_barcode}  ${replace_section_1_code_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code_barcode}
                ${section_1_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_1_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_code_barcodes},null).getPropertyValue('font-size');
                        BuiltIn.Should contain  ${section_1_code_barcodes_font_size}    10px
                    ${section_1_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${section_1_code_barcodes_text_align}   center

    # (ส่วนที่ 2) เช็คส่วนของ : ชื่อ
    ${section_2_name}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_2_name}=  BuiltIn.Create dictionary  **name**=${bc_3column_stk ['name']}
        ${xpath_section_2_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_name}  ${replace_section_2_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_name}
    ${section_2_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_names_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_2_names_max_height}  42px
        ${section_2_names_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('white-space');
        ${section_2_names_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('overflow');
        ${section_2_names_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_2_names_white_space}    nowrap
            BuiltIn.Should contain  ${section_2_names_overflow}       hidden
            BuiltIn.Should contain  ${section_2_names_text_overflow}  ellipsis

    # (ส่วนที่ 2) เช็คส่วนของ : ราคา
    ${section_2_price}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[2][@style='text-align:right;']/div[contains(@class,'priceview') and text()='**price** บาท']
        &{replace_section_2_price}=  BuiltIn.Create dictionary  **price**=${bc_3column_stk ['selling']}
        ${xpath_section_2_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_price}  ${replace_section_2_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_price}
    ${section_2_prices}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_price}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_prices_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_prices},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_2_prices_max_height}  42px
        ${section_2_prices_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_prices},null).getPropertyValue('white-space');
        ${section_2_prices_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_prices},null).getPropertyValue('overflow');
        ${section_2_prices_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_prices},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_2_prices_white_space}    nowrap
            BuiltIn.Should contain  ${section_2_prices_overflow}       hidden
            BuiltIn.Should contain  ${section_2_prices_text_overflow}  ellipsis

    # (ส่วนที่ 2) เช็คส่วนของ : บาร์โค้ด
    ${section_2_barcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_barcodes_sec1_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec1},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${section_2_barcodes_sec1_text_align}  center
    ${section_2_barcodes_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_barcodes_sec2_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec2},null).getPropertyValue('font-family');
        ${section_2_barcodes_sec2_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec2},null).getPropertyValue('font-size');
        ${section_2_barcodes_sec2_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec2},null).getPropertyValue('color');
        ${section_2_barcodes_sec2_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec2},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_2_barcodes_sec2_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_2_barcodes_sec2_font_size}    14px
            BuiltIn.Should contain  ${section_2_barcodes_sec2_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_2_barcodes_sec2_font_weight}  400
        ${section_2_barcodes_sec2_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec2},null).getPropertyValue('display');
        ${section_2_barcodes_sec2_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec2},null).getPropertyValue('max-width');
        ${section_2_barcodes_sec2_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_barcodes_sec2},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_2_barcodes_sec2_display}        inline-block
            BuiltIn.Should contain  ${section_2_barcodes_sec2_max_width}      100%
            BuiltIn.Should contain  ${section_2_barcodes_sec2_margin_bottom}  5px
                # แท็บบาร์โค้ด
                ${section_2_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
                    &{replace_section_2_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_2_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_tab_barcode}  ${replace_section_2_tab_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_2_tab_barcode}
                ${section_2_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_2_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_tab_barcodes},null).getPropertyValue('max-width');
                    ${section_2_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${section_2_tab_barcodes_max_width}   100%
                        BuiltIn.Should contain  ${section_2_tab_barcodes_background}  rgb(255, 255, 255)
                # โค้ดบาร์โค้ด
                ${section_2_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/div[@class='text-center' and text()='**code**']
                    &{replace_section_2_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_2_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_code_barcode}  ${replace_section_2_code_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_2_code_barcode}
                ${section_2_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_2_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_code_barcodes},null).getPropertyValue('font-size');
                        BuiltIn.Should contain  ${section_2_code_barcodes_font_size}    10px
                    ${section_2_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${section_2_code_barcodes_text_align}   center

    # (ส่วนที่ 3) เช็คส่วนของ : ชื่อ
    ${section_3_name}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_3_name}=  BuiltIn.Create dictionary  **name**=${bc_3column_stk ['name']}
        ${xpath_section_3_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_name}  ${replace_section_3_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_3_name}
    ${section_3_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_names_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_3_names_max_height}  42px
        ${section_3_names_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('white-space');
        ${section_3_names_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('overflow');
        ${section_3_names_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_3_names_white_space}    nowrap
            BuiltIn.Should contain  ${section_3_names_overflow}       hidden
            BuiltIn.Should contain  ${section_3_names_text_overflow}  ellipsis

    # (ส่วนที่ 3) เช็คส่วนของ : ราคา
    ${section_3_price}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[2][@style='text-align:right;']/div[contains(@class,'priceview') and text()='**price** บาท']
        &{replace_section_3_price}=  BuiltIn.Create dictionary  **price**=${bc_3column_stk ['selling']}
        ${xpath_section_3_price}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_price}  ${replace_section_3_price}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_3_price}
    ${section_3_prices}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_price}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_prices_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_prices},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_3_prices_max_height}  42px
        ${section_3_prices_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_prices},null).getPropertyValue('white-space');
        ${section_3_prices_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_prices},null).getPropertyValue('overflow');
        ${section_3_prices_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_prices},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_3_prices_white_space}    nowrap
            BuiltIn.Should contain  ${section_3_prices_overflow}       hidden
            BuiltIn.Should contain  ${section_3_prices_text_overflow}  ellipsis

    # (ส่วนที่ 3) เช็คส่วนของ : บาร์โค้ด
    ${section_3_barcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_barcodes_sec1_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec1},null).getPropertyValue('text-align');
            BuiltIn.Should contain  ${section_3_barcodes_sec1_text_align}  center
    ${section_3_barcodes_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_barcodes_sec2_font_family}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec2},null).getPropertyValue('font-family');
        ${section_3_barcodes_sec2_font_size}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec2},null).getPropertyValue('font-size');
        ${section_3_barcodes_sec2_color}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec2},null).getPropertyValue('color');
        ${section_3_barcodes_sec2_font_weight}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec2},null).getPropertyValue('font-weight');
            BuiltIn.Should contain  ${section_3_barcodes_sec2_font_family}  boon, helvetica, arial, sans-serif
            BuiltIn.Should contain  ${section_3_barcodes_sec2_font_size}    14px
            BuiltIn.Should contain  ${section_3_barcodes_sec2_color}        rgb(62, 62, 62)
            BuiltIn.Should contain  ${section_3_barcodes_sec2_font_weight}  400
        ${section_3_barcodes_sec2_display}=        SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec2},null).getPropertyValue('display');
        ${section_3_barcodes_sec2_max_width}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec2},null).getPropertyValue('max-width');
        ${section_3_barcodes_sec2_margin_bottom}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_barcodes_sec2},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${section_3_barcodes_sec2_display}        inline-block
            BuiltIn.Should contain  ${section_3_barcodes_sec2_max_width}      100%
            BuiltIn.Should contain  ${section_3_barcodes_sec2_margin_bottom}  5px
                # แท็บบาร์โค้ด
                ${section_3_tab_barcode}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/*[name()='svg' and @class='barcode' and @data-value='**code**' and @width='488px' and @height='25px' and @x='0px' and @y='0px' and @viewBox='0 0 488 25']
                    &{replace_section_3_tab_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_3_tab_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_tab_barcode}  ${replace_section_3_tab_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_3_tab_barcode}
                ${section_3_tab_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_tab_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_3_tab_barcodes_max_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_tab_barcodes},null).getPropertyValue('max-width');
                    ${section_3_tab_barcodes_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_tab_barcodes},null).getPropertyValue('background');
                        BuiltIn.Should contain  ${section_3_tab_barcodes_max_width}   100%
                        BuiltIn.Should contain  ${section_3_tab_barcodes_background}  rgb(255, 255, 255)
                # โค้ดบาร์โค้ด
                ${section_3_code_barcode}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/label/div[@class='text-center' and text()='**code**']
                    &{replace_section_3_code_barcode}=  BuiltIn.Create dictionary  **code**=${code}
                    ${xpath_section_3_code_barcode}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_code_barcode}  ${replace_section_3_code_barcode}
                        SeleniumLibrary.Wait until element is visible  ${xpath_section_3_code_barcode}
                ${section_3_code_barcodes}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_code_barcode}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
                    ${section_3_code_barcodes_font_size}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_code_barcodes},null).getPropertyValue('font-size');
                        BuiltIn.Should contain  ${section_3_code_barcodes_font_size}    10px
                    ${section_3_code_barcodes_text_align}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_code_barcodes},null).getPropertyValue('text-align');
                        BuiltIn.Should contain  ${section_3_code_barcodes_text_align}   center

Check print case nomall qr
    [Arguments]      ${code}  ${qr_nomall}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'คิวอาร์โค้ดทั่วไป'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='fullproductview ']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       1024px
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px 104.667px
            BuiltIn.Should contain  ${outer_font_size}   20px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('page-break-inside');
        ${inner_border_collapse}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('border-collapse');
        ${inner_border_spacing}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('border-spacing');
        ${inner_background_color}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('background-color');
            BuiltIn.Should contain  ${inner_page_break_inside}  auto
            BuiltIn.Should contain  ${inner_border_collapse}    separate
            BuiltIn.Should contain  ${inner_border_spacing}     0
            BuiltIn.Should contain  ${inner_background_color}   rgba(0, 0, 0, 0)

    # เช็คส่วนของ : รูป
    ${image}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[1]//table[@width='100%']//table[@cellpadding='10']/tbody/tr/td[1]/img[@width='120']
        SeleniumLibrary.Wait until element is visible  ${image}

    # เช็คส่วนของ : ชื่อ
    ${names}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[1]//table[@width='100%']//table[@cellpadding='10']/tbody/tr/td[2]//b[text()='**name**']
        &{replace_name}=  BuiltIn.Create dictionary  **name**=${qr_nomall ['name']}
        ${xpath_name}=  common_keywords_middle_portal.Auto keyword replace string  ${names}  ${replace_name}
        SeleniumLibrary.Wait until element is visible  ${xpath_name}

    # เช็คส่วนของ : หัวข้อรายละเอียด
    ${toppic_description}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[3]/td/table[@cellspacing='10']/tbody/tr/td[@valign='top' and @align='right'][1]/b/big[text()='รายละเอียด:']
        SeleniumLibrary.Wait until element is visible  ${toppic_description}

    # เช็คส่วนของ : ข้อมูลรายละเอียด
    ${data_description}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[3]/td/table[@cellspacing='10']/tbody/tr/td[@valign='top'][2]/big[text()='**des**']
        &{replace_description}=  BuiltIn.Create dictionary  **des**=${qr_nomall ['description']}
        ${xpath_description}=  common_keywords_middle_portal.Auto keyword replace string  ${data_description}  ${replace_description}
        SeleniumLibrary.Wait until element is visible  ${xpath_description}

    # เช็คส่วนของ : ราคา
    ${price}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][1]/span[@class='priceview']/big/big/big/b[text()='**price** บาท']
        &{str_replace_price}=  BuiltIn.Create dictionary  **price**=${qr_nomall ['selling']}
        ${xpath_price}=  common_keywords_middle_portal.Auto keyword replace string  ${price}  ${str_replace_price}
        SeleniumLibrary.Wait until element is visible  ${xpath_price}

    # เช็คส่วนของ : โค้ด
    ${codes}=  BuiltIn.Set variable  (//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][2]/span[text()='**code**'][1]
        &{str_replace_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_code}=  common_keywords_middle_portal.Auto keyword replace string  ${codes}  ${str_replace_code}
        SeleniumLibrary.Wait until element is visible  ${xpath_code}

    # เช็คส่วนของ : คิวอาร์โค้ด
    ${qrcode}=  BuiltIn.Set variable  document.evaluate("(//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[5]/td[@align='right']/table[@cellspacing='10' and @width='100%']/tbody/tr/td[@align='right' and @valign='middle'][2]/span[2][contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${qrcode_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode},null).getPropertyValue('width');
        ${qrcode_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcode},null).getPropertyValue('height');
            BuiltIn.Should contain  ${qrcode_width}   50px
            BuiltIn.Should contain  ${qrcode_height}  50px

    # เช็คเส้นคั่นที่ 1
    ${middle_line_1}=  BuiltIn.Set variable  document.evaluate("(//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[2]/td//hr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${margin_top_1}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_1},null).getPropertyValue('margin-top');
        ${margin_bottom_1}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_1},null).getPropertyValue('margin-bottom');
        ${border_top_1}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_1},null).getPropertyValue('border-top');
            BuiltIn.Should contain  ${margin_top_1}     20px
            BuiltIn.Should contain  ${margin_bottom_1}  20px
            BuiltIn.Should contain  ${border_top_1}     0.666667px solid rgb(238, 238, 238)

    # เช็คเส้นคั่นที่ 2
    ${middle_line_2}=  BuiltIn.Set variable  document.evaluate("(//page[@size='A4' and @class='fullproductview ']/table[@width='90%' and @align='center' and @class='fullproductview']/tbody/tr)[4]/td/hr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${margin_top_2}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_2},null).getPropertyValue('margin-top');
        ${margin_bottom_2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_2},null).getPropertyValue('margin-bottom');
        ${border_top_2}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${middle_line_2},null).getPropertyValue('border-top');
            BuiltIn.Should contain  ${margin_top_2}     20px
            BuiltIn.Should contain  ${margin_bottom_2}  20px
            BuiltIn.Should contain  ${border_top_2}     0.666667px solid rgb(238, 238, 238)

    # เช็คเส้นคั่นท้าย
    ${abutment_line_0}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='fullproductview ']/hr[@class='fullproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${border_top_0}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${abutment_line_0},null).getPropertyValue('border-top');
        ${margin_top_0}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${abutment_line_0},null).getPropertyValue('margin-top');
        ${margin_bottom_0}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${abutment_line_0},null).getPropertyValue('margin-bottom');
            BuiltIn.Should contain  ${border_top_0}     0.666667px dotted rgb(0, 0, 0)
            BuiltIn.Should contain  ${margin_top_0}     20px
            BuiltIn.Should contain  ${margin_bottom_0}  20px

Check print case catalog qr
    [Arguments]      ${code}  ${qr_catalog}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'คิวอาร์โค้ดแค็ตตาล็อก'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_font_size}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       1024px
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px 104.667px
            BuiltIn.Should contain  ${outer_font_size}   20px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_sec1_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_sec1_page_break_inside}  auto
            
    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_sec2_page_break_after}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
        ${inner_sec2_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_sec2_page_break_after}   auto
            BuiltIn.Should contain  ${inner_sec2_page_break_inside}  avoid

    # เช็ค 1 แถวต้องมี 1 บาร์โค้ด ขนาด 1:3
    ${section_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_padding}   4px 4px 1px
        ${section_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-width');
        ${section_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-color');
        ${section_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-style');
        ${section_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-width');
        ${section_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_border_bottom_width}   0.666667px
            BuiltIn.Should contain  ${section_1_border_bottom_color}   rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_border_bottom_style}   dashed
            BuiltIn.Should contain  ${section_1_border_right_width}    0.666667px
            BuiltIn.Should contain  ${section_1_border_right_style}    dashed

    ${section_2}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[2]
        SeleniumLibrary.Wait until element is visible  ${section_2}

    ${section_3}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[3]
        SeleniumLibrary.Wait until element is visible  ${section_3}

    # เช็คส่วนของ : รูป
    ${section_1_image}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[1]/td[1][@width='120' and @align='center' and @valign='top']/img[@width='120']
        SeleniumLibrary.Wait until element is visible  ${section_1_image}

    # เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[1]/td[2][@align='left' and @valign='top']/span[1][@class='nameview' and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${qr_catalog ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}

    # เช็คส่วนของ : โค้ด
    ${section_1_code}=  BuiltIn.Set variable  //page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[1]/td[2][@align='left' and @valign='top']/span[2][@class='codeview' and text()='**code**' and br]
        &{replace_section_1_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_1_code}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code}  ${replace_section_1_code}
        SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code}

    # เช็คส่วนของ : คิวอาร์โค้ด
    ${section_1_qrcode}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='catalogproductview']/table[@width='100%' and @align='center' and @class='catalogproductview']/tbody/tr/td[@class='barcodelinearea' and @width='33%' and @valign='top'][1]/div/table[@width='100%']/tbody/tr/td[@valign='top']/table[@cellpadding='2' and @width='100%']/tbody/tr[2]/td[@align='center' and @valign='middle' and @colspan='2']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('width');
        ${section_1_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_1_width}   50px
            BuiltIn.Should contain  ${section_1_height}  50px
        ${section_1_display}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('display');
        ${section_1_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_1_display}         inline-block
            BuiltIn.Should contain  ${section_1_vertical_align}  baseline

Check print case 2column a4 qr
    [Arguments]      ${code}  ${qr_2column_a4}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'คิวอาร์โค้ด 2 คอลัมน์ (A4)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
            BuiltIn.Should contain  ${outer_font_size}   20px
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       1024px
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px 104.667px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_page_break_inside_sec1}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_page_break_inside_sec1}  auto

    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_page_break_after_sec2}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
        ${inner_page_break_inside_sec2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_page_break_after_sec2}   auto
            BuiltIn.Should contain  ${inner_page_break_inside_sec2}  avoid

    # (ส่วนที่ 1) เช็ค 1 แถวมี 2 คิวอาร์โค้ด a4 ขนาด 1:2
    ${section_1_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_1_padding}  4px 4px 1px
        ${section_1_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-bottom-width');
        ${section_1_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-bottom-color');
        ${section_1_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-bottom-style');
        ${section_1_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-right-width');
        ${section_1_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_1_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_1_1_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_1_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_1_1_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_1_1_border_right_style}   dashed

    ${section_1_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_2_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_2},null).getPropertyValue('min-height');
        ${section_1_2_overflow_y}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_2},null).getPropertyValue('overflow-y');
        ${section_1_2_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_2},null).getPropertyValue('position');
            BuiltIn.Should contain  ${section_1_2_min_height}  100%
            BuiltIn.Should contain  ${section_1_2_overflow_y}  hidden
            BuiltIn.Should contain  ${section_1_2_position}    relative

    ${section_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-width');
        ${section_2_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-color');
        ${section_2_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-style');
            BuiltIn.Should contain  ${section_2_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_2_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_2_border_bottom_style}  dashed

    # (ส่วนที่ 1) เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[1]/span[@class='nameview' and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${qr_2column_a4 ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}

    # (ส่วนที่ 1) เช็คส่วนของ : โค้ด
    ${section_1_code}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[2][@align='right' and @valign='top']/span[@class='codeview' and text()='**code**']
        &{replace_section_1_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_1_code}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_code}  ${replace_section_1_code}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_code}

    # (ส่วนที่ 1) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_1_qrcode}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[1][@width='50%' and @class='barcodelinearea']/div/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('width');
        ${section_1_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_1_width}   50px
            BuiltIn.Should contain  ${section_1_height}  50px
        ${section_1_display}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('display');
        ${section_1_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_1_display}         inline-block
            BuiltIn.Should contain  ${section_1_vertical_align}  baseline

    # (ส่วนที่ 2) เช็คส่วนของ : ชื่อ
    ${section_2_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[1]/span[@class='nameview' and text()='**name**']
        &{replace_section_2_name}=  BuiltIn.Create dictionary  **name**=${qr_2column_a4 ['name']}
        ${xpath_section_2_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_name}  ${replace_section_2_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_name}

    # (ส่วนที่ 2) เช็คส่วนของ : โค้ด
    ${section_2_code}=  BuiltIn.Set variable  //page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[1]/td[2][@align='right' and @valign='middle']/span[@class='codeview' and text()='**code**']
        &{replace_section_2_code}=  BuiltIn.Create dictionary  **code**=${code}
        ${xpath_section_2_code}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_code}  ${replace_section_2_code}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_code}

    # (ส่วนที่ 2) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_2_qrcode}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='briefproductview']/table[@width='90%' and @align='center' and @class='briefproductview']/tbody/tr/td[2][@width='50%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='10' and @width='100%']/tbody/tr[2]/td[@colspan='3']/span[2][@class='barcodeview pull-right']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('width');
        ${section_2_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_2_width}   50px
            BuiltIn.Should contain  ${section_2_height}  50px
        ${section_2_display}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('display');
        ${section_2_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_2_display}         inline-block
            BuiltIn.Should contain  ${section_2_vertical_align}  baseline

Check print case 3column a4 qr
    [Arguments]      ${code}  ${qr_3column_a4}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'คิวอาร์โค้ด 3 คอลัมน์ (A4)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
            BuiltIn.Should contain  ${font_size}   15px
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       1024px
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px 104.667px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_page_break_inside_sec1}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_page_break_inside_sec1}  auto

    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_height_sec2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('height');
            BuiltIn.Should contain  ${inner_height_sec2}  103.927px
        ${inner_page_break_after_sec2}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
        ${inner_page_break_inside_sec2}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
            BuiltIn.Should contain  ${inner_page_break_after_sec2}   auto
            BuiltIn.Should contain  ${inner_page_break_inside_sec2}  avoid

    # เช็ค 1 แถวมี 3 บาร์โค้ด a4 ขนาด 1:3
    ${section_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_padding}  4px 4px 1px
        ${section_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-width');
        ${section_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-color');
        ${section_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-style');
        ${section_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-width');
        ${section_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_1_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_1_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_1_border_right_style}   dashed
    
    ${section_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_2_padding}  4px 4px 1px
        ${section_2_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-width');
        ${section_2_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-color');
        ${section_2_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-style');
        ${section_2_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-width');
        ${section_2_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_2_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_2_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_2_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_2_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_2_border_right_style}   dashed

    ${section_3}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_3_padding}  4px 4px 1px
        ${section_3_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-width');
        ${section_3_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-color');
        ${section_3_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-style');
            BuiltIn.Should contain  ${section_3_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_3_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_3_border_bottom_style}  dashed

    # (ส่วนที่ 1) เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[1]/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${qr_3column_a4 ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}

    ${section_1_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_names_overflow}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('overflow');
        ${section_1_names_max_height}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_1_names_overflow}      hidden
            BuiltIn.Should contain  ${section_1_names_max_height}    42px

    # (ส่วนที่ 1) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_1_qrcode}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[1][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('width');
        ${section_1_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_1_width}   50px
            BuiltIn.Should contain  ${section_1_height}  50px
        ${section_1_display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('display');
        ${section_1_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcode},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_1_display}         inline-block
            BuiltIn.Should contain  ${section_1_vertical_align}  baseline

    # (ส่วนที่ 2) เช็คส่วนของ : ชื่อ
        ${section_2_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[1]/div[contains(@class,'nameview') and text()='**name**']
            &{replace_section_2_name}=  BuiltIn.Create dictionary  **name**=${qr_3column_a4 ['name']}
            ${xpath_section_2_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
                SeleniumLibrary.Wait until element is visible  ${xpath_section_2_name}

        ${section_2_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
            ${section_2_names_overflow}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('overflow');
            ${section_2_names_max_height}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('max-height');
                BuiltIn.Should contain  ${section_2_names_overflow}      hidden
                BuiltIn.Should contain  ${section_2_names_max_height}    42px

    # (ส่วนที่ 2) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_2_qrcode}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[2][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('width');
        ${section_2_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_2_width}   50px
            BuiltIn.Should contain  ${section_2_height}  50px
        ${section_2_display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('display');
        ${section_2_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcode},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_2_display}         inline-block
            BuiltIn.Should contain  ${section_2_vertical_align}  baseline

    # (ส่วนที่ 3) เช็คส่วนของ : ชื่อ
    ${section_3_name}=  BuiltIn.Set variable  //page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td[1]/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_3_name}=  BuiltIn.Create dictionary  **name**=${qr_3column_a4 ['name']}
        ${xpath_section_3_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_name}  ${replace_section_3_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_3_name}

    ${section_3_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_names_overflow}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('overflow');
        ${section_3_names_max_height}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_3_names_overflow}      hidden
            BuiltIn.Should contain  ${section_3_names_max_height}    42px

    # (ส่วนที่ 3) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_3_qrcode}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and @class='smallbriefproductview']/table[@class='smallbriefproductview' and @align='center' and @width='100%']/tbody/tr/td[3][@class='barcodelinearea' and @width='33%']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcode},null).getPropertyValue('width');
        ${section_3_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcode},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_3_width}   50px
            BuiltIn.Should contain  ${section_3_height}  50px
        ${section_3_display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcode},null).getPropertyValue('display');
        ${section_3_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcode},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_3_display}         inline-block
            BuiltIn.Should contain  ${section_3_vertical_align}  baseline

Check print case 1column stk qr
    [Arguments]      ${code}  ${qr_1column_stk}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'คิวอาร์โค้ด 1 คอลัมน์ (สติ๊กเกอร์ 5x3 ซม.)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_width}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_width}       204.094px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_margin}      0px 522.958px 0px 522.948px
            BuiltIn.Should contain  ${outer_font_size}   15px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_height}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('height');
        ${inner_padding_left}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('padding-left');
        ${inner_padding_right}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size},null).getPropertyValue('padding-right');
            BuiltIn.Should contain  ${inner_height}         100px
            BuiltIn.Should contain  ${inner_padding_left}   8px
            BuiltIn.Should contain  ${inner_padding_right}  8px

    # เช็คส่วนของ : ชื่อ
    ${names_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[@class='infosection ']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${names_sec1_display}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('display');
        ${names_sec1_flex_direction}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('flex-direction');
        ${names_sec1_justify_content}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('justify-content');
        ${names_sec1_padding}=          SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${names_sec1_display}          flex
            BuiltIn.Should contain  ${names_sec1_flex_direction}   row
            BuiltIn.Should contain  ${names_sec1_justify_content}  space-between
            BuiltIn.Should contain  ${names_sec1_padding}          10px 0

    ${name_sec2}=  BuiltIn.Set variable  //page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[@class='infosection ']/div[contains(@class,'nameview') and text()='**name**']
        &{replace_name_sec2}=  BuiltIn.Create dictionary  **name**=${qr_1column_stk ['name']}
        ${xpath_name_sec2}=  common_keywords_middle_portal.Auto keyword replace string  ${name_sec2}  ${replace_name_sec2}
            SeleniumLibrary.Wait until element is visible  ${xpath_name_sec2}
        ${names_sec2}=  BuiltIn.Set variable  document.evaluate("${xpath_name_sec2}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
            ${names_sec2_text_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('text-align');
                BuiltIn.Should contain  ${names_sec2_text_align}  left
            ${names_sec2_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('white-space');
            ${names_sec2_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('overflow');
            ${names_sec2_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${names_sec2},null).getPropertyValue('text-overflow');
                BuiltIn.Should contain  ${names_sec2_white_space}    nowrap
                BuiltIn.Should contain  ${names_sec2_overflow}       hidden
                BuiltIn.Should contain  ${names_sec2_text_overflow}  ellipsis
    
    # เช็คส่วนของ : คิวอาร์โค้ด
    ${qrcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='1COL' and @class='smalloneproductview']/div[@class='barcodecontainer']/div[contains(@class,'barcodeview')]/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${qrcodes_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcodes_sec1},null).getPropertyValue('width');
        ${qrcodes_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcodes_sec1},null).getPropertyValue('height');
            BuiltIn.Should contain  ${qrcodes_width}   50px
            BuiltIn.Should contain  ${qrcodes_height}  50px
        ${qrcodes_display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcodes_sec1},null).getPropertyValue('display');
        ${qrcodes_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${qrcodes_sec1},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${qrcodes_display}         inline-block
            BuiltIn.Should contain  ${qrcodes_vertical_align}  baseline

Check print case 3column stk qr
    [Arguments]      ${code}  ${qr_3column_stk}
    [Documentation]  เช็คหน้าพิมพ์เอกสาร 'คิวอาร์โค้ด 3 คอลัมน์ (สติ๊กเกอร์)'

    # เช็คหน้ากระดาษ : ด้านนอก
    ${outer_paper_size}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${outer_font_size}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('font-size');
            BuiltIn.Should contain  ${outer_font_size}   15px
        ${outer_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('width');
            BuiltIn.Should contain  ${outer_width}   600.938px
        ${outer_min_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('min-height');
        ${outer_display}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('display');
        ${outer_position}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('position');
        ${outer_margin}=      SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('margin');
        ${outer_color}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('color');
        ${outer_background}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${outer_paper_size},null).getPropertyValue('background');
            BuiltIn.Should contain  ${outer_min_height}  1043.15px
            BuiltIn.Should contain  ${outer_display}     block
            BuiltIn.Should contain  ${outer_position}    relative
            BuiltIn.Should contain  ${outer_margin}      0px
            BuiltIn.Should contain  ${outer_color}       rgb(0, 0, 0)
            BuiltIn.Should contain  ${outer_background}  rgb(255, 255, 255)

    # เช็คหน้ากระดาษ : ด้านใน
    ${inner_paper_size_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_paper_size_sec1_width}=              SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('width');
        ${inner_paper_size_sec1_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('page-break-inside');
        ${inner_paper_size_sec1_border_collapse}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('border-collapse');
        ${inner_paper_size_sec1_border_spacing}=     SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec1},null).getPropertyValue('border-spacing');
            BuiltIn.Should contain  ${inner_paper_size_sec1_width}              600.938px
            BuiltIn.Should contain  ${inner_paper_size_sec1_page_break_inside}  auto
            BuiltIn.Should contain  ${inner_paper_size_sec1_border_collapse}    separate
            BuiltIn.Should contain  ${inner_paper_size_sec1_border_spacing}     0

    ${inner_paper_size_sec2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${inner_paper_size_sec2_height}=             SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('height');
        ${inner_paper_size_sec2_page_break_inside}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-inside');
        ${inner_paper_size_sec2_page_break_after}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${inner_paper_size_sec2},null).getPropertyValue('page-break-after');
            BuiltIn.Should contain  ${inner_paper_size_sec2_height}             103.927px
            BuiltIn.Should contain  ${inner_paper_size_sec2_page_break_inside}  avoid
            BuiltIn.Should contain  ${inner_paper_size_sec2_page_break_after}   auto
    
    # เช็ค 1 แถวมี 3 บาร์โค้ด stk ขนาด 1:3
    ${section_1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_1_padding}  4px 4px 1px
        ${section_1_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-width');
        ${section_1_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-color');
        ${section_1_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-bottom-style');
        ${section_1_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-width');
        ${section_1_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_1_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_1_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_1_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_1_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_1_border_right_style}   dashed

    ${section_2}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_2_padding}  4px 4px 1px
        ${section_2_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-width');
        ${section_2_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-color');
        ${section_2_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-bottom-style');
        ${section_2_border_right_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-width');
        ${section_2_border_right_style}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2},null).getPropertyValue('border-right-style');
            BuiltIn.Should contain  ${section_2_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_2_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_2_border_bottom_style}  dashed
            BuiltIn.Should contain  ${section_2_border_right_width}   0.666667px
            BuiltIn.Should contain  ${section_2_border_right_style}   dashed

    ${section_3}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_padding}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('padding');
            BuiltIn.Should contain  ${section_3_padding}  4px 4px 1px
        ${section_3_border_bottom_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-width');
        ${section_3_border_bottom_color}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-color');
        ${section_3_border_bottom_style}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3},null).getPropertyValue('border-bottom-style');
            BuiltIn.Should contain  ${section_3_border_bottom_width}  0.666667px
            BuiltIn.Should contain  ${section_3_border_bottom_color}  rgb(0, 0, 0)
            BuiltIn.Should contain  ${section_3_border_bottom_style}  dashed
    
    # (ส่วนที่ 1) เช็คส่วนของ : ชื่อ
    ${section_1_name}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_1_name}=  BuiltIn.Create dictionary  **name**=${qr_3column_stk ['name']}
        ${xpath_section_1_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_1_name}  ${replace_section_1_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_1_name}
    ${section_1_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_1_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_names_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('width');
            BuiltIn.Should contain  ${section_1_names_width}  160px
        ${section_1_names_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_1_names_max_height}  42px
        ${section_1_names_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('white-space');
        ${section_1_names_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('overflow');
        ${section_1_names_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_names},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_1_names_white_space}    nowrap
            BuiltIn.Should contain  ${section_1_names_overflow}       hidden
            BuiltIn.Should contain  ${section_1_names_text_overflow}  ellipsis
    
    # (ส่วนที่ 1) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_1_qrcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[1][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_1_qrcodes_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcodes_sec1},null).getPropertyValue('width');
        ${section_1_qrcodes_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcodes_sec1},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_1_qrcodes_width}   50px
            BuiltIn.Should contain  ${section_1_qrcodes_height}  50px
        ${section_1_qrcodes_display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcodes_sec1},null).getPropertyValue('display');
        ${section_1_qrcodes_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_1_qrcodes_sec1},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_1_qrcodes_display}         inline-block
            BuiltIn.Should contain  ${section_1_qrcodes_vertical_align}  baseline

    # (ส่วนที่ 2) เช็คส่วนของ : ชื่อ
    ${section_2_name}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_2_name}=  BuiltIn.Create dictionary  **name**=${qr_3column_stk ['name']}
        ${xpath_section_2_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_2_name}  ${replace_section_2_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_2_name}
    ${section_2_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_2_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_names_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('width');
            BuiltIn.Should contain  ${section_2_names_width}  160px
        ${section_2_names_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_2_names_max_height}  42px
        ${section_2_names_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('white-space');
        ${section_2_names_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('overflow');
        ${section_2_names_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_names},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_2_names_white_space}    nowrap
            BuiltIn.Should contain  ${section_2_names_overflow}       hidden
            BuiltIn.Should contain  ${section_2_names_text_overflow}  ellipsis

    # (ส่วนที่ 2) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_2_qrcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[2][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_2_qrcodes_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcodes_sec1},null).getPropertyValue('width');
        ${section_2_qrcodes_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcodes_sec1},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_2_qrcodes_width}   50px
            BuiltIn.Should contain  ${section_2_qrcodes_height}  50px
        ${section_2_qrcodes_display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcodes_sec1},null).getPropertyValue('display');
        ${section_2_qrcodes_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_2_qrcodes_sec1},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_2_qrcodes_display}         inline-block
            BuiltIn.Should contain  ${section_2_qrcodes_vertical_align}  baseline
    
    # (ส่วนที่ 3) เช็คส่วนของ : ชื่อ
    ${section_3_name}=  BuiltIn.Set variable  //page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[1]/td/div[contains(@class,'nameview') and text()='**name**']
        &{replace_section_3_name}=  BuiltIn.Create dictionary  **name**=${qr_3column_stk ['name']}
        ${xpath_section_3_name}=  common_keywords_middle_portal.Auto keyword replace string  ${section_3_name}  ${replace_section_3_name}
            SeleniumLibrary.Wait until element is visible  ${xpath_section_3_name}
    ${section_3_names}=  BuiltIn.Set variable  document.evaluate("${xpath_section_3_name}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_names_width}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('width');
            BuiltIn.Should contain  ${section_3_names_width}  160px
        ${section_3_names_max_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('max-height');
            BuiltIn.Should contain  ${section_3_names_max_height}  42px
        ${section_3_names_white_space}=    SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('white-space');
        ${section_3_names_overflow}=       SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('overflow');
        ${section_3_names_text_overflow}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_names},null).getPropertyValue('text-overflow');
            BuiltIn.Should contain  ${section_3_names_white_space}    nowrap
            BuiltIn.Should contain  ${section_3_names_overflow}       hidden
            BuiltIn.Should contain  ${section_3_names_text_overflow}  ellipsis

    # (ส่วนที่ 3) เช็คส่วนของ : คิวอาร์โค้ด
    ${section_3_qrcodes_sec1}=  BuiltIn.Set variable  document.evaluate("//page[@size='A4' and contains(@class,'smallbriefproductview')]/table[@width='100%' and @align='center' and @class='smallbriefproductview w159']/tbody/tr/td[3][@width='33%' and @class='barcodelinearea']/table[@width='100%']/tbody/tr/td/table[@cellpadding='0' and @width='100%']/tbody/tr[2]/td[@colspan='2']/span[@class='barcodeview']/span[contains(@class,'qrcodeproduct')]/canvas[@width='256' and @height='256']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
        ${section_3_qrcodes_width}=   SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcodes_sec1},null).getPropertyValue('width');
        ${section_3_qrcodes_height}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcodes_sec1},null).getPropertyValue('height');
            BuiltIn.Should contain  ${section_3_qrcodes_width}   50px
            BuiltIn.Should contain  ${section_3_qrcodes_height}  50px
        ${section_3_qrcodes_display}=         SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcodes_sec1},null).getPropertyValue('display');
        ${section_3_qrcodes_vertical_align}=  SeleniumLibrary.Execute javascript  return window.getComputedStyle(${section_3_qrcodes_sec1},null).getPropertyValue('vertical-align');
            BuiltIn.Should contain  ${section_3_qrcodes_display}         inline-block
            BuiltIn.Should contain  ${section_3_qrcodes_vertical_align}  baseline