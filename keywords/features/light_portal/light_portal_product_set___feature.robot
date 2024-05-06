*** Keywords ***
Quick search product set
    [Arguments]      ${code}
    [Documentation]  ค้นหาสินค้าชุด
        light_portal_product_set___list_page.Input data for quick search by code  ${code}
        SeleniumLibrary.Press keys  None  ENTER
        light_portal_common_keywords.Wait for jquery loading completed

Activate product set
    [Arguments]      ${code_product_set}
    [Documentation]  เปิดใช้งานสินค้าชุด
        light_portal_product_set___feature.Quick search product set  ${code_product_set}
        light_portal_product_set___list_page.Click product set by code  ${code_product_set}
        light_portal_product_set___detail_page.Click order all
        light_portal_product_set___detail_page.Click order activate
        light_portal_product_set___detail_page.Click confirm activate

Create product set
    [Arguments]      ${add_product_set}
    [Documentation]  สร้างสินค้าชุด
        light_portal_product_set___list_page.Click create product set
        ${code_product_set_cre}=  light_portal_product_set___add_page.Input data for create product set  ${add_product_set}
        light_portal_product_set___add_page.Click confirm create
        light_portal_product_set___add_page.Select product for create product set  ${add_product_set ['product']}
        light_portal_product_set___add_page.Click confirm product
    [Return]  ${code_product_set_cre}

Update product set
    [Arguments]      ${code_product_set}  ${edit_product_set}
    [Documentation]  อัปเดตสินค้าชุด
        light_portal_product_set___feature.Quick search product set  ${code_product_set}
        light_portal_product_set___list_page.Click product set by code  ${code_product_set}
        light_portal_product_set___detail_page.Click edit
        ${code_product_set_ups}=  light_portal_product_set___edit_page.Input data for edit product set  ${tc_97 ['test_data'] ['edit_product_set']}
        light_portal_product_set___edit_page.Click confirm edit
    [Return]  ${code_product_set_ups}

Delete product set
    [Arguments]      ${code_product_set}
    [Documentation]  ลบสินค้าชุด
        light_portal_product_set___feature.Quick search product set  ${code_product_set}
        light_portal_product_set___list_page.Click product set by code  ${code_product_set}
        light_portal_product_set___detail_page.Click delete
        light_portal_product_set___detail_page.Click confirm delete

Verify delete product set
    [Arguments]      ${code_product_set}
    [Documentation]  ตรวจสอบ 'ลบสินค้าชุด'
        light_portal_product_set___feature.Quick search product set  ${code_product_set}
        light_portal_product_set___list_page.Check product set not found