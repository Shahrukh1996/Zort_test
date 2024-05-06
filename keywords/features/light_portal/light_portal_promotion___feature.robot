*** Keywords ***
Create promotion list
    [Arguments]      ${add_promotion}
    [Documentation]  สร้างโปรโมชัน
        light_portal_promotion___list_page.Click create promotion
        ${name_promotion}=  light_portal_promotion___feature.Input data for create promotion  ${add_promotion}
        light_portal_promotion___add_page.Click confirm create promotion
    [Return]  ${name_promotion}

Update promotion list
    [Arguments]      ${name_promotion}  ${edit_promotion}
    [Documentation]  แก้ไขโปรโมชัน
        light_portal_promotion___list_page.Click list promotion by name  ${name_promotion}
        light_portal_promotion___detail_page.Click edit promotion
        light_portal_promotion___feature.Input data for update promotion  ${edit_promotion}
        light_portal_promotion___edit_page.Click confirm update promotion

Expand promotion list
    [Arguments]      ${name_promotion}  ${expand_promotion}
    [Documentation]  ขยายโปรโมชัน
        light_portal_promotion___list_page.Click list promotion by name  ${name_promotion}
        light_portal_promotion___detail_page.Click expand promotion
        light_portal_promotion___feature.Input data for expand promotion  ${expand_promotion}
        light_portal_promotion___detail_page.Click confirm expand promotion

Input data for create promotion
    [Arguments]      ${add_promotion}
    [Documentation]  กรอกข้อมูล 'สร้างโปรโมชัน'
        FOR  ${keys}  IN  @{add_promotion.keys()}
            IF       '${keys}' == 'information'
                        ${name_promotion}=  light_portal_promotion___add_page.Input information  ${add_promotion ['${keys}']}
            ELSE IF  '${keys}' == 'product'
                        light_portal_promotion___add_page.Input product  ${add_promotion ['${keys}']}
            ELSE IF  '${keys}' == 'gift'
                        light_portal_promotion___add_page.Input gift  ${add_promotion ['${keys}']}
            END
        END
    [Return]  ${name_promotion}

Input data for update promotion
    [Arguments]      ${edit_promotion}
    [Documentation]  กรอกข้อมูล 'แก้ไขโปรโมชัน'
        FOR  ${keys}  IN  @{edit_promotion.keys()}
            IF       '${keys}' == 'information'
                        light_portal_promotion___edit_page.Input information  ${edit_promotion ['${keys}']}
            ELSE IF  '${keys}' == 'product'
                        light_portal_promotion___edit_page.Input product  ${edit_promotion ['${keys}']}
            ELSE IF  '${keys}' == 'gift'
                        light_portal_promotion___edit_page.Input gift  ${edit_promotion ['${keys}']}
            END
        END

Input data for expand promotion
    [Arguments]      ${expand_promotion}
    [Documentation]  กรอกข้อมูล 'ขยายโปรโมชัน'
        FOR  ${keys}  IN  @{expand_promotion.keys()}
            IF       '${keys}' == 'end_order'
                        light_portal_promotion___detail_page.Input end order of expand promotion  ${expand_promotion ['${keys}']}
            ELSE IF  '${keys}' == 'gift'
                        light_portal_promotion___detail_page.Input gift of expand promotion  ${expand_promotion ['${keys}']}
            END
        END