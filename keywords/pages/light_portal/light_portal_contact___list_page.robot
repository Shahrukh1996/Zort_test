
*** Variables ***
&{xpath_list_text}    nomall_column_code=(//tbody/tr)[**indexNo**]/td[@class='id']/span[text()='**code**']
...                   nomall_column_email=(//tbody/tr)[**indexNo**]/td[@class='email']/span[text()='**email**']
...                   nomall_column_taxpayer=(//tbody/tr)[**indexNo**]/td[@class='taxid']/span[text()='**taxpayer**']
...                   nomall_column_telephone=(//tbody/tr)[**indexNo**]/td[@class='tel']/span[text()='**telephone**']
...                   nomall_column_name=(//tbody/tr)[**indexNo**]/td[@class='name']/div/a/span[text()='**name**']
...                   nomall_column_name_tag=(//tbody/tr)[**indexNo**]/td[@class='name']/div/span[text()='**tag**']
...                   nomall_column_name_branch=(//tbody/tr)[**indexNo**]/td[@class='name']//small[text()=' (**branch**)']
...                   nomall_column_name_social=(//tbody/tr)[**indexNo**]/td[@class='name']//div[@class='d-block']/span[text()='**social**']
...                   hiding_column_code=(//tbody/tr)[**indexNo**]/td[@class='id']/s/span[text()='**code**']
...                   hiding_column_email=(//tbody/tr)[**indexNo**]/td[@class='email']/s/span[text()='**email**']
...                   hiding_column_taxpayer=(//tbody/tr)[**indexNo**]/td[@class='taxid']/s/span[text()='**taxpayer**']
...                   hiding_column_telephone=(//tbody/tr)[**indexNo**]/td[@class='tel']/s/span[text()='**telephone**']
...                   hiding_column_name=(//tbody/tr)[**indexNo**]/td[@class='name']/s/span[text()='**name**']
...                   hiding_column_name_tag=(//tbody/tr)[**indexNo**]/td[@class='name']/div/span[text()='**tag**']
...                   hiding_column_name_branch=(//tbody/tr)[**indexNo**]/td[@class='name']//small[text()=' (**branch**)']
...                   hiding_column_name_social=(//tbody/tr)[**indexNo**]/td[@class='name']//div[@class='d-block']/span[text()='**social**']
...                   column_indexID_by_code=//tbody/tr/td[@class='id']/span[text()='**code**']/ancestor::tr/td[@class='index']/span
...                   column_indexID_by_indexNo=(//tbody/tr/td[@class='index'])[**indexNo**]/span
...                   column_code_by_indexID=(//tbody/tr/td[@class='index'])/span[@id='**indexID**']/ancestor::tr/td[@class='id']/span
...                   tag_contact=//div[@class='search-advance__body']//div[@class='form-group']//label[text()='Tag ผู้ติดต่อ']
...                   column_code_delete=(//tbody/tr)[1]/td[@class='id']/span[text()='**code**']
...                   list_not_found=//div[@class='t-responsive']//a[text()='เพิ่มผู้ติดต่อใหม่ได้ที่นี่']
&{xpath_list_button}  add_contact=//button[text()='เพิ่มผู้ติดต่อใหม่']
...                   edit_contact=//tbody/tr/td[@class='action text-right']/div[@class='btn-etc dropdown open']/ul[@aria-labelledby='**indexID**']/li/a[text()='แก้ไข']
...                   delete_contact=//tbody/tr/td[@class='action text-right']/div[@class='btn-etc dropdown open']/ul[@aria-labelledby='**indexID**']/li/a[text()='ลบ']
...                   pin_it=//tbody/tr/td[@class='action text-right']/div[@class='btn-etc dropdown open']/ul[@aria-labelledby='**indexID**']/li/a[text()='ปักหมุดไว้บนสุด']
...                   un_pin=//tbody/tr/td[@class='action text-right']/div[@class='btn-etc dropdown open']/ul[@aria-labelledby='**indexID**']/li/a[text()='ถอนหมุดจากบนสุด']
...                   kbub=//tbody/tr/td[@class='action text-right']/div[@class='btn-etc dropdown']/i[@id='**indexID**']
...                   add_advanced_search=//a[@id='btn-advance-search' and text()='ค้นหาขั้นสูง']
...                   confirm_advanced_search=//div[@class='search-advance__header']//input[@value='ค้นหา']
...                   add_import_contact=//button[text()='นำเข้าไฟล์ (Excel)']
...                   choose_file=//h3[contains(text(), 'นำเข้าผู้ติดต่อใหม่')]/ancestor::div[@class='modal-content']/div[@class='modal-body']//input[@id='fFile']
...                   confirm_import_contact=//h3[contains(text(), 'นำเข้าผู้ติดต่อใหม่')]/ancestor::div[@class='modal-content']/div[@class='modal-footer ']/button[text()='บันทึก']
...                   confirm_delete_contact=//p[@id='confirmmsg' and contains(text(),'ยืนยันการลบ')]/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']
...                   category_tab=//div[@id='ContactTable']//div[@class='tabsbar']/ul/li//a[text()='**tab**']
...                   check_box_list=//tbody/tr/td[@class='id']/span[text()='**code**']/ancestor::tr/td[@class='chk']//span[@id='notext']/input
...                   order_list=//div[@id='checkboxrecordarea4']/button[text()='คำสั่ง ']
...                   add_to_category=//div[@id='checkboxrecordarea4']/ul/li/a[text()='เพิ่มเข้าหมวดหมู่']
...                   subtract_category=//div[@id='checkboxrecordarea4']/ul/li/a[text()='ถอนออกจากหมวดหมู่']
...                   detail_contact=//tbody/tr/td[@class='id']/span[text()='**code**']/ancestor::tr/td[@class='name']//a

&{xpath_list_category_input}   name=//div[@class='form-group']//label[text()='หมวดหมู่']/ancestor::div[@class='row']//input[@id='txt_groupname']
&{xpath_list_category_button}  add_category=//div[@id='ContactTable']//div[@class='tabsbar']/ul/li//a[text()='+ เพิ่มหมวดหมู่']
...                            confirm_add_category=//div[@class='modal-header']//h3[text()='เพิ่มหมวดหมู่']/ancestor::div[@class='modal-content']//div[@class='modal-footer']/button[text()='เพิ่ม']
...                            select_category=//div[@class='form-group']/label[text()=' หมวดหมู่ ']/ancestor::div[@class='form-group']//select[@id='selectgroupid']
...                            confirm_select_category=//div[@class='modal-header']//h3[contains(text(),'จัดหมวดหมู่')]/ancestor::div[@class='modal-content']//div[@class='modal-footer ']/button[text()='เพิ่ม']
...                            overview_category=//a[text()='ดูภาพรวม **name** >>']
...                            order_category=//div[@class='btn-group']/button[text()='คำสั่ง ']
...                            delete_category=//div[@class='btn-group open']/ul/li/a[text()='ถอนออกจากหมวดหมู่']
...                            confirm_delete_category=//div[@class='modal-header']/h3[text()='ยืนยันการลบหมวดหมู่']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']

&{xpath_list_quick_input}      quick_search=//label[text()='ค้นหา']/following-sibling::input[@id='quicksearchtext']

&{xpath_list_advanced_input}  code=//div[@class='search-advance__body']//div[@class='form-group']/input[@id='searchcode' and @placeholder='รหัสผู้ติดต่อ']
...                           telephone_number=//div[@class='search-advance__body']//div[@class='form-group']/input[@id='searchphone' and @placeholder='เบอร์โทรศัพท์ผู้ติดต่อ']
...                           name=//div[@class='search-advance__body']//div[@class='form-group']/input[@id='searchname' and @placeholder='ชื่อผู้ติดต่อ']
...                           email=//div[@class='search-advance__body']//div[@class='form-group']/input[@id='searchemail' and @placeholder='อีเมลผู้ติดต่อ']
...                           group=//div[@class='search-advance__body']//div[@class='form-group']/select[@id='searchtierpriceid']
...                           tag=//div[@class='search-advance__body']//div[@class='form-group']/label[text()='Tag ผู้ติดต่อ']/following-sibling::div[@class='bootstrap-tagsinput']/input
...                           check_box=//div[@class='search-advance__body']//div[@class='form-group']//input[@id='checkshowarchive']


*** Keywords ***
Click confirm popUp delete
    [Documentation]  คลิกปุ่ม 'ยืนยัน'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.confirm_delete_contact}

Click advanced search contact
    [Documentation]  คลิกปุ่ม 'ค้นหาแบบขั้นสูง'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.add_advanced_search}

Click confirm advanced search contact
    [Documentation]  คลิกปุ่ม 'ค้นหา'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.confirm_advanced_search}

Click add import contact
    [Documentation]  คลิกปุ่ม 'นำเข้าไฟล์'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.add_import_contact}

Click confirm import contact
    [Documentation]  คลิกปุ่ม 'บันทึก'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.confirm_import_contact}

Click add category
    [Documentation]  คลิกปุ่ม 'เพิ่มหมวดหมู่'
    DobbyWebCommon.Click element when ready  ${xpath_list_category_button.add_category}

Click confirm add category
    [Documentation]  คลิกปุ่ม 'เพิ่ม'
    DobbyWebCommon.Click element when ready  ${xpath_list_category_button.confirm_add_category}
    light_portal_common_keywords.Wait for jquery loading completed

Click add list to category
    [Documentation]  คลิกปุ่ม คำสั่ง 'เพิ่มเข้าหมวดหมู่'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.order_list}
    DobbyWebCommon.Click element when ready  ${xpath_list_button.add_to_category}

Click subtract from category
    [Documentation]  คลิกปุ่ม คำสั่ง 'ถอนออกจากหมวดหมู่'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.order_list}
    DobbyWebCommon.Click element when ready  ${xpath_list_button.subtract_category}

Click select category
    [Arguments]      ${name}
    [Documentation]  คลิกปุ่ม 'เลือกหมวดหมู่'
    SeleniumLibrary.Select from list by label  ${xpath_list_category_button.select_category}  ${name}

Click confirm select category
    [Documentation]  คลิกปุ่ม 'เพิ่ม'
    DobbyWebCommon.Click element when ready  ${xpath_list_category_button.confirm_select_category}

Click category tab
    [Arguments]      ${tab}
    [Documentation]  คลิกปุ่ม 'แท็บหมวดหมู่'
    &{str_replace}=  BuiltIn.Create dictionary  **tab**=${tab}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.category_tab}  ${str_replace}
    DobbyWebCommon.Click element when ready  ${new_xpath}

Click check box list by code
    [Arguments]      ${code}
    [Documentation]  คลิกปุ่ม 'เช็คบล็อกรายการ' โดยอ้างอิง code
    Sleep  2s
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.check_box_list}  ${str_replace}
    DobbyWebCommon.Click element when ready  ${new_xpath}

Click overview category
    [Arguments]      ${name}
    [Documentation]  คลิกปุ่ม 'ดูภาพรวม ${name} >>'
    &{str_replace}=  BuiltIn.Create dictionary  **name**=${name}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_category_button.overview_category}  ${str_replace}
    DobbyWebCommon.Click element when ready  ${new_xpath}
    light_portal_common_keywords.Wait for jquery loading completed

Click delete category
    [Documentation]  คลิกปุ่ม 'ถอนออกจากหมวดหมู่'
    DobbyWebCommon.Click element when ready  ${xpath_list_category_button.order_category}
    DobbyWebCommon.Click element when ready  ${xpath_list_category_button.delete_category}
    Sleep  2s
    DobbyWebCommon.Click element when ready  ${xpath_list_category_button.confirm_delete_category}
    light_portal_common_keywords.Wait for jquery loading completed

Click add contact
    [Documentation]  คลิกปุ่ม 'เพิ่มผู้ติดต่อ'
    DobbyWebCommon.Click element when ready  ${xpath_list_button.add_contact}

Click edit contact
    [Arguments]      ${indexID}
    [Documentation]  คลิกปุ่ม 'แก้ไขผู้ติดต่อ'
    &{str_replace}=  BuiltIn.Create dictionary  **indexID**=${indexID}  notext=
    ${new_xpath_kbub}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.kbub}  ${str_replace}
    ${new_xpath_edit}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.edit_contact}  ${str_replace}
    DobbyWebCommon.Click element when ready  ${new_xpath_kbub}
    DobbyWebCommon.Click element when ready  ${new_xpath_edit}

Click detail contact
    [Arguments]  ${code}
    [Documentation]  คลิกปุ่ม 'ดูรายละเอียดผู้ติดต่อ'
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.detail_contact}  ${str_replace}
    DobbyWebCommon.Click element when ready  ${new_xpath}

Click pin it contact
    [Arguments]      ${indexID}
    [Documentation]  คลิกปุ่ม 'ปักหมุดผู้ติดต่อ'
    &{str_replace}=  BuiltIn.Create dictionary  **indexID**=${indexID}  notext=
    ${new_xpath_kbub}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.kbub}  ${str_replace}
    ${new_xpath_pinIn}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.pin_it}  ${str_replace}
    DobbyWebCommon.Click element when ready  ${new_xpath_kbub}
    DobbyWebCommon.Click element when ready  ${new_xpath_pinIn}

Click un pin contact
    [Arguments]      ${indexID}
    [Documentation]  คลิกปุ่ม 'ถอดหมุดผู้ติดต่อ'
    &{str_replace}=  BuiltIn.Create dictionary  **indexID**=${indexID}  notext=
    ${new_xpath_kbub}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.kbub}  ${str_replace}
    ${new_xpath_unPin}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.un_pin}  ${str_replace}
    light_portal_common_keywords.Scroll to header of page
    DobbyWebCommon.Click element when ready  ${new_xpath_kbub}
    DobbyWebCommon.Click element when ready  ${new_xpath_unPin}

Click delete contact
    [Arguments]      ${indexID}
    [Documentation]  คลิกปุ่ม 'ลบผู้ติดต่อ'
    &{str_replace}=  BuiltIn.Create dictionary  **indexID**=${indexID}  notext=
    ${new_xpath_kbub}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.kbub}  ${str_replace}
    ${new_xpath_delete}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.delete_contact}  ${str_replace}
    DobbyWebCommon.Click element when ready  ${new_xpath_kbub}
    DobbyWebCommon.Click element when ready  ${new_xpath_delete}

