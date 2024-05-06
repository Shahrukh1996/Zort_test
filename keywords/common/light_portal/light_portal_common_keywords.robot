*** Variables ***
${common.btn_notification}      id=notificationarea
${common.btn_goto_months_page}  xpath=//div[contains(@class,'datetimepicker-dropdown-bottom-right') and contains(@style,'display: block')]//div[@class='datetimepicker-days']//th[@class='switch']
${common.btn_goto_years_page}   xpath=//div[contains(@class,'datetimepicker-dropdown-bottom-right') and contains(@style,'display: block')]//div[@class='datetimepicker-months']//th[@class='switch']
${common.btn_select_year}       xpath=//div[contains(@class,'datetimepicker-dropdown-bottom-right') and contains(@style,'display: block')]//span[contains(@class,'year') and text()='**YEAR**']
${common.btn_select_month}      xpath=//div[contains(@class,'datetimepicker-dropdown-bottom-right') and contains(@style,'display: block')]//span[contains(@class,'month')][**MONTH**]
${common.btn_select_day}        xpath=//div[contains(@class,'datetimepicker-dropdown-bottom-right') and contains(@style,'display: block')]//td[contains(@class,'day') and text()='**DAY**']
${common.btn_select_hour}       xpath=//div[contains(@class,'datetimepicker-dropdown-bottom-right') and contains(@style,'display: block')]//span[contains(@class,'hour') and contains(text(),'**HOUR**:')]
${common.btn_select_minute}     xpath=//div[contains(@class,'datetimepicker-dropdown-bottom-right') and contains(@style,'display: block')]//span[contains(@class,'minute') and contains(text(),':**MINUTE**')]
${common.ddl_kebab_menu}        xpath=//div[@class='btn-etc dropdown open']

&{xpt_date_input}               year=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-years']//th[@class='switch']/ancestor::table/tbody//span[text()='///YEAR///']
...                             month=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-months']//th[@class='switch']/ancestor::table/tbody//span[///MONTH///]
...                             day=//div[@class='datetimepicker-months']//th[@class='switch']/ancestor::table/tbody//span[///MONTH///]/ancestor::div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-days']//tbody//td[text()='///DAY///']
&{xpt_date_button}              select_month=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-days']//th[@class='switch']
...                             select_year=//div[contains(@class,'datetimepicker') and contains(@style,'display: block')]//div[@class='datetimepicker-months']//th[@class='switch']

&{xpt_time_input}               hour=//div[@class='datetimepicker-hours' and @style='display: block;']//span[contains(@class, 'hour') and text()='///HOUR///']
...                             minute=//div[@class='datetimepicker-minutes' and @style='display: block;']//span[contains(@class, 'minute') and text()='///MINUTE///']

&{xpt_toast_text}               element_toast_success=//div[@id='toast-container']
...                             title_toast_success=//div[@id='toast-container']//div[@class='toast-title']

# --- information --------->
&{light_portal_common_keywords___information__input}  name=//label[text()='รายการ ']/following-sibling::div/input[@id='number']
...                                                   create_date=//label[text()='วันที่ ']/following-sibling::div//span[@class='glyphicon glyphicon-calendar']
...                                                   expire_date=//label[text()='วันหมดอายุ']/following-sibling::div//span[@class='glyphicon glyphicon-calendar']

# --- contact --------->
&{light_portal_common_keywords___contact__input}      search=//input[@id='quicksearchcontacttext']
&{light_portal_common_keywords___contact__button}     add_contact=//label[text()='ชื่อลูกค้า']/following-sibling::div//span[@class='typeahead__button']//i
...                                                   select_contact=//td[@class='name']/span[contains(normalize-space(.),'(รหัส : **code** )')]/ancestor::tr/td[@class='text-right vertical-align']/a[text()='เลือก']

