
*** Variables ***
&{xpath_detail_text}          this_year=//div[@class='text-right']/h2[text()='ยอดขายปีนี้ (บาท)']/following-sibling::p[normalize-space(text())='**summarize**']
...                           this_month=//div[@class='text-right']/h2[text()='ยอดขายเดือนนี้ (บาท)']/following-sibling::p[normalize-space(text())='**summarize**']
...                           code=//h1[@class='title-page']/span[text()='(รหัส : **value**)']
...                           name=//span[text()='ชื่อ']/ancestor::div[@class='row']//span[text()='**value**']
...                           telephone_number=//span[text()='เบอร์โทรศัพท์']/ancestor::div[@class='row']//span[text()='**value**']
...                           mobile_number=//span[text()='เบอร์โทรศัพท์มือถือ']/ancestor::div[@class='row']//span[text()='**value**']
...                           fax_number=//span[text()='เบอร์โทรสาร']/ancestor::div[@class='row']//span[text()='**value**']
...                           email=//span[text()='อีเมล']/ancestor::div[@class='row']//span[text()='**value**']
...                           address=//span[text()='ที่อยู่']/ancestor::div[@class='row']//span[text()='**value**']
...                           taxpayer=//span[text()='เลขผู้เสียภาษี']/ancestor::div[@class='row']//span[text()='**value**']
...                           branch_name=//span[text()='ชื่อสาขา']/ancestor::div[@class='row']//span[text()='**value**']
...                           branch_number=//span[text()='เลขที่สาขา']/ancestor::div[@class='row']//span[text()='**value**']
...                           line=//div/div/span[text()='**value**']
...                           facebook=//div/div/span[text()='**value**']
...                           instagram=//div/div/span[text()='**value**']
&{xpath_detail_button}        buy_in=//div[@id='checkboxrecordarea0']//a[text()='ซื้อสินค้าเข้า']
...                           sell_out=//div[@id='checkboxrecordarea0']//a[text()='ขายสินค้าออก']

&{xpath_detail_table_text}    type=(//a[text()='**code**']/ancestor::tr/td)[2][text()='**type**']
...                           date=(//a[text()='**code**']/ancestor::tr/td)[4][normalize-space(text())='วันนี้']
...                           amount=(//a[text()='**code**']/ancestor::tr/td)[5][normalize-space(text())='**amount**']
...                           payment=(//a[text()='**code**']/ancestor::tr/td)[6]/span[text()='สำเร็จ']
...                           transfer=(//a[text()='**code**']/ancestor::tr/td)[7]/span[text()='ชำระครบ']
&{xpath_detail_table_input}   search_list=//label[text()='ค้นหา']/following-sibling::input[@id='quicksearchtext']

&{xpath_detail_graph_text}    graph_data=(//div[@id='stockChart']//*[name()='svg']/*[name()='g'])[1]/*[name()='g'][@column-id='**data**']
&{xpath_detail_graph_button}  select_graph=//span[text()='ยอดขาย รายสินค้า']/ancestor::div//select[@id='typecontactoption']


*** Keywords ***
Click buy in product
    [Documentation]  คลิกปุ่ม 'ซื้อสินค้าเข้า'
    DobbyWebCommon.Click element when ready  ${xpath_detail_button.buy_in}

Click sell out product
    [Documentation]  คลิกปุ่ม 'ขายสินค้าออก'
    DobbyWebCommon.Click element when ready  ${xpath_detail_button.sell_out}
    light_portal_common_keywords.Wait for jquery loading completed

Click select graph product
    [Documentation]  คลิกปุ่ม 'กราฟสินค้า'
    SeleniumLibrary.Select from list by label  ${xpath_detail_graph_button.select_graph}  รายสินค้า

Click select graph category
    [Documentation]  คลิกปุ่ม 'กราฟหมวดหมู่'
    SeleniumLibrary.Select from list by label  ${xpath_detail_graph_button.select_graph}  รายหมวดหมู่

Quick search list
    [Arguments]      ${code_list}
    [Documentation]  ค้นหารายการซื้อขาย
    DobbyWebCommon.Input text to element when ready  ${xpath_detail_table_input.search_list}  ${code_list}
    SeleniumLibrary.Press keys  None  RETURN
    light_portal_common_keywords.Wait for jquery loading completed

Check summarize of sales this year
    [Arguments]      ${summarize}
    [Documentation]  เช็คผลลัพธ์ 'ยอดขายปีนี้'
    &{str_replace}=  BuiltIn.Create dictionary  **summarize**=${summarize}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_text.this_year}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check summarize of sales this month
    [Arguments]      ${summarize}
    [Documentation]  เช็คผลลัพธ์ 'ยอดขายเดือนนี้'
    &{str_replace}=  BuiltIn.Create dictionary  **summarize**=${summarize}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_text.this_month}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check data contact
    [Arguments]      ${key}  ${value}
    [Documentation]  เช็ค 'ข้อมูล' ในหน้ารายละเอียด
    &{str_replace}=  BuiltIn.Create dictionary  **value**=${value}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_text.${key}}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check graph contact
    [Arguments]      ${data}
    [Documentation]  เช็ค 'กราฟ' ในหน้ารายละเอียด
    &{str_replace}=  BuiltIn.Create dictionary  **data**=${data}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_graph_text.graph_data}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check table contact of type column
    [Arguments]      ${code}  ${type}
    [Documentation]  เช็คคอลัมน์ 'ประเภท' ในหน้ารายละเอียด
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}  **type**=${type}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_table_text.type}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check table contact of date column
    [Arguments]      ${code}
    [Documentation]  เช็คคอลัมน์ 'วันที่' ในหน้ารายละเอียด
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_table_text.date}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check table contact of amount column
    [Arguments]      ${code}  ${amount}
    [Documentation]  เช็คคอลัมน์ 'วันที่' ในหน้ารายละเอียด
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}  **amount**=${amount}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_table_text.amount}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check table contact of payment column
    [Arguments]      ${code}
    [Documentation]  เช็คคอลัมน์ 'วันที่' ในหน้ารายละเอียด
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_table_text.payment}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}

Check table contact of transfer column
    [Arguments]      ${code}
    [Documentation]  เช็คคอลัมน์ 'วันที่' ในหน้ารายละเอียด
    &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpath_detail_table_text.transfer}  ${str_replace}
    DobbyWebCommon.Wait until element is visible except stale  ${new_xpath}