Choose file contact
    [Documentation]  นำเข้าไฟล์ผู้ติดต่อ
    ${path}=  OperatingSystem.Join path  ${CURDIR}/../../../resources/testdata/light_portal/contact_template.xlsx
    DobbyWebCommon.Browse file when ready  ${xpath_list_button.choose_file}  ${path}

Quick search contact
    [Arguments]      ${contact_data}
    [Documentation]  ค้นหาผู้ติดต่อแบบ 'ปกติ'
    DobbyWebCommon.Input text to element when ready  ${xpath_list_quick_input.quick_search}  ${contact_data}
    SeleniumLibrary.Press keys  None  RETURN
    light_portal_common_keywords.Wait for jquery loading completed

Get indexID by code
    [Arguments]      ${code}
    [Documentation]  เก็บ 'indexID' ของรายการ โดยอ้างอิง code
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.column_indexID_by_code}  ${str_replace}
    ${indexID}  SeleniumLibrary.Get element attribute  ${new_xpath}  id
    [Return]  ${indexID}

Get indexID and code by indexNo
    [Arguments]      ${indexNo}
    [Documentation]  เก็บ 'indexID' ของรายการ โดยอ้างอิง indexNo
    &{str_replace_indexNo}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}
    ${new_xpath_indexID}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.column_indexID_by_indexNo}  ${str_replace_indexNo}
    ${indexID}  SeleniumLibrary.Get element attribute  ${new_xpath_indexID}  id
    &{str_replace_indexID}=  BuiltIn.Create dictionary  **indexID**=${indexID}
    ${new_xpath_code}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.column_code_by_indexID}  ${str_replace_indexID}
    ${code}  SeleniumLibrary.Get element attribute  ${new_xpath_code}  title
    [Return]  ${indexID}  ${code}