# --- product --------->
&{light_portal_common_keywords___product__text}     ele_topic_product=//div[@class='box-white']//span[text()='สินค้า']
...                                                 ele_add_product=//div[@id='tour-productlist']//span[text()='เพิ่มสินค้า']
...                                                 ele_field_delivery=//label[text()='ช่องทางจัดส่ง']
&{light_portal_common_keywords___product__input}    single_search=//input[@id='quicksearchproducttext']
...                                                 multi_search=//input[@id='quicksearchMultiproducttext']
...                                                 code=//tr[@id='prow**index**']/td[@class='id']//span/input
...                                                 name=//tr[@id='prow**index**']/td[@class='name']//span/input
...                                                 amount=//tr[@id='prow**index**']/td[@class='amount']//input
...                                                 price=//tr[@id='prow**index**']/td[@class='value']//input
...                                                 discount=//tr[@id='prow**index**']/td[@class='discount']//input
&{light_portal_common_keywords___product__button}   single_add_product=//div[@id='tour-productlist']//span[text()='เพิ่มสินค้า']
...                                                 single_select_product=//tbody//tr[@id='prow**index**']/td/a[text()='เลือก']
...                                                 single_confirm_product=//tbody/tr/td//div[contains(text(),'**name**')]/ancestor::tr/td[@class='text-right']/a[text()='เลือก']
...                                                 multi_add_product=//a[text()='เลือกสินค้า']
...                                                 multi_select_product=//div[@id='multiproductdialog']//table/tbody/tr/td//div[contains(text(),'**name**')]/ancestor::tr/td[@class='index']//input
...                                                 multi_confirm_product=//div[@id='multiproductdialog']//button[text()='เลือกสินค้า']

# --- delivery --------->
&{light_portal_common_keywords___delivery__text}    ele_field_netPrice=//p[text()='มูลค่ารวมสุทธิ']
...                                                 ele_field_description=//label[text()='หมายเหตุ']
&{light_portal_common_keywords___delivery__input}   description=//label[text()='หมายเหตุ']/ancestor::div[@class='form-group']//textarea[@id='description']
&{light_portal_common_keywords___delivery__button}  check_box=//span[text()='เก็บเงินปลายทาง']/ancestor::div[@class='form-group']//input[@id='codstatus']
...                                                 add_channel=//label[text()='ช่องทางจัดส่ง']/ancestor::div[@class='form-group']//input[@id='shippingchannel']
...                                                 select_channel=//ul[@class='typeahead__list']/li//span[text()='**channel** ']

# --- transfer --------->
&{light_portal_common_keywords___transfer__text}    ele_field_confirm=//div[@id='tour-save']
&{light_portal_common_keywords___transfer__button}  wait_type_store=//input[@id='warehousetype0']
...                                                 wait_add_store=//div[@id='warehouseidarea0']//button[@data-id='warehouseid0']
...                                                 wait_select_store=//div[@id='warehouseidarea0']//div[@class='dropdown-menu open']/ul/li/a/span[text()='**warehouse**']
...                                                 now_type_store=//input[@id='warehousetype1']
...                                                 now_add_store=//div[@id='warehouseidarea']//button[@data-id='warehouseid']
...                                                 now_select_store=//div[@id='warehouseidarea']//div[@class='dropdown-menu open']/ul/li/a/span[text()='**warehouse**']


*** Keywords ***
Open zortout website
    [Documentation]  Open zortout Website
    Set library search order  SeleniumLibrary
    DobbyWebCommon.Open chrome browser  ${remoteUrl}

Close zortout website
    [Documentation]  Close zortout website
    # DobbyWebCommon.Default test teardown
    SeleniumLibrary.Close all browsers
    # DobbyWebCommon.Close all browsers and stop proxy server

Scroll to top of page
    [Documentation]  Scroll to top of page
    SeleniumLibrary.Execute javascript  window.scrollTo(0,0)

Scroll to bottom of page
    [Documentation]  Scroll to bottom of page
    SeleniumLibrary.Execute javascript  window.scrollTo(0, document.body.scrollHeight)

