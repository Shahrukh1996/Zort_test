*** Variables ***
&{light_portal_connect_detail___sec1__input}   confirm_text_sec1=//h3[starts-with(text(),'ยืนยันการนำเข้าข้อมูลสินค้าจาก') and @id='myModalLabel']/ancestor::div[@class='modal-content']/div[@class='modal-body']//input[@id='confirmproducttext']
&{light_portal_connect_detail___sec1__button}  update_sec1=//span[text()='นำเข้าข้อมูลสินค้า']/ancestor::div[@class='col-md-6']//a[@id='syncproduct_id']/span[text()='อัพเดท']
...                                            confirm_update_sec1=//h3[starts-with(text(),'ยืนยันการนำเข้าข้อมูลสินค้าจาก') and @id='myModalLabel']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']

&{light_portal_connect_detail___sec2__input}   confirm_text_sec2=//h3[starts-with(text(),'ยืนยันการอัพเดทรูปภาพสินค้าจาก') and @id='myModalLabel']/ancestor::div[@class='modal-content']/div[@class='modal-body']//input[@id='confirmproducttext']
&{light_portal_connect_detail___sec2__button}  update_sec2=//span[text()='อัพเดทรูปภาพสินค้า']/ancestor::div[@class='col-md-6']//a/span[text()='อัพเดท']
...                                            confirm_update_sec2=//h3[starts-with(text(),'ยืนยันการอัพเดทรูปภาพสินค้าจาก') and @id='myModalLabel']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']

&{light_portal_connect_detail___sec3__button}  update_sec3=//span[text()='เชื่อมต่อข้อมูลสินค้า']/ancestor::div[@class='col-md-6']//a/span[text()='อัพเดท']
...                                            confirm_update_sec3=//p[starts-with(text(),'เชื่อมต่อข้อมูลสินค้า') and @id='confirmmsg']/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']

&{light_portal_connect_detail___sec4__input}   confirm_text_sec4=//h3[starts-with(text(),'ยืนยันการนำเข้าข้อมูลรายการขายจาก') and @id='myModalLabel']/ancestor::div[@class='modal-content']/div[@class='modal-body']//input[@id='confirmordertext']
&{light_portal_connect_detail___sec4__button}  update_sec4=//span[text()='นำเข้าข้อมูลรายการขายย้อนหลัง ']/ancestor::div[@class='col-md-6']//a[@id='syncorder_id']/span[text()='อัพเดท']
...                                            confirm_update_sec4=//h3[starts-with(text(),'ยืนยันการนำเข้าข้อมูลรายการขายจาก') and @id='myModalLabel']/ancestor::div[@class='modal-content']/div[@class='modal-footer']//button[text()='ยืนยัน']

&{light_portal_connect_detail___setting__text}  ele_topic_dis_setting=//h2[text()='รายละเอียดการตั้งค่า']


*** Keywords ***
Update data sec1
    [Documentation]  อัปเดตข้อมูล 'sec1'
    Log  [คลิกปุ่มอัปเดต]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec1__button.update_sec1}
    Sleep  2s
    Log  [กรอกข้อความยืนยัน]
    SeleniumLibrary.Input text  ${light_portal_connect_detail___sec1__input.confirm_text_sec1}  confirm
    Log  [คลิกปุ่มยืนยัน]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec1__button.confirm_update_sec1}
    Sleep  5s

Update data sec2
    [Documentation]  คลิกปุ่ม 'อัปเดตข้อมูล sec2'
    Log  [คลิกปุ่มอัปเดต]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec2__button.update_sec2}
    Sleep  2s
    Log  [กรอกข้อความยืนยัน]
    SeleniumLibrary.Input text  ${light_portal_connect_detail___sec2__input.confirm_text_sec2}  confirm
    Log  [คลิกปุ่มยืนยัน]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec2__button.confirm_update_sec2}
    Sleep  5s

Update data sec3
    [Documentation]  คลิกปุ่ม 'อัปเดตข้อมูล sec3'
    SeleniumLibrary.Scroll element into view  ${light_portal_connect_detail___setting__text.ele_topic_dis_setting}
    Log  [คลิกปุ่มอัปเดต]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec3__button.update_sec3}
    Sleep  2s
    Log  [คลิกปุ่มยืนยัน]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec3__button.confirm_update_sec3}
    Sleep  5s

Update data sec4
    [Documentation]  คลิกปุ่ม 'อัปเดตข้อมูล sec4'
    SeleniumLibrary.Scroll element into view  ${light_portal_connect_detail___setting__text.ele_topic_dis_setting}
    Log  [คลิกปุ่มอัปเดต]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec4__button.update_sec4}
    Sleep  2s
    Log  [กรอกข้อความยืนยัน]
    SeleniumLibrary.Input text  ${light_portal_connect_detail___sec4__input.confirm_text_sec4}  confirm
    Log  [คลิกปุ่มยืนยัน]
    SeleniumLibrary.Click element  ${light_portal_connect_detail___sec4__button.confirm_update_sec4}
    Sleep  5s