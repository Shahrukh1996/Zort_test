*** Variables ***

# --- text --------->
&{light_portal_product_set_detail___text}  header_page=//section[@id='main1']//div[@class='content']//h1[contains(normalize-space(.),'รายละเอียดสินค้า')]
...                                        pop_up___confirm_activate=//p[@id='confirmmsg' and contains(text(), 'ยืนยันเปิดการใช้งานสินค้าเป็นชุด')]
...                                        pop_up___confirm_delete=//p[@id='confirmmsg' and contains(text(), 'ยืนยันการลบสินค้า')]/ancestor::div[@class='modal-content']
# --- button --------->
&{light_portal_product_set_detail___button}  edit=//a/span[text()='แก้ไข']
...                                          delete=//a/span[text()='ลบ']
...                                          confirm_delete=//p[contains(text(), 'ยืนยันการลบสินค้า')]/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']
...                                          oeder_all=//div[@class='btn-group']/button/span[text()='คำสั่ง']
...                                          order_activate=//div[@class='btn-group open']/ul/li/a[text()='เปิดการใช้งาน']
...                                          confirm_activate=//p[@id='confirmmsg' and contains(text(), 'ยืนยันเปิดการใช้งานสินค้าเป็นชุด')]/ancestor::div[@class='modal-content']/div[@class='modal-footer ']//button[text()='ยืนยัน']


*** Keywords ***

Check header page
    [Documentation]  เช็คความพร้อม 'หน้ารายละเอียดสินค้าชุด'
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_product_set_detail___text.header_page}

Check pop up delete
    [Documentation]  เช็คความพร้อม 'ป๊อบอัพยืนยันลบ'
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_product_set_detail___text.pop_up___confirm_delete}

Click edit
    [Documentation]  กดปุ่ม 'แก้ไข'
        Sleep  2s
        SeleniumLibrary.Click element  ${light_portal_product_set_detail___button.edit}
        light_portal_product_set___edit_page.Check header page

Click delete
    [Documentation]  กดปุ่ม 'ลบ'
        Sleep  2s
        SeleniumLibrary.Click element  ${light_portal_product_set_detail___button.delete}
        light_portal_product_set___detail_page.Check pop up delete

Click confirm delete
    [Documentation]  กดปุ่ม 'ยืนยันลบ'
        SeleniumLibrary.Click element  ${light_portal_product_set_detail___button.confirm_delete}
        light_portal_common_keywords.Wait for jquery loading completed

Click order all
    [Documentation]  กดปุ่ม 'คำสั่ง'
        SeleniumLibrary.Click element  ${light_portal_product_set_detail___button.oeder_all}

Click order activate
    [Documentation]  กดปุ่ม 'เปิดใช้งาน'
        SeleniumLibrary.Click element  ${light_portal_product_set_detail___button.order_activate}
        light_portal_common_keywords.Auto keyword wait element  ${light_portal_product_set_detail___text.pop_up___confirm_activate}

Activate product set
    [Documentation]  เปิดใช้งานสินค้าชุด
        light_portal_product_set___detail_page.Click order all
        light_portal_product_set___detail_page.Click order activate

Click confirm activate
    [Documentation]  กดปุ่ม 'ยืนยันเปิดใช้งาน'
        SeleniumLibrary.Click element  ${light_portal_product_set_detail___button.confirm_activate}
        light_portal_product_set___detail_page.Check header page