# Close website and delete data
#     [Arguments]  ${order_number}
#     light_portal_common_keywords.Wait for last element of any page is displayed
#     # light_portal_sell___list_page.Click short task manager
#     light_portal_detail_sell_list_page.Verify sell template on sell list data not visible on page  ${order_number}
#     light_portal_common_keywords.Close zortout website
#     # DobbyWebCommon.Close all browsers and stop proxy server

Wait for last element of any page is displayed
    DobbyWebCommon.Wait until element is visible except stale  ${common.btn_notification}

Wait for jquery loading completed
    [Arguments]  ${timeout}=30
        FOR  ${i}  IN RANGE  ${timeout}
            ${loading_complated}=  SeleniumLibrary.Execute javascript  return window.jQuery.active === 0;
            Exit for loop if  ${loading_complated}
        END
        BuiltIn.Sleep  2s

Click datepicker goto year page
    [Documentation]  Click datepicker goto year page
    DobbyWebCommon.Click element when ready  ${common.btn_goto_months_page}
    DobbyWebCommon.Click element when ready  ${common.btn_goto_years_page}

Click select year from datepicker
    [Documentation]  Click select year from datepicker
    [Arguments]  ${year}
    ${year}  BuiltIn.Convert to string  ${year}
    ${locator}  String.Replace string  ${common.btn_select_year}  **YEAR**  ${year}
    DobbyWebCommon.Click element when ready  ${locator}

Click select month from datepicker
    [Documentation]  Click select month from datepicker
    [Arguments]  ${month}
    ${month}  BuiltIn.Evaluate  int('${month}')
    ${month}  BuiltIn.Convert to string  ${month}
    ${locator}  String.Replace string  ${common.btn_select_month}  **MONTH**  ${month}
    DobbyWebCommon.Click element when ready  ${locator}

Click select date from datepicker
    [Documentation]  Click select date from date picker
    [Arguments]  ${day}
    ${day}  BuiltIn.Evaluate  int('${day}')
    ${day}  BuiltIn.Convert to string  ${day}
    ${locator}  String.Replace string  ${common.btn_select_day}  **DAY**  ${day}
    DobbyWebCommon.Click element when ready  ${locator}

Click select hour from datepicker
    [Documentation]  Click select hour from date picker
    [Arguments]  ${hour}
    ${hour}  BuiltIn.Convert to string  ${hour}
    ${locator}  String.Replace string  ${common.btn_select_hour}  **HOUR**  ${hour}
    DobbyWebCommon.Click element when ready  ${locator}

Click select minute from datepicker
    [Documentation]  Click select minute from date picker
    [Arguments]  ${minute}
    ${minute}  BuiltIn.Convert to string  ${minute}
    ${locator}  String.Replace string  ${common.btn_select_minute}  **MINUTE**  ${minute}
    DobbyWebCommon.Click element when ready  ${locator}

Click select datepicker date month and year
    [Documentation]  Click select datepicker date month and year
    [Arguments]  ${day}  ${month}  ${year}
    light_portal_common_keywords.Click datepicker goto year page
    light_portal_common_keywords.Click select year from datepicker  ${year}
    light_portal_common_keywords.Click select month from datepicker  ${month}
    light_portal_common_keywords.Click select date from datepicker  ${day}

Get current day
    [Documentation]  ดึง 'วันที่' ปัจจุบัน
    ${current_date}  DateTime.Get current date  result_format=%d
    [Return]  ${current_date}

Get current month
    [Documentation]  ดึง 'เดือน' ปัจจุบัน
    ${current_month}  DateTime.Get current date  result_format=%m
    [Return]  ${current_month}

Get current year
    [Documentation]  ดึง 'ปี' ปัจจุบัน
    ${current_year}  DateTime.Get current date  result_format=%Y
    ${current_year}  BuiltIn.Evaluate  ${current_year}+543
    [Return]  ${current_year}

