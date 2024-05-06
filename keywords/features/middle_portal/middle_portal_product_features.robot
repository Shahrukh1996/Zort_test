*** Keywords ***
Create product list
    [Arguments]      ${add_product}
    [Documentation]  สร้างรายการสินค้า
    FOR  ${index}  IN  @{add_product.keys()}
        IF  '${index}' == 'details_data'
            ${code}=  middle_portal_product_add_page.Input data of section detalis  ${add_product ['${index}']}
        ELSE IF  '${index}' == 'price_data'
            middle_portal_product_add_page.Input data of section price  ${add_product ['${index}']}
        ELSE IF  '${index}' == 'warehouse_data'
            middle_portal_product_add_page.Input data of section warehouse  ${add_product ['${index}']}
        END
    END
    middle_portal_product_add_page.Click confirm add product list
    [Return]  ${code}

Update product list
    [Arguments]      ${code_product}  ${edit_product}
    [Documentation]  แก้ไขรายการสินค้า
    middle_portal_product_detail_page.Click order for edit
    FOR  ${index}  IN  @{edit_product.keys()}
        IF  '${index}' == 'general_data'
            middle_portal_product_edit_page.Click section general
            middle_portal_product_edit_page.Input data of general  ${code_product}  ${edit_product ['${index}']}
            middle_portal_product_edit_page.Click comfirm edit general
            common_keywords_middle_portal.Close toast success
        ELSE IF  '${index}' == 'barcode_data'
            middle_portal_product_edit_page.Click section barcode
            middle_portal_product_edit_page.Click add barcode
            middle_portal_product_edit_page.Input data of barcode  ${code_product}  ${edit_product ['${index}']}
            middle_portal_product_edit_page.Click comfirm edit barcode
        END
    END
    middle_portal_product_edit_page.Click back to product detail

Print barcode
    [Arguments]      ${print_barcode}
    [Documentation]  พิมพ์เอกสารบาร์โค้ด
    middle_portal_product_detail_page.Click order for print barcode
    middle_portal_product_detail_page.Select type print barcode    ${print_barcode ['type']}
    middle_portal_product_detail_page.Select format print barcode  ${print_barcode ['format']}  ${print_barcode ['amount']}
    middle_portal_product_detail_page.Click confirm print barcode
    SeleniumLibrary.Switch window  NEW
    Sleep  2s
    common_keywords_middle_portal.Wait for jquery loading completed

Verify barcode is visible
    [Arguments]      ${code}
    [Documentation]  ตรวจสอบ บาร์โค้ด และ คิวอาร์โค้ด
    middle_portal_product_detail_page.Check qrcode
    middle_portal_product_detail_page.Check barcode  ${code}

Verify barcode is not visible
    [Arguments]      ${code}
    [Documentation]  ตรวจสอบ บาร์โค้ด และ คิวอาร์โค้ด
    middle_portal_product_detail_page.Check is not qrcode
    middle_portal_product_detail_page.Check is not barcode  ${code}

Verify print barcode
    [Arguments]      ${code_product}  ${expect_print_barcode}
    [Documentation]  ตรวจสอบ พิมพ์เอกสารบาร์โค้ด
    FOR  ${index}  IN  @{expect_print_barcode.keys()}
        IF  '${index}' == 'bc_nomall'
            middle_portal_product_detail_page.Check print case nomall bc        ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'bc_catalog'
            middle_portal_product_detail_page.Check print case catalog bc       ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'bc_2column_a4'
            middle_portal_product_detail_page.Check print case 2column a4 bc    ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'bc_3column_a4'
            middle_portal_product_detail_page.Check print case 3column a4 bc    ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'bc_1column_stk'
            middle_portal_product_detail_page.Check print case 1column stk bc   ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'bc_3column_stk'
            middle_portal_product_detail_page.Check print case 3column stk bc   ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'qr_nomall'
            middle_portal_product_detail_page.Check print case nomall qr        ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'qr_catalog'
            middle_portal_product_detail_page.Check print case catalog qr       ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'qr_2column_a4'
            middle_portal_product_detail_page.Check print case 2column a4 qr    ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'qr_3column_a4'
            middle_portal_product_detail_page.Check print case 3column a4 qr    ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'qr_1column_stk'
            middle_portal_product_detail_page.Check print case 1column stk qr   ${code_product}  ${expect_print_barcode ['${index}']}
        ELSE IF  '${index}' == 'qr_3column_stk'
            middle_portal_product_detail_page.Check print case 3column stk qr   ${code_product}  ${expect_print_barcode ['${index}']}
        END
    END