Check contact list for pin
    [Arguments]      ${indexNo}  ${code}
    [Documentation]  เช็ครายการ 'ผู้ติดต่อที่ปักหมุด'
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_code}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check code contact
    [Arguments]      ${type_list}  ${indexNo}  ${code}
    [Documentation]  เช็คคอลัมน์ 'รหัสผู้ติดต่อ'
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **code**=${code}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_code}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_code}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check name contact
    [Arguments]      ${type_list}  ${indexNo}  ${name}
    [Documentation]  เช็คคอลัมน์ 'ชื่อผู้ติดต่อ'
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **name**=${name}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_name}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_name}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check branch contact
    [Arguments]      ${type_list}  ${indexNo}  ${branch}
    [Documentation]  เช็คคอลัมน์ ชื่อผู้ติดต่อ (สาขา)
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **branch**=${branch}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_name_branch}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_name_branch}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check social contact
    [Arguments]      ${type_list}  ${indexNo}  ${social}
    [Documentation]  เช็คคอลัมน์ ชื่อผู้ติดต่อ (โซเชียล)
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **social**=${social}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_name_social}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_name_social}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check tag contact
    [Arguments]      ${type_list}  ${indexNo}  ${tag}
    [Documentation]  เช็คคอลัมน์ ชื่อผู้ติดต่อ (แท็ก)
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **tag**=${tag}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_name_tag}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_name_tag}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check taxpayer contact
    [Arguments]      ${type_list}  ${indexNo}  ${taxpayer}
    [Documentation]  เช็คคอลัมน์ 'เลขผู้เสียภาษี'
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **taxpayer**=${taxpayer}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_taxpayer}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_taxpayer}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check telephone contact
    [Arguments]      ${type_list}  ${indexNo}  ${telephone}
    [Documentation]  เช็คคอลัมน์ 'เบอร์โทรศัพท์'
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **telephone**=${telephone}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_telephone}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_telephone}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check email contact
    [Arguments]      ${type_list}  ${indexNo}  ${email}
    [Documentation]  เช็คคอลัมน์ 'อีเมล'
    &{str_replace}=  BuiltIn.Create dictionary  **indexNo**=${indexNo}  **email**=${email}
    IF  '${type_list}' == 'nomall'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.nomall_column_email}  ${str_replace}
    ELSE IF  '${type_list}' == 'hiding'
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.hiding_column_email}  ${str_replace}
    END
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check code contact at delete
    [Arguments]      ${code}
    [Documentation]  เช็คคอลัมน์ 'รหัสผู้ติดต่อที่ลบออก'
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_text.column_code_delete}  ${str_replace}
    SeleniumLibrary.Wait until element is not visible  ${new_xpath}