Convert thai month to index
    [Arguments]  ${month}
    IF  '${month}' == 'มกราคม'
        ${month_index}  Set variable  01
    ELSE IF  '${month}' == 'กุมภาพันธ์'
        ${month_index}  Set variable  02
    ELSE IF  '${month}' == 'มีนาคม'
        ${month_index}  Set variable  03
    ELSE IF  '${month}' == 'เมษายน'
        ${month_index}  Set variable  04
    ELSE IF  '${month}' == 'พฤษภาคม'
        ${month_index}  Set variable  05
    ELSE IF  '${month}' == 'มิถุนายน'
        ${month_index}  Set variable  06
    ELSE IF  '${month}' == 'กรกฎาคม'
        ${month_index}  Set variable  07
    ELSE IF  '${month}' == 'สิงหาคม'
        ${month_index}  Set variable  08
    ELSE IF  '${month}' == 'กันยายน'
        ${month_index}  Set variable  09
    ELSE IF  '${month}' == 'ตุลาคม'
        ${month_index}  Set variable  10
    ELSE IF  '${month}' == 'พฤศจิกายน'
        ${month_index}  Set variable  11
    ELSE IF  '${month}' == 'ธันวาคม'
        ${month_index}  Set variable  12
    END
    [Return]  ${month_index}

Back to previous page
    [Documentation]  Back to previous page
    SeleniumLibrary.Go back

Wait until kebab menu is visible
    [Documentation]  Wait until kebab menu is visible
    DobbyWebCommon.Wait until element is visible except stale  ${common.ddl_kebab_menu}

Close toast success
    [Documentation]  กดปิด toast success
    DobbyWebCommon.Click element when ready  ${xpt_toast_text.title_toast_success}

Scroll to header of page
    [Documentation]  เลื่อนไปยังบนสุดของหน้าเว็บฯ
    SeleniumLibrary.Execute javascript  window.scrollTo(0,0)
    Sleep  2s

Scroll to footer of page
    [Documentation]  เลื่อนไปยังล่างสุดของหน้าเว็บฯ
    SeleniumLibrary.Execute javascript  window.scrollTo(0, document.body.scrollHeight)
    Sleep  2s

Auto keyword remove dom chat support
    [Documentation]  ลบ dom el ส่วนของ chat support
    execute javascript  
    ...  var element_1 = document.querySelector('[title="Button to launch messaging window"]');
    ...  element_1.parentNode.removeChild(element_1);
    ...  var element_2 = document.querySelector('div[style^="display: flex; flex-direction: column;"]');
    ...  element_2.parentNode.removeChild(element_2);
    Sleep  2s

Auto keyword random string
    [Arguments]      ${str_befor}
    [Documentation]  สุ่มข้อความ 4 digit
    ${str_random}=  String.Generate random string  4  [UPPER][NUMBERS]
    ${str_after}=  BuiltIn.Set Variable  ${str_befor}${str_random}
    [Return]  ${str_after}

Auto keyword verify toast success
    [Documentation]  เช็ค toast ในช่วง 5s
    light_portal_common_keywords.Wait for jquery loading completed
    SeleniumLibrary.Wait until element is not visible  ${xpt_toast_text.element_toast_success}  timeout=5

Auto keyword wait element
    [Arguments]  ${element}
    [Documentation]  รอปรากฎ element
        FOR  ${i}  IN RANGE  10
            ${result}=  BuiltIn.Run keyword and return status  SeleniumLibrary.Wait until element is visible  ${element}
            Exit for loop if  ${result}
        END
    BuiltIn.Sleep  5s

Auto keyword clear input text
    [Arguments]      ${xpt_input}
    [Documentation]  เคลียร์ข้อมูลใน text-box
    SeleniumLibrary.Wait until element is visible  ${xpt_input}
    BuiltIn.Sleep  2s
    SeleniumLibrary.Click element  ${xpt_input}
    ${value}=  SeleniumLibrary.Get element attribute  ${xpt_input}  value
    ${backspaces count}=  BuiltIn.Get length  ${value}
    Run Keyword If  """${value}""" != ''
    ...      BuiltIn.Repeat keyword  ${backspaces count +1}  SeleniumLibrary.Press keys  ${xpt_input}  \\08

Auto keyword datepicker
    [Arguments]      ${date}
    [Documentation]  เลือก 'วันเดือนปี'
        SeleniumLibrary.Click element  ${xpt_date_button.select_month}
        SeleniumLibrary.Click element  ${xpt_date_button.select_year}
        &{str_replace}=  BuiltIn.Create dictionary  ///DAY///=${date ['day']}  ///MONTH///=${date ['month']}  ///YEAR///=${date ['year']}

        ${new_xpath_year}=  light_portal_common_keywords.Auto keyword replace string  ${xpt_date_input.year}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath_year}

        ${new_xpath_month}=  light_portal_common_keywords.Auto keyword replace string  ${xpt_date_input.month}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath_month}

        ${new_xpath_day}=  light_portal_common_keywords.Auto keyword replace string  ${xpt_date_input.day}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath_day}

    # FOR  ${keys}  IN  @{date.keys()}
    #         &{str_replace}=  BuiltIn.Create dictionary  ///DAY///=${date ['day']}  ///MONTH///=${date ['month']}  ///YEAR///=${date ['year']}
    #         ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpt_date_input.${keys}}  ${str_replace}
    #         SeleniumLibrary.Click element  ${new_xpath}
    # END

Auto keyword timepicker
    [Arguments]      ${time}
    [Documentation]  เลือกเวลา timepicker
    FOR  ${keys}  IN  @{time.keys()}
        &{str_replace}=  BuiltIn.Create dictionary  ///MINUTE///=${time ['minute']}  ///HOUR///=${time ['hour']}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${xpt_time_input.${keys}}  ${str_replace}
        DobbyWebCommon.Click element when ready  ${new_xpath}
    END

Auto keyword replace string
    [Arguments]      ${xpt_change_befor}  ${str_data_change}
    [Documentation]  จัดการแปลง str
    ${xpt_result}=  Create List
    @{keys}=  Collections.Get Dictionary Keys  ${str_data_change}  sort_keys=${False}
    FOR  ${index}  IN  @{keys}
            IF  '${index}' == '${keys}[0]'
                    ${xpt_change_after}=  String.Replace String  ${xpt_change_befor}  ${index}  ${str_data_change}[${index}]
                    ${xpt_result}=  BuiltIn.Set Variable  ${xpt_change_after}
            ELSE
                ${xpt_result}=  String.Replace String  ${xpt_result}  ${index}  ${str_data_change}[${index}]
            END
    END
    [Return]  ${xpt_result}

# --- information --------->

Auto keyword input name information
    [Arguments]      ${name}
    [Documentation]  กรอก 'ชื่อรายการ'
        light_portal_common_keywords.Auto keyword clear input text  ${light_portal_common_keywords___information__input.name}
        ${name_sell}=  light_portal_common_keywords.Auto keyword random string  ${name}
        SeleniumLibrary.Input text  ${light_portal_common_keywords___information__input.name}  ${name_sell}
    [Return]  ${name_sell}

Auto keyword select create date information
    [Arguments]      ${date}
    [Documentation]  กรอก 'วันที่สร้าง'
        SeleniumLibrary.Click element  ${light_portal_common_keywords___information__input.create_date}
        light_portal_common_keywords.Auto keyword datepicker  ${date}

Auto keyword select expire date information
    [Arguments]      ${date}
    [Documentation]  กรอก 'วันหมดอายุ'
        SeleniumLibrary.Click element  ${light_portal_common_keywords___information__input.expire_date}
        light_portal_common_keywords.Auto keyword datepicker  ${date}