Check list not found
    [Documentation]  เช็คเมื่อไม่มีรายการผู้ติดต่อ
    DobbyWebCommon.Wait until element is visible except stale  ${xpath_list_text.list_not_found}

Check category tab not found
    [Arguments]      ${tab}
    [Documentation]  เช็คเมื่อไม่มีหมวดหมู่
    &{str_replace}=  BuiltIn.Create dictionary  **tab**=${tab}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_list_button.category_tab}  ${str_replace}
    SeleniumLibrary.Wait until element is not visible  ${new_xpath}

Input data of add category
    [Arguments]      ${name}
    [Documentation]  กรอกข้อมูล 'สร้างหมวดหมู่'
    DobbyWebCommon.Input text to element when ready  ${xpath_list_category_input.name}  ${name}

Input data of advanced search contact
    [Arguments]      ${advanced_search}
    [Documentation]  กรอกข้อมูล 'ค้นหาขั้นสูง'
    FOR  ${index}  IN  @{advanced_search.keys()}
        IF  '${index}' == 'group'
            SeleniumLibrary.Select from list by label  ${xpath_list_advanced_input.${index}}  ${advanced_search ['${index}']}
        ELSE IF  '${index}' == 'tag'
            DobbyWebCommon.Input text to element when ready  ${xpath_list_advanced_input.${index}}  ${advanced_search ['${index}']}
            DobbyWebCommon.Click element when ready  ${xpath_list_text.tag_contact}
        ELSE IF  '${index}' == 'check_box'
            IF  ${advanced_search ['${index}']} == True
                DobbyWebCommon.Click element when ready  ${xpath_list_advanced_input.${index}}
            END
        ELSE
            DobbyWebCommon.Input text to element when ready  ${xpath_list_advanced_input.${index}}  ${advanced_search ['${index}']}
        END
    END