Auto keyword expect data for multi list
    [Arguments]      ${actual}  ${expect}
    [Documentation]  เปลี่ยบเทียบแบบหลายข้อมูล
        ${result}=  BuiltIn.Create List
        FOR  ${item}  IN  @{expect}
            Run Keyword If  '${actual}' == '${item}'    Collections.Append to list  ${result}  1
            ...    ELSE    Collections.Append to list  ${result}  0
        END

# --- contact --------->

Auto keyword input contact by custom
    [Arguments]      ${data}
    [Documentation]  เพิ่มแบบ 'กำหนดเอง'

Auto keyword select contact from system
    [Arguments]      ${code}
    [Documentation]  เพิ่มแบบ 'เลือกจากระบบ'
        Log  [ดูผู้ติดต่อ]
                SeleniumLibrary.Click element  ${light_portal_common_keywords___contact__button.add_contact}
                light_portal_common_keywords.Wait for jquery loading completed
        Log  [ค้นหาผู็ติดต่อ]
                SeleniumLibrary.Input text  ${light_portal_common_keywords___contact__input.search}  ${code}
                SeleniumLibrary.Press keys  None  ENTER
        Log  [เลือกผู้ติดต่อ]
                &{str_replace}=  BuiltIn.Create dictionary  **code**=${code}
                ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___contact__button.select_contact}  ${str_replace}
                light_portal_common_keywords.Auto keyword wait element  ${new_xpath}
                SeleniumLibrary.Click element  ${new_xpath}

# --- product --------->

Auto keyword input product by custom
    [Arguments]      ${list}  ${data}
    [Documentation]  กรอกข้อมูล 'สินค้า แบบ กำหนดเอง'
        SeleniumLibrary.Scroll element into view   ${light_portal_common_keywords___product__text.ele_field_delivery}
        IF  ${list} > 1
                Log  [เพิ่มรายการสินค้า]
                SeleniumLibrary.Click element  ${light_portal_common_keywords___product__button.single_add_product}
        END

        FOR  ${keys}  IN  @{data.keys()}
                Log  [กรอกข้อมูล '${keys}']
                ${list_str}=  BuiltIn.Convert to string  ${list}
                &{str_replace}=  BuiltIn.Create dictionary  **index**=${list_str}
                ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___product__input.${keys}}  ${str_replace}
                SeleniumLibrary.Input text  ${new_xpath}  ${data ['${keys}']}
                SeleniumLibrary.Click element  ${light_portal_common_keywords___product__text.ele_topic_product}
                Sleep  1s
        END

Auto keyword select product from single list
    [Arguments]      ${list}  ${name}
    [Documentation]  เลือก 'สินค้า แบบ รายการเดี่ยว'
        SeleniumLibrary.Scroll element into view   ${light_portal_common_keywords___product__text.ele_field_delivery}
        IF  ${list} > 1
                Log  [เพิ่มรายการสินค้า]
                SeleniumLibrary.Click element  ${light_portal_common_keywords___product__button.single_add_product}
        END

        Log  [ดูสินค้า]
        ${list_str}=  BuiltIn.Convert to string  ${list}
        &{replace_list}=  BuiltIn.Create dictionary  **index**=${list_str}
        ${xpath_select_product}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___product__button.single_select_product}  ${replace_list}
        SeleniumLibrary.Click element  ${xpath_select_product}
        light_portal_common_keywords.Wait for jquery loading completed

        Log  [ค้นหาสินค้า]
        SeleniumLibrary.Input text  ${light_portal_common_keywords___product__input.single_search}  ${name}
        SeleniumLibrary.Press keys  None  ENTER
        Sleep  2s

        Log  [เลือกสินค้า]
        &{replace_name}=  BuiltIn.Create dictionary  **name**=${name}
        ${xpath_confirm_product}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___product__button.single_confirm_product}  ${replace_name}
        SeleniumLibrary.Click element  ${xpath_confirm_product}

Auto keyword select product from multi list
    [Arguments]      ${name}
    [Documentation]  เลือก 'สินค้า แบบ หลายรายการ'
        Log  [ดูสินค้า]
        SeleniumLibrary.Scroll element into view   ${light_portal_common_keywords___product__text.ele_field_delivery}
        SeleniumLibrary.Click element  ${light_portal_common_keywords___product__button.multi_add_product}
        light_portal_common_keywords.Wait for jquery loading completed

        Log  [ค้นหาสินค้า]
        SeleniumLibrary.Input text  ${light_portal_common_keywords___product__input.multi_search}  ${name}
        SeleniumLibrary.Press keys  None  ENTER
        Sleep  2s

        Log  [เลือกสินค้า]
        &{replace_name}=  BuiltIn.Create dictionary  **name**=${name}
        ${xpath_select_product}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___product__button.multi_select_product}  ${replace_name}
        SeleniumLibrary.Click element  ${xpath_select_product}
        Sleep  2s
        SeleniumLibrary.Click element  ${light_portal_common_keywords___product__button.multi_confirm_product}

# --- delivery --------->

Auto keyword click pay on destination
    [Documentation]  คลิก 'เก็บเงินปลายทาง'
    SeleniumLibrary.Scroll element into view  ${light_portal_common_keywords___delivery__text.ele_field_netPrice}
    SeleniumLibrary.Click element  ${light_portal_common_keywords___delivery__button.check_box}

Auto keyword input description delivery
    [Arguments]      ${description}
    [Documentation]  กรอก 'รายละเอียดเพิ่มเติม'
    SeleniumLibrary.Scroll element into view  ${light_portal_common_keywords___delivery__text.ele_field_netPrice}
    SeleniumLibrary.Input text  ${light_portal_common_keywords___delivery__input.description}  ${description}

Auto keyword input channel delivery
    [Arguments]      ${channel}
    [Documentation]  เลือก 'ขนส่ง'
    SeleniumLibrary.Scroll element into view  ${light_portal_common_keywords___delivery__text.ele_field_netPrice}
    SeleniumLibrary.Click element  ${light_portal_common_keywords___delivery__button.add_channel}
    Sleep  5s
    &{str_replace}=  BuiltIn.Create dictionary  **channel**=${channel}
    ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___delivery__button.select_channel}  ${str_replace}
    SeleniumLibrary.Click element  ${new_xpath}

# --- transfer --------->

Auto keyword select transfer from wait
    [Arguments]      ${store}
    [Documentation]  เลือก 'โอนสินค้าภายหลัง'
        SeleniumLibrary.Scroll element into view   ${light_portal_common_keywords___transfer__text.ele_field_confirm}
        Log  [เลือกประเภทโอน]
        SeleniumLibrary.Click element  ${light_portal_common_keywords___transfer__button.wait_type_store}
        SeleniumLibrary.Click element  ${light_portal_common_keywords___transfer__button.wait_add_store}
        Log  [เลือกคลัง]
        &{str_replace}=  BuiltIn.Create dictionary  **warehouse**=${store}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___transfer__button.wait_select_store}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}

Auto keyword select transfer from now
    [Arguments]      ${store}
    [Documentation]  เลือก 'โอนสินค้าทันที'
        SeleniumLibrary.Scroll element into view   ${light_portal_common_keywords___transfer__text.ele_field_confirm}
        Log  [เลือกประเภทโอน]
        SeleniumLibrary.Click element  ${light_portal_common_keywords___transfer__button.now_type_store}
        SeleniumLibrary.Click element  ${light_portal_common_keywords___transfer__button.now_add_store}
        Log  [เลือกคลัง]
        &{str_replace}=  BuiltIn.Create dictionary  **warehouse**=${store}
        ${new_xpath}=  light_portal_common_keywords.Auto keyword replace string  ${light_portal_common_keywords___transfer__button.now_select_store}  ${str_replace}
        SeleniumLibrary.Click element  ${new_xpath}