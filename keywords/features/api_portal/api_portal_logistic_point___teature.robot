*** Keywords ***
Data from excel file
    [Documentation]  ดึงข้อมูลจากไฟล์ excel
        # ดึง data จาก flash data
        ${flash_sec1_weight}  ${flash_sec1_size}  ${flash_zone_1}  ${flash_zone_2}  ${flash_zone_3}  ${flash_zone_4}  ${flash_zone_5}  ${flash_sec2_weight}  ${flash_sec2_size}  ${flash_zone_6}  ${flash_zone_7}  ${flash_zone_8}  ${flash_zone_9}  ${flash_zone_10}  ${flash_zone_11}=  logistic_point.read_flash_data
        # ดึง data จาก test case
        ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${remote}  ${tourism}  ${island}  ${zone_1_case_a_weight}  ${zone_1_case_a_size}  ${zone_1_case_b_weight}  ${zone_1_case_b_size}  ${zone_2_case_a_weight}  ${zone_2_case_a_size}  ${zone_2_case_b_weight}  ${zone_2_case_b_size}  ${zone_2_case_c_weight}  ${zone_2_case_c_size}  ${zone_3_case_a_weight}  ${zone_3_case_a_size}  ${zone_3_case_b_weight}  ${zone_3_case_b_size}  ${zone_3_case_c_weight}  ${zone_3_case_c_size}  ${zone_4_case_a_weight}  ${zone_4_case_a_size}  ${zone_4_case_b_weight}  ${zone_4_case_b_size}  ${zone_4_case_c_weight}  ${zone_4_case_c_size}  ${zone_5_case_a_weight}  ${zone_5_case_a_size}  ${zone_5_case_b_weight}  ${zone_5_case_b_size}  ${zone_5_case_c_weight}  ${zone_5_case_c_size}  ${zone_6_case_a_weight}  ${zone_6_case_a_size}  ${zone_6_case_b_weight}  ${zone_6_case_b_size}  ${zone_6_case_c_weight}  ${zone_6_case_c_size}  ${zone_7_case_a_weight}  ${zone_7_case_a_size}  ${zone_7_case_b_weight}  ${zone_7_case_b_size}  ${zone_7_case_c_weight}  ${zone_7_case_c_size}  ${zone_8_case_a_weight}  ${zone_8_case_a_size}  ${zone_8_case_b_weight}  ${zone_8_case_b_size}  ${zone_8_case_c_weight}  ${zone_8_case_c_size}  ${zone_9_case_a_weight}  ${zone_9_case_a_size}  ${zone_9_case_b_weight}  ${zone_9_case_b_size}  ${zone_9_case_c_weight}  ${zone_9_case_c_size}  ${zone_10_case_a_weight}  ${zone_10_case_a_size}  ${zone_10_case_b_weight}  ${zone_10_case_b_size}  ${zone_10_case_c_weight}  ${zone_10_case_c_size}  ${zone_11_case_a_weight}  ${zone_11_case_a_size}  ${zone_11_case_b_weight}  ${zone_11_case_b_size}  ${zone_11_case_c_weight}  ${zone_11_case_c_size}=  logistic_point.read_test_case

        # จัดการ data ส่วนเกิน
        Collections.Remove values from list  ${flash_sec1_weight}  nan
        Collections.Remove values from list  ${flash_sec1_size}    nan
        Collections.Remove values from list  ${flash_zone_1}       nan  sell
        Collections.Remove values from list  ${flash_zone_2}       nan  sell
        Collections.Remove values from list  ${flash_zone_3}       nan  sell
        Collections.Remove values from list  ${flash_zone_4}       nan  sell
        Collections.Remove values from list  ${flash_zone_5}       nan  sell

        Collections.Remove values from list  ${flash_sec2_weight}  nan
        Collections.Remove values from list  ${flash_sec2_size}    nan
        Collections.Remove values from list  ${flash_zone_6}       nan  sell
        Collections.Remove values from list  ${flash_zone_7}       nan  sell
        Collections.Remove values from list  ${flash_zone_8}       nan  sell
        Collections.Remove values from list  ${flash_zone_9}       nan  sell
        Collections.Remove values from list  ${flash_zone_10}      nan  sell
        Collections.Remove values from list  ${flash_zone_11}      nan  sell

        Collections.Remove values from list  ${to_region}    nan  ภูมิภาค
        Collections.Remove values from list  ${to_province}  nan  จังหวัด
        Collections.Remove values from list  ${to_district}  nan  อำเภอ
        Collections.Remove values from list  ${to_parish}    nan  ตำบล
        Collections.Remove values from list  ${to_code}      nan  รหัส

        Collections.Remove values from list  ${remote}   nan  ไกล
        Collections.Remove values from list  ${tourism}  nan  เที่ยว
        Collections.Remove values from list  ${island}   nan  เกาะ

        ${zone_1_from_address}=    BuiltIn.Set variable  ${zone_1_case_a_weight}[1]
        @{zone_1_from_addresss}=   String.Split String   ${zone_1_from_address}
        ${zone_2_from_address}=    BuiltIn.Set variable  ${zone_2_case_a_weight}[1]
        @{zone_2_from_addresss}=   String.Split String   ${zone_2_from_address}
        ${zone_3_from_address}=    BuiltIn.Set variable  ${zone_3_case_a_weight}[1]
        @{zone_3_from_addresss}=   String.Split String   ${zone_3_from_address}
        ${zone_4_from_address}=    BuiltIn.Set variable  ${zone_4_case_a_weight}[1]
        @{zone_4_from_addresss}=   String.Split String   ${zone_4_from_address}
        ${zone_5_from_address}=    BuiltIn.Set variable  ${zone_5_case_a_weight}[1]
        @{zone_5_from_addresss}=   String.Split String   ${zone_5_from_address}
        ${zone_6_from_address}=    BuiltIn.Set variable  ${zone_6_case_a_weight}[1]
        @{zone_6_from_addresss}=   String.Split String   ${zone_6_from_address}
        ${zone_7_from_address}=    BuiltIn.Set variable  ${zone_7_case_a_weight}[1]
        @{zone_7_from_addresss}=   String.Split String   ${zone_7_from_address}
        ${zone_8_from_address}=    BuiltIn.Set variable  ${zone_8_case_a_weight}[1]
        @{zone_8_from_addresss}=   String.Split String   ${zone_8_from_address}
        ${zone_9_from_address}=    BuiltIn.Set variable  ${zone_9_case_a_weight}[1]
        @{zone_9_from_addresss}=   String.Split String   ${zone_9_from_address}
        ${zone_10_from_address}=    BuiltIn.Set variable  ${zone_10_case_a_weight}[1]
        @{zone_10_from_addresss}=   String.Split String   ${zone_10_from_address}
        ${zone_11_from_address}=    BuiltIn.Set variable  ${zone_11_case_a_weight}[1]
        @{zone_11_from_addresss}=   String.Split String   ${zone_11_from_address}

        ${zone_1_case_a_weights}=  BuiltIn.Set variable  ${zone_1_case_a_weight}[3]
        ${zone_1_case_a_sizes}=    BuiltIn.Set variable  ${zone_1_case_a_size}[3]
        ${zone_1_case_b_weights}=  BuiltIn.Set variable  ${zone_1_case_b_weight}[3]
        ${zone_1_case_b_sizes}=    BuiltIn.Set variable  ${zone_1_case_b_size}[3]

        ${zone_2_case_a_weights}=  BuiltIn.Set variable  ${zone_2_case_a_weight}[3]
        ${zone_2_case_a_sizes}=    BuiltIn.Set variable  ${zone_2_case_a_size}[3]
        ${zone_2_case_b_weights}=  BuiltIn.Set variable  ${zone_2_case_b_weight}[3]
        ${zone_2_case_b_sizes}=    BuiltIn.Set variable  ${zone_2_case_b_size}[3]
        ${zone_2_case_c_weights}=  BuiltIn.Set variable  ${zone_2_case_c_weight}[3]
        ${zone_2_case_c_sizes}=    BuiltIn.Set variable  ${zone_2_case_c_size}[3]

        ${zone_3_case_a_weights}=  BuiltIn.Set variable  ${zone_3_case_a_weight}[3]
        ${zone_3_case_a_sizes}=    BuiltIn.Set variable  ${zone_3_case_a_size}[3]
        ${zone_3_case_b_weights}=  BuiltIn.Set variable  ${zone_3_case_b_weight}[3]
        ${zone_3_case_b_sizes}=    BuiltIn.Set variable  ${zone_3_case_b_size}[3]
        ${zone_3_case_c_weights}=  BuiltIn.Set variable  ${zone_3_case_c_weight}[3]
        ${zone_3_case_c_sizes}=    BuiltIn.Set variable  ${zone_3_case_c_size}[3]

        ${zone_4_case_a_weights}=  BuiltIn.Set variable  ${zone_4_case_a_weight}[3]
        ${zone_4_case_a_sizes}=    BuiltIn.Set variable  ${zone_4_case_a_size}[3]
        ${zone_4_case_b_weights}=  BuiltIn.Set variable  ${zone_4_case_b_weight}[3]
        ${zone_4_case_b_sizes}=    BuiltIn.Set variable  ${zone_4_case_b_size}[3]
        ${zone_4_case_c_weights}=  BuiltIn.Set variable  ${zone_4_case_c_weight}[3]
        ${zone_4_case_c_sizes}=    BuiltIn.Set variable  ${zone_4_case_c_size}[3]

        ${zone_5_case_a_weights}=  BuiltIn.Set variable  ${zone_5_case_a_weight}[3]
        ${zone_5_case_a_sizes}=    BuiltIn.Set variable  ${zone_5_case_a_size}[3]
        ${zone_5_case_b_weights}=  BuiltIn.Set variable  ${zone_5_case_b_weight}[3]
        ${zone_5_case_b_sizes}=    BuiltIn.Set variable  ${zone_5_case_b_size}[3]
        ${zone_5_case_c_weights}=  BuiltIn.Set variable  ${zone_5_case_c_weight}[3]
        ${zone_5_case_c_sizes}=    BuiltIn.Set variable  ${zone_5_case_c_size}[3]

        ${zone_6_case_a_weights}=  BuiltIn.Set variable  ${zone_6_case_a_weight}[3]
        ${zone_6_case_a_sizes}=    BuiltIn.Set variable  ${zone_6_case_a_size}[3]
        ${zone_6_case_b_weights}=  BuiltIn.Set variable  ${zone_6_case_b_weight}[3]
        ${zone_6_case_b_sizes}=    BuiltIn.Set variable  ${zone_6_case_b_size}[3]
        ${zone_6_case_c_weights}=  BuiltIn.Set variable  ${zone_6_case_c_weight}[3]
        ${zone_6_case_c_sizes}=    BuiltIn.Set variable  ${zone_6_case_c_size}[3]

        ${zone_7_case_a_weights}=  BuiltIn.Set variable  ${zone_7_case_a_weight}[3]
        ${zone_7_case_a_sizes}=    BuiltIn.Set variable  ${zone_7_case_a_size}[3]
        ${zone_7_case_b_weights}=  BuiltIn.Set variable  ${zone_7_case_b_weight}[3]
        ${zone_7_case_b_sizes}=    BuiltIn.Set variable  ${zone_7_case_b_size}[3]
        ${zone_7_case_c_weights}=  BuiltIn.Set variable  ${zone_7_case_c_weight}[3]
        ${zone_7_case_c_sizes}=    BuiltIn.Set variable  ${zone_7_case_c_size}[3]

        ${zone_8_case_a_weights}=  BuiltIn.Set variable  ${zone_8_case_a_weight}[3]
        ${zone_8_case_a_sizes}=    BuiltIn.Set variable  ${zone_8_case_a_size}[3]
        ${zone_8_case_b_weights}=  BuiltIn.Set variable  ${zone_8_case_b_weight}[3]
        ${zone_8_case_b_sizes}=    BuiltIn.Set variable  ${zone_8_case_b_size}[3]
        ${zone_8_case_c_weights}=  BuiltIn.Set variable  ${zone_8_case_c_weight}[3]
        ${zone_8_case_c_sizes}=    BuiltIn.Set variable  ${zone_8_case_c_size}[3]

        ${zone_9_case_a_weights}=  BuiltIn.Set variable  ${zone_9_case_a_weight}[3]
        ${zone_9_case_a_sizes}=    BuiltIn.Set variable  ${zone_9_case_a_size}[3]
        ${zone_9_case_b_weights}=  BuiltIn.Set variable  ${zone_9_case_b_weight}[3]
        ${zone_9_case_b_sizes}=    BuiltIn.Set variable  ${zone_9_case_b_size}[3]
        ${zone_9_case_c_weights}=  BuiltIn.Set variable  ${zone_9_case_c_weight}[3]
        ${zone_9_case_c_sizes}=    BuiltIn.Set variable  ${zone_9_case_c_size}[3]

        ${zone_10_case_a_weights}=  BuiltIn.Set variable  ${zone_10_case_a_weight}[3]
        ${zone_10_case_a_sizes}=    BuiltIn.Set variable  ${zone_10_case_a_size}[3]
        ${zone_10_case_b_weights}=  BuiltIn.Set variable  ${zone_10_case_b_weight}[3]
        ${zone_10_case_b_sizes}=    BuiltIn.Set variable  ${zone_10_case_b_size}[3]
        ${zone_10_case_c_weights}=  BuiltIn.Set variable  ${zone_10_case_c_weight}[3]
        ${zone_10_case_c_sizes}=    BuiltIn.Set variable  ${zone_10_case_c_size}[3]

        ${zone_11_case_a_weights}=  BuiltIn.Set variable  ${zone_11_case_a_weight}[3]
        ${zone_11_case_a_sizes}=    BuiltIn.Set variable  ${zone_11_case_a_size}[3]
        ${zone_11_case_b_weights}=  BuiltIn.Set variable  ${zone_11_case_b_weight}[3]
        ${zone_11_case_b_sizes}=    BuiltIn.Set variable  ${zone_11_case_b_size}[3]
        ${zone_11_case_c_weights}=  BuiltIn.Set variable  ${zone_11_case_c_weight}[3]
        ${zone_11_case_c_sizes}=    BuiltIn.Set variable  ${zone_11_case_c_size}[3]

        # เพิ่ม data ลง suite setup
        BuiltIn.set suite variable  ${flash_sec1_weight}
        BuiltIn.set suite variable  ${flash_sec1_size}
        BuiltIn.set suite variable  ${flash_zone_1}
        BuiltIn.set suite variable  ${flash_zone_2}
        BuiltIn.set suite variable  ${flash_zone_3}
        BuiltIn.set suite variable  ${flash_zone_4}
        BuiltIn.set suite variable  ${flash_zone_5}

        BuiltIn.set suite variable  ${flash_sec2_weight}
        BuiltIn.set suite variable  ${flash_sec2_size}
        BuiltIn.set suite variable  ${flash_zone_6}
        BuiltIn.set suite variable  ${flash_zone_7}
        BuiltIn.set suite variable  ${flash_zone_8}
        BuiltIn.set suite variable  ${flash_zone_9}
        BuiltIn.set suite variable  ${flash_zone_10}
        BuiltIn.set suite variable  ${flash_zone_11}

        BuiltIn.set suite variable  ${to_region}
        BuiltIn.set suite variable  ${to_province}
        BuiltIn.set suite variable  ${to_district}
        BuiltIn.set suite variable  ${to_parish}
        BuiltIn.set suite variable  ${to_code}

        BuiltIn.set suite variable  ${remote}
        BuiltIn.set suite variable  ${tourism}
        BuiltIn.set suite variable  ${island}

        BuiltIn.set suite variable  ${zone_1_from_addresss}
        BuiltIn.set suite variable  ${zone_1_case_a_weights}
        BuiltIn.set suite variable  ${zone_1_case_a_sizes}
        BuiltIn.set suite variable  ${zone_1_case_b_weights}
        BuiltIn.set suite variable  ${zone_1_case_b_sizes}

        BuiltIn.set suite variable  ${zone_2_from_addresss}
        BuiltIn.set suite variable  ${zone_2_case_a_weights}
        BuiltIn.set suite variable  ${zone_2_case_a_sizes}
        BuiltIn.set suite variable  ${zone_2_case_b_weights}
        BuiltIn.set suite variable  ${zone_2_case_b_sizes}
        BuiltIn.set suite variable  ${zone_2_case_c_weights}
        BuiltIn.set suite variable  ${zone_2_case_c_sizes}

        BuiltIn.set suite variable  ${zone_3_from_addresss}
        BuiltIn.set suite variable  ${zone_3_case_a_weights}
        BuiltIn.set suite variable  ${zone_3_case_a_sizes}
        BuiltIn.set suite variable  ${zone_3_case_b_weights}
        BuiltIn.set suite variable  ${zone_3_case_b_sizes}
        BuiltIn.set suite variable  ${zone_3_case_c_weights}
        BuiltIn.set suite variable  ${zone_3_case_c_sizes}

        BuiltIn.set suite variable  ${zone_4_from_addresss}
        BuiltIn.set suite variable  ${zone_4_case_a_weights}
        BuiltIn.set suite variable  ${zone_4_case_a_sizes}
        BuiltIn.set suite variable  ${zone_4_case_b_weights}
        BuiltIn.set suite variable  ${zone_4_case_b_sizes}
        BuiltIn.set suite variable  ${zone_4_case_c_weights}
        BuiltIn.set suite variable  ${zone_4_case_c_sizes}

        BuiltIn.set suite variable  ${zone_5_from_addresss}
        BuiltIn.set suite variable  ${zone_5_case_a_weights}
        BuiltIn.set suite variable  ${zone_5_case_a_sizes}
        BuiltIn.set suite variable  ${zone_5_case_b_weights}
        BuiltIn.set suite variable  ${zone_5_case_b_sizes}
        BuiltIn.set suite variable  ${zone_5_case_c_weights}
        BuiltIn.set suite variable  ${zone_5_case_c_sizes}

        BuiltIn.set suite variable  ${zone_6_from_addresss}
        BuiltIn.set suite variable  ${zone_6_case_a_weights}
        BuiltIn.set suite variable  ${zone_6_case_a_sizes}
        BuiltIn.set suite variable  ${zone_6_case_b_weights}
        BuiltIn.set suite variable  ${zone_6_case_b_sizes}
        BuiltIn.set suite variable  ${zone_6_case_c_weights}
        BuiltIn.set suite variable  ${zone_6_case_c_sizes}

        BuiltIn.set suite variable  ${zone_7_from_addresss}
        BuiltIn.set suite variable  ${zone_7_case_a_weights}
        BuiltIn.set suite variable  ${zone_7_case_a_sizes}
        BuiltIn.set suite variable  ${zone_7_case_b_weights}
        BuiltIn.set suite variable  ${zone_7_case_b_sizes}
        BuiltIn.set suite variable  ${zone_7_case_c_weights}
        BuiltIn.set suite variable  ${zone_7_case_c_sizes}

        BuiltIn.set suite variable  ${zone_8_from_addresss}
        BuiltIn.set suite variable  ${zone_8_case_a_weights}
        BuiltIn.set suite variable  ${zone_8_case_a_sizes}
        BuiltIn.set suite variable  ${zone_8_case_b_weights}
        BuiltIn.set suite variable  ${zone_8_case_b_sizes}
        BuiltIn.set suite variable  ${zone_8_case_c_weights}
        BuiltIn.set suite variable  ${zone_8_case_c_sizes}

        BuiltIn.set suite variable  ${zone_9_from_addresss}
        BuiltIn.set suite variable  ${zone_9_case_a_weights}
        BuiltIn.set suite variable  ${zone_9_case_a_sizes}
        BuiltIn.set suite variable  ${zone_9_case_b_weights}
        BuiltIn.set suite variable  ${zone_9_case_b_sizes}
        BuiltIn.set suite variable  ${zone_9_case_c_weights}
        BuiltIn.set suite variable  ${zone_9_case_c_sizes}

        BuiltIn.set suite variable  ${zone_10_from_addresss}
        BuiltIn.set suite variable  ${zone_10_case_a_weights}
        BuiltIn.set suite variable  ${zone_10_case_a_sizes}
        BuiltIn.set suite variable  ${zone_10_case_b_weights}
        BuiltIn.set suite variable  ${zone_10_case_b_sizes}
        BuiltIn.set suite variable  ${zone_10_case_c_weights}
        BuiltIn.set suite variable  ${zone_10_case_c_sizes}

        BuiltIn.set suite variable  ${zone_11_from_addresss}
        BuiltIn.set suite variable  ${zone_11_case_a_weights}
        BuiltIn.set suite variable  ${zone_11_case_a_sizes}
        BuiltIn.set suite variable  ${zone_11_case_b_weights}
        BuiltIn.set suite variable  ${zone_11_case_b_sizes}
        BuiltIn.set suite variable  ${zone_11_case_c_weights}
        BuiltIn.set suite variable  ${zone_11_case_c_sizes}

Calculate price
    [Arguments]      ${condition_weight}  ${condition_size}  ${condition_price}  ${condition_remote}  ${condition_tourism}  ${condition_island}  ${case_weights}  ${case_sizes}
    [Documentation]  คำนวณ ราคาค่าส่ง
        # เคส_น้ำหนัก
        ${case_weight_int}=  BuiltIn.Convert to integer  ${case_weights}
        # เคส_ขนาด
        ${case_size_int}=  BuiltIn.Convert to integer  ${case_sizes}
        # ค่าส่งพื้นฐาน
        ${basic_price}=  BuiltIn.Set variable
        ####
        ${length_price}=  BuiltIn.Get length  ${condition_price}
        FOR  ${index}  IN RANGE  ${length_price}
                # เงื่อนไข_น้ำหนัก
                ${weight}=  BuiltIn.Set variable  ${${condition_weight}[${index}]}
                ${condition_weight_int}=  BuiltIn.Convert to integer  ${weight}
                # เงื่อนไข_ขนาด
                ${size}=  BuiltIn.Set variable  ${${condition_size}[${index}]}
                ${condition_size_int}=  BuiltIn.Convert to integer  ${size}
                IF  ${condition_size_int} == 0
                        ${condition_size_int}=  BuiltIn.Set variable  280
                END
                ####
                IF  ${case_weight_int} <= ${condition_weight_int} and ${case_size_int} <= ${condition_size_int}
                        # ค่าส่งพื้นฐาน
                        ${basic_price}=  BuiltIn.Convert to integer  ${condition_price}[${index}]
                        BREAK
                END
        END
        # ค่าส่งพิเศษ
        ${special_price}=  api_portal_logistic_point___teature.Calculate special price  ${basic_price}  ${case_weights}  ${case_sizes}  ${condition_weight}  ${condition_size}  ${condition_price}  ${condition_remote}  ${condition_tourism}  ${condition_island}
    [Return]  ${special_price}

Calculate tourism price
    [Arguments]      ${weight}
    [Documentation]  คำนวณค่าส่ง ท่องเที่ยว
        IF       ${weight} < 7
                    ${tourism_price}=  BuiltIn.Set variable  30
        ELSE IF  ${weight} >= 7 and ${weight} <= 20
                    ${tourism_price}=  BuiltIn.Set variable  100
        ELSE IF  ${weight} > 20
                    ${tourism_price}=  BuiltIn.Set variable  200
        END
    [Return]  ${tourism_price}

Condition tourism price
    [Arguments]      ${case_weights}  ${case_sizes}  ${condition_weight}  ${condition_size}  ${condition_price}
    [Documentation]  คิดเงื่อนไข ท่องเที่ยว
        ${weight_1}=  BuiltIn.Set variable  null
        ${weight_2}=  BuiltIn.Set variable  null
        ${price_from_weight}=  BuiltIn.Set variable
        ${price_from_size}=  BuiltIn.Set variable
        ####
        ${length_price}=  BuiltIn.Get length  ${condition_price}
        FOR  ${index}  IN RANGE  ${length_price}
                # เงื่อนไข_ราคา
                ${price}=  BuiltIn.Set variable  ${${condition_price}[${index}]}
                ${condition_price_int}=  BuiltIn.Convert to integer  ${price}
                # เงื่อนไข_น้ำหนัก
                ${weight}=  BuiltIn.Set variable  ${${condition_weight}[${index}]}
                ${condition_weight_int}=  BuiltIn.Convert to integer  ${weight}
                # เงื่อนไข_ขนาด
                ${size}=  BuiltIn.Set variable  ${${condition_size}[${index}]}
                ${condition_size_int}=  BuiltIn.Convert to integer  ${size}
                IF  ${condition_size_int} == 0
                    ${condition_size_int}=  BuiltIn.Set variable  280
                END

                # เช็คเงื่อนไข
                IF  '${weight_1}' == 'null'
                    IF  ${case_weights} <= ${condition_weight_int}
                            ${weight_1}=  BuiltIn.Set variable  ${condition_weight_int}
                            ${price_from_weight}=  BuiltIn.Set variable  ${condition_price_int}
                    END
                END
                IF  '${weight_2}' == 'null'
                    IF  ${case_sizes} <= ${condition_size_int}
                            ${weight_2}=  BuiltIn.Set variable  ${condition_weight_int}
                            ${price_from_size}=  BuiltIn.Set variable  ${condition_price_int}
                    END
                END
        END
        IF       ${price_from_weight} > ${price_from_size}
                    ${tourism_price}=  api_portal_logistic_point___teature.Calculate tourism price  ${weight_1}
        ELSE IF  ${price_from_weight} < ${price_from_size}
                    ${tourism_price}=  api_portal_logistic_point___teature.Calculate tourism price  ${weight_2}
        END
    [Return]  ${tourism_price}

Test a
    [Arguments]  ${case_weights}  ${condition_price_int}  ${condition_weight_int}  ${condition_size_int}
        IF  ${case_weights} <= ${condition_weight_int}
                ${weight_1}=  BuiltIn.Set variable  ${condition_weight_int}
                ${price_from_weight}=  BuiltIn.Set variable  ${condition_price_int}
        ELSE
                ${weight_1}=  BuiltIn.Set variable  null
                ${price_from_weight}=  BuiltIn.Set variable  null
        END
    [Return]  ${weight_1}  ${price_from_weight}

Test b
    [Arguments]  ${case_weights}  ${condition_price_int}  ${condition_weight_int}  ${condition_size_int}
        IF  ${case_weights} <= ${condition_weight_int}
                ${weight_1}=  BuiltIn.Set variable  ${condition_weight_int}
                ${price_from_weight}=  BuiltIn.Set variable  ${condition_price_int}
        ELSE
                ${weight_1}=  BuiltIn.Set variable  null
                ${price_from_weight}=  BuiltIn.Set variable  null
        END
    [Return]  ${weight_1}  ${price_from_weight}

Calculate special price
    [Arguments]      ${basic_price}  ${case_weights}  ${case_sizes}  ${condition_weight}  ${condition_size}  ${condition_price}  ${condition_remote}  ${condition_tourism}  ${condition_island}
    [Documentation]  คำนวณค่าส่ง พิเศษ
        IF       '${condition_remote}' == 'N' and '${condition_tourism}' == 'N' and '${condition_island}' == 'N'
                    ${special_price}=  BuiltIn.Set variable  ${basic_price}
        ELSE IF  '${condition_remote}' == 'A' and '${condition_tourism}' == 'N' and '${condition_island}' == 'N'
                    ${special_price}=  BuiltIn.Evaluate  ${basic_price}+50
        ELSE IF  '${condition_remote}' == 'N' and '${condition_tourism}' == 'B' and '${condition_island}' == 'N'
                    ${tourism_price}=  api_portal_logistic_point___teature.Condition tourism price  ${case_weights}  ${case_sizes}  ${condition_weight}  ${condition_size}  ${condition_price}
                    ${special_price}=  BuiltIn.Evaluate  ${basic_price}+${tourism_price}
        ELSE IF  '${condition_remote}' == 'N' and '${condition_tourism}' == 'B' and '${condition_island}' == 'C'
                    ${tourism_price}=  api_portal_logistic_point___teature.Condition tourism price  ${case_weights}  ${case_sizes}  ${condition_weight}  ${condition_size}  ${condition_price}
                    ${special_price}=  BuiltIn.Evaluate  ${basic_price}+${tourism_price}+30
        END
    [Return]  ${special_price}

Set request body
    [Arguments]      ${request_body}  ${target_parame}  ${target_value}
    [Documentation]  กำหนด data ของ req.body
        Collections.set to dictionary  ${request_body ['addressList'][0]}  ${target_parame}=${target_value}
    [Return]  ${request_body}

Gather all data response on by list
    [Arguments]  ${sum_all_data}  ${list}  ${value}
    [Documentation]  รวบรวม res.cost ทั้งหมดลงใน list
        ${keys}=  BuiltIn.Convert to string  ${list}
        &{data_by_list}=  BuiltIn.Create dictionary  ${keys}=${value}
        Collections.Append to list  ${sum_all_data}  ${data_by_list}
    [Return]  ${sum_all_data}

Read response follow request
    [Arguments]      ${req_amount}  ${request_body}  ${from_province}  ${from_district}  ${from_parish}  ${from_code}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${case_weight_a}  ${case_size_a}  ${case_weight_b}  ${case_size_b}  ${case_weight_c}  ${case_size_c}
    [Documentation]  เก็บ res.data ตาม req.body ที่กำหนด
        # กำหนด data ของ req.body
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  fromProvince  ${from_province}
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  fromDistrict  ${from_district}
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  fromState     ${from_parish}
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  fromPostcode  ${from_code}
                            
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  toprovince  ${to_province}
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  todistrict  ${to_district}
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  tostate     ${to_parish}
        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  topostcode  ${to_code}

        ${response_cost}=        BuiltIn.Set Variable
        ${response_0_cost_int}=  BuiltIn.Set Variable  null
        ${response_1_cost_int}=  BuiltIn.Set Variable  null
        ${response_2_cost_int}=  BuiltIn.Set Variable  null
        FOR  ${index}  IN RANGE  ${req_amount}
            ####
            IF       ${index} == 0
                        ${parcel_all}=     BuiltIn.Evaluate  ${case_size_a}/3
                        ${parcel_weight}=  BuiltIn.Evaluate  ${case_weight_a}*1000
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelWidth   ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelHeight  ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelLength  ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelWeight  ${parcel_weight}
                        # ยิง api
                        ${result}=  BuiltIn.Run keyword and return status  api_portal_common___keywords.Send api post  ${request_url}  ${request_header}  ${request_body}
                        IF  ${result} == True
                                ${response_0_body}=  api_portal_common___keywords.Send api post  ${request_url}  ${request_header}  ${request_body}
                                ${response_0_cost_int}=  BuiltIn.Convert to integer  ${response_0_body ['data'] ['totalPrice']}
                        ELSE
                                Log to console  ERROR !!! CASE 1 ['${from_province}'..'${from_district}'..'${from_parish}'..'${from_code}'] >> ['${to_province}'..'${to_district}'..'${to_parish}'..'${to_code}']
                        END
            ELSE IF  ${index} == 1
                        ${parcel_all}=     BuiltIn.Evaluate  ${case_size_b}/3
                        ${parcel_weight}=  BuiltIn.Evaluate  ${case_weight_b}*1000
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelWidth   ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelHeight  ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelLength  ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelWeight  ${parcel_weight}
                        # ยิง api 
                        ${result}=  BuiltIn.Run keyword and return status  api_portal_common___keywords.Send api post  ${request_url}  ${request_header}  ${request_body}
                        IF  ${result} == True
                                ${response_1_body}=  api_portal_common___keywords.Send api post  ${request_url}  ${request_header}  ${request_body}
                                ${response_1_cost_int}=  BuiltIn.Convert to integer  ${response_1_body ['data'] ['totalPrice']}
                        ELSE
                                Log to console  ERROR !!! CASE 2 ['${from_province}'..'${from_district}'..'${from_parish}'..'${from_code}'] >> ['${to_province}'..'${to_district}'..'${to_parish}'..'${to_code}']
                        END
            ELSE IF  ${index} == 2
                        ${parcel_all}=     BuiltIn.Evaluate  ${case_size_c}/3
                        ${parcel_weight}=  BuiltIn.Evaluate  ${case_weight_c}*1000
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelWidth   ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelHeight  ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelLength  ${parcel_all}
                        ${request_body}=  api_portal_logistic_point___teature.Set request body  ${request_body}  parcelWeight  ${parcel_weight}
                        # ยิง api 
                        ${result}=  BuiltIn.Run keyword and return status  api_portal_common___keywords.Send api post  ${request_url}  ${request_header}  ${request_body}
                        IF  ${result} == True
                                ${response_2_body}=  api_portal_common___keywords.Send api post  ${request_url}  ${request_header}  ${request_body}
                                ${response_2_cost_int}=  BuiltIn.Convert to integer  ${response_2_body ['data'] ['totalPrice']}
                        ELSE
                                Log to console  ERROR !!! CASE 3 ['${from_province}'..'${from_district}'..'${from_parish}'..'${from_code}'] >> ['${to_province}'..'${to_district}'..'${to_parish}'..'${to_code}']
                        END
            END
        END
        ####
        IF       '${response_0_cost_int}' != 'null' and '${response_1_cost_int}' != 'null' and '${response_2_cost_int}' != 'null'
                    ${response_cost}=  BuiltIn.Catenate  ${response_0_cost_int} ${response_1_cost_int} ${response_2_cost_int}
        ELSE IF  '${response_0_cost_int}' != 'null' and '${response_1_cost_int}' != 'null'
                    ${response_cost}=  BuiltIn.Catenate  ${response_0_cost_int} ${response_1_cost_int}
        END
    [Return]  ${response_cost}

Send api for delivery cost in zone
    [Arguments]      ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${from_addresss}  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
    [Documentation]  ยิง api หาค่าส่งในพื้นที่ zone
        Log to console  ... ... [send api] ... ...
        # สร้าง req.body
        ${request_body}=  api_portal_common___keywords.Read json file  ${CURDIR}/../../../resources/testdata/api_portal/logistic_point/body.json
        # วนยิง api เก็บ ค่าส่ง
        ${cost_total_by_list}=  BuiltIn.Create list
        ${length_region}=  BuiltIn.Get length  ${to_region}
        FOR  ${index}  IN RANGE  ${length_region}
            IF       '${zone}' == 'ZONE1'
                        IF  '${to_region}[${index}]' == 'ปริมณฑล'
                                # เก็บ res.cost ตาม req.body ที่กำหนด
                                ${response_cost}=  api_portal_logistic_point___teature.Read response follow request    2  ${request_body}  ${from_addresss}[0]  ${from_addresss}[1]  ${from_addresss}[2]  ${from_addresss}[3]  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
                                # บันทึก res.cost ทั้งหมด
                                ${list}=  BuiltIn.Convert to string  ${index}
                                &{cost_by_list}=  BuiltIn.Create dictionary  ${list}=${response_cost}
                                Collections.Append to list  ${cost_total_by_list}  ${cost_by_list}
                        END
            ELSE IF  '${zone}' == 'ZONE2' or '${zone}' == 'ZONE5' or '${zone}' == 'ZONE9' or '${zone}' == 'ZONE10' or '${zone}' == 'ZONE11'
                        IF  '${to_region}[${index}]' != 'ปริมณฑล'
                                # เก็บ res.cost ตาม req.body ที่กำหนด
                                ${response_cost}=  api_portal_logistic_point___teature.Read response follow request    3  ${request_body}  ${from_addresss}[0]  ${from_addresss}[1]  ${from_addresss}[2]  ${from_addresss}[3]  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
                                # บันทึก res.cost ทั้งหมด
                                ${list}=  BuiltIn.Convert to string  ${index}
                                &{cost_by_list}=  BuiltIn.Create dictionary  ${list}=${response_cost}
                                Collections.Append to list  ${cost_total_by_list}  ${cost_by_list}
                        END
            ELSE IF  '${zone}' == 'ZONE4' and '${to_region}[${index}]' == 'กลาง'
                        # เก็บ res.cost ตาม req.body ที่กำหนด
                        ${response_cost}=  api_portal_logistic_point___teature.Read response follow request    3  ${request_body}  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
                        # บันทึก res.cost ทั้งหมด
                        ${cost_total_by_list}=  api_portal_logistic_point___teature.Gather all data response on by list  ${cost_total_by_list}  ${index}  ${response_cost}
            ELSE IF  '${zone}' == 'ZONE6' and '${to_region}[${index}]' == 'เหนือ'
                        # เก็บ res.cost ตาม req.body ที่กำหนด
                        ${response_cost}=  api_portal_logistic_point___teature.Read response follow request    3  ${request_body}  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
                        # บันทึก res.cost ทั้งหมด
                        ${cost_total_by_list}=  api_portal_logistic_point___teature.Gather all data response on by list  ${cost_total_by_list}  ${index}  ${response_cost}
            ELSE IF  '${zone}' == 'ZONE7' and '${to_region}[${index}]' == 'ตะวันออก'
                        # เก็บ res.cost ตาม req.body ที่กำหนด
                        ${response_cost}=  api_portal_logistic_point___teature.Read response follow request    3  ${request_body}  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
                        # บันทึก res.cost ทั้งหมด
                        ${cost_total_by_list}=  api_portal_logistic_point___teature.Gather all data response on by list  ${cost_total_by_list}  ${index}  ${response_cost}
            ELSE IF  '${zone}' == 'ZONE8' and '${to_region}[${index}]' == 'ใต้'
                        # เก็บ res.cost ตาม req.body ที่กำหนด
                        ${response_cost}=  api_portal_logistic_point___teature.Read response follow request    3  ${request_body}  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${to_province}[${index}]  ${to_district}[${index}]  ${to_parish}[${index}]  ${to_code}[${index}]  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
                        # บันทึก res.cost ทั้งหมด
                        ${cost_total_by_list}=  api_portal_logistic_point___teature.Gather all data response on by list  ${cost_total_by_list}  ${index}  ${response_cost}
            END
        END
    [Return]  ${cost_total_by_list}

Collect doc for delivery priec in zone
    [Arguments]      ${cost_total_by_list}  ${section_weight}  ${section_size}  ${zone_price}  ${remote}  ${tourism}  ${island}  ${case_a_weight}  ${case_a_size}  ${case_b_weight}  ${case_b_size}  ${case_c_weight}  ${case_c_size}
    [Documentation]  เช็ค doc หาค่าส่งในพื้นที่ zone
    Log to console  ... ... [collect doc] ... ...
    # วนตาม จำนวนของที่อยู่
    ${price_total_by_list}=  BuiltIn.Create list
    ${length_cost_total}=  BuiltIn.Get length  ${cost_total_by_list}
    FOR  ${index}  IN RANGE  ${length_cost_total}
            FOR  ${list}  IN  @{cost_total_by_list[${index}].keys()}
                    ${price}=             BuiltIn.Set Variable
                    ${price_case_1}=      BuiltIn.Set Variable  null
                    ${price_case_2}=      BuiltIn.Set Variable  null
                    ${price_case_3}=      BuiltIn.Set Variable  null
                    # วนตาม จำนวนเคส ของแต่ละที่อยู่
                    @{case} =  String.Split string  ${cost_total_by_list[${index}] ['${list}']}
                    ${length_case}=  BuiltIn.Get length  ${case}
                    FOR  ${index2}  IN RANGE  ${length_case}
                            IF       ${index2} == 0
                                        ${price}=  api_portal_logistic_point___teature.Calculate price  ${section_weight}  ${section_size}  ${zone_price}  ${remote}[${list}]  ${tourism}[${list}]  ${island}[${list}]  ${case_a_weight}  ${case_a_size}
                                        ${price_case_1}=  BuiltIn.Set Variable  ${price}
                            ELSE IF  ${index2} == 1
                                        ${price}=  api_portal_logistic_point___teature.Calculate price  ${section_weight}  ${section_size}  ${zone_price}  ${remote}[${list}]  ${tourism}[${list}]  ${island}[${list}]  ${case_b_weight}  ${case_b_size}
                                        ${price_case_2}=  BuiltIn.Set Variable  ${price}
                            ELSE IF  ${index2} == 2
                                        ${price}=  api_portal_logistic_point___teature.Calculate price  ${section_weight}  ${section_size}  ${zone_price}  ${remote}[${list}]  ${tourism}[${list}]  ${island}[${list}]  ${case_c_weight}  ${case_c_size}
                                        ${price_case_3}=  BuiltIn.Set Variable  ${price}
                            END
                    END
                    ####
                    IF       '${price_case_1}' != 'null' and '${price_case_2}' != 'null' and '${price_case_3}' != 'null'
                                ${price}=  BuiltIn.Catenate  ${price_case_1} ${price_case_2} ${price_case_3}
                    ELSE IF  '${price_case_1}' != 'null' and '${price_case_2}' != 'null'
                                ${price}=  BuiltIn.Catenate  ${price_case_1} ${price_case_2}
                    END
                    &{price_by_list}=  BuiltIn.Create dictionary  ${list}=${price}
            END
            # บันทึก price ทั้งหมด
            Collections.Append to list  ${price_total_by_list}  ${price_by_list}
    END
    [Return]  ${price_total_by_list}

Verify data for delivery
    [Arguments]      ${zone}  ${cost_by_api}  ${price_by_doc}  ${from_province}  ${from_district}  ${from_parish}  ${from_code}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}
    [Documentation]  เปรียบเทียบ ค่าส่งระหว่าง api กับ doc
    Log to console  ... ... [verify data] ... ...
    ${length_cost}=  BuiltIn.Get length  ${cost_by_api}
    FOR  ${index}  IN RANGE  ${length_cost}
            FOR  ${list}  IN  @{cost_by_api[${index}].keys()}
                    ${result}=  BuiltIn.Run keyword and return status  BuiltIn.Should be equal as strings  ${cost_by_api[${index}] ['${list}']}  ${price_by_doc[${index}] ['${list}']}
                    IF  ${result} != True
                        IF       '${zone}' == 'ZONE1' or '${zone}' == 'ZONE2' or '${zone}' == 'ZONE5' or '${zone}' == 'ZONE9' or '${zone}' == 'ZONE10' or '${zone}' == 'ZONE11'
                                    Log to console  ERROR !!! ['${from_province}'..'${from_district}'..'${from_parish}'..'${from_code}'] >> ['${to_province}[${list}]'..'${to_district}[${list}]'..'${to_parish}[${list}]'..'${to_code}[${list}]'] ---> (${cost_by_api[${index}] ['${list}']} != ${price_by_doc[${index}] ['${list}']})
                        ELSE IF  '${zone}' == 'ZONE4' or '${zone}' == 'ZONE6' or '${zone}' == 'ZONE7' or '${zone}' == 'ZONE8'
                                    Log to console  ERROR !!! ['${to_province}[${list}]'..'${to_district}[${list}]'..'${to_parish}[${list}]'..'${to_code}[${list}]'] >> ['${to_province}[${list}]'..'${to_district}[${list}]'..'${to_parish}[${list}]'..'${to_code}[${list}]'] ---> (${cost_by_api[${index}] ['${list}']} != ${price_by_doc[${index}] ['${list}']})
                        END
                    END
            END
    END

Check delivery flashexpress
    [Arguments]      ${zone}
    [Documentation]  ทดสอบค่าขนส่ง flash
    ...               > ยิง api หาค่าส่งในพื้นที่
    ...               > เช็ค doc หาค่าส่งในพื้นที่
    ...               > เปรียบเทียบ ค่าส่งในพื้นที่

    IF       '${zone}' == 'ZONE1'
                Log to console  (${zone})
                ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_1_from_addresss}  ${zone_1_case_a_weights}  ${zone_1_case_a_sizes}  ${zone_1_case_b_weights}  ${zone_1_case_b_sizes}  null  null
                ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec1_weight}  ${flash_sec1_size}  ${flash_zone_1}  ${remote}  ${tourism}  ${island}  ${zone_1_case_a_weights}  ${zone_1_case_a_sizes}  ${zone_1_case_b_weights}  ${zone_1_case_b_sizes}  null  null
                api_portal_logistic_point___teature.Verify data for delivery  ${zone}  ${cost_total_by_list}  ${price_total_by_list}  ${zone_1_from_addresss}[0]  ${zone_1_from_addresss}[1]  ${zone_1_from_addresss}[2]  ${zone_1_from_addresss}[3]  ${to_province}  ${to_district}  ${to_parish}  ${to_code}
    ELSE IF  '${zone}' == 'ZONE2'
                Log to console  (${zone})
                ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_2_from_addresss}  ${zone_2_case_a_weights}  ${zone_2_case_a_sizes}  ${zone_2_case_b_weights}  ${zone_2_case_b_sizes}  ${zone_2_case_c_weights}  ${zone_2_case_c_sizes}
                ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec1_weight}  ${flash_sec1_size}  ${flash_zone_2}  ${remote}  ${tourism}  ${island}  ${zone_2_case_a_weights}  ${zone_2_case_a_sizes}  ${zone_2_case_b_weights}  ${zone_2_case_b_sizes}  ${zone_2_case_c_weights}  ${zone_2_case_c_sizes}
                api_portal_logistic_point___teature.Verify data for delivery  ${cost_total_by_list}  ${price_total_by_list}  ${zone_2_from_addresss}  ${to_province}  ${to_district}  ${to_parish}
    ELSE IF  '${zone}' == 'ZONE3'
                Log to console  (${zone})
    ELSE IF  '${zone}' == 'ZONE4'
                Log to console  (${zone})
                ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_4_from_addresss}  ${zone_4_case_a_weights}  ${zone_4_case_a_sizes}  ${zone_4_case_b_weights}  ${zone_4_case_b_sizes}  ${zone_4_case_c_weights}  ${zone_4_case_c_sizes}
                ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec1_weight}  ${flash_sec1_size}  ${flash_zone_4}  ${remote}  ${tourism}  ${island}  ${zone_4_case_a_weights}  ${zone_4_case_a_sizes}  ${zone_4_case_b_weights}  ${zone_4_case_b_sizes}  ${zone_4_case_c_weights}  ${zone_4_case_c_sizes}
                api_portal_logistic_point___teature.Verify data for delivery  ${zone}  ${cost_total_by_list}  ${price_total_by_list}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}
    ELSE IF  '${zone}' == 'ZONE5'
                Log to console  (${zone})
                ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_5_from_addresss}  ${zone_5_case_a_weights}  ${zone_5_case_a_sizes}  ${zone_5_case_b_weights}  ${zone_5_case_b_sizes}  ${zone_5_case_c_weights}  ${zone_5_case_c_sizes}
                ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec1_weight}  ${flash_sec1_size}  ${flash_zone_5}  ${remote}  ${tourism}  ${island}  ${zone_5_case_a_weights}  ${zone_5_case_a_sizes}  ${zone_5_case_b_weights}  ${zone_5_case_b_sizes}  ${zone_5_case_c_weights}  ${zone_5_case_c_sizes}
                api_portal_logistic_point___teature.Verify data for delivery  ${cost_total_by_list}  ${price_total_by_list}  ${zone_5_from_addresss}  ${to_province}  ${to_district}  ${to_parish}
    ELSE IF  '${zone}' == 'ZONE6'
                Log to console  (${zone})
                ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_6_from_addresss}  ${zone_6_case_a_weights}  ${zone_6_case_a_sizes}  ${zone_6_case_b_weights}  ${zone_6_case_b_sizes}  ${zone_6_case_c_weights}  ${zone_6_case_c_sizes}
                ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec2_weight}  ${flash_sec2_size}  ${flash_zone_6}  ${remote}  ${tourism}  ${island}  ${zone_6_case_a_weights}  ${zone_6_case_a_sizes}  ${zone_6_case_b_weights}  ${zone_6_case_b_sizes}  ${zone_6_case_c_weights}  ${zone_6_case_c_sizes}
                api_portal_logistic_point___teature.Verify data for delivery  ${zone}  ${cost_total_by_list}  ${price_total_by_list}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}
    ELSE IF  '${zone}' == 'ZONE7'
                Log to console  (${zone})
                ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_7_from_addresss}  ${zone_7_case_a_weights}  ${zone_7_case_a_sizes}  ${zone_7_case_b_weights}  ${zone_7_case_b_sizes}  ${zone_7_case_c_weights}  ${zone_7_case_c_sizes}
                ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec2_weight}  ${flash_sec2_size}  ${flash_zone_7}  ${remote}  ${tourism}  ${island}  ${zone_7_case_a_weights}  ${zone_7_case_a_sizes}  ${zone_7_case_b_weights}  ${zone_7_case_b_sizes}  ${zone_7_case_c_weights}  ${zone_7_case_c_sizes}
                api_portal_logistic_point___teature.Verify data for delivery  ${zone}  ${cost_total_by_list}  ${price_total_by_list}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}
    ELSE IF  '${zone}' == 'ZONE8'
                Log to console  (${zone})
                ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_8_from_addresss}  ${zone_8_case_a_weights}  ${zone_8_case_a_sizes}  ${zone_8_case_b_weights}  ${zone_8_case_b_sizes}  ${zone_8_case_c_weights}  ${zone_8_case_c_sizes}
                ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec2_weight}  ${flash_sec2_size}  ${flash_zone_8}  ${remote}  ${tourism}  ${island}  ${zone_8_case_a_weights}  ${zone_8_case_a_sizes}  ${zone_8_case_b_weights}  ${zone_8_case_b_sizes}  ${zone_8_case_c_weights}  ${zone_8_case_c_sizes}
                api_portal_logistic_point___teature.Verify data for delivery  ${zone}  ${cost_total_by_list}  ${price_total_by_list}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}
    ELSE IF  '${zone}' == 'ZONE9'
                Log to console  (${zone})
                    ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_9_from_addresss}  ${zone_9_case_a_weights}  ${zone_9_case_a_sizes}  ${zone_9_case_b_weights}  ${zone_9_case_b_sizes}  ${zone_9_case_c_weights}  ${zone_9_case_c_sizes}
                    ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec2_weight}  ${flash_sec2_size}  ${flash_zone_9}  ${remote}  ${tourism}  ${island}  ${zone_9_case_a_weights}  ${zone_9_case_a_sizes}  ${zone_9_case_b_weights}  ${zone_9_case_b_sizes}  ${zone_9_case_c_weights}  ${zone_9_case_c_sizes}
                    api_portal_logistic_point___teature.Verify data for delivery  ${cost_total_by_list}  ${price_total_by_list}  ${zone_9_from_addresss}  ${to_province}  ${to_district}  ${to_parish}
    ELSE IF  '${zone}' == 'ZONE10'
                Log to console  (${zone})
                    ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_10_from_addresss}  ${zone_10_case_a_weights}  ${zone_10_case_a_sizes}  ${zone_10_case_b_weights}  ${zone_10_case_b_sizes}  ${zone_10_case_c_weights}  ${zone_10_case_c_sizes}
                    ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec2_weight}  ${flash_sec2_size}  ${flash_zone_10}  ${remote}  ${tourism}  ${island}  ${zone_10_case_a_weights}  ${zone_10_case_a_sizes}  ${zone_10_case_b_weights}  ${zone_10_case_b_sizes}  ${zone_10_case_c_weights}  ${zone_10_case_c_sizes}
                    api_portal_logistic_point___teature.Verify data for delivery  ${cost_total_by_list}  ${price_total_by_list}  ${zone_10_from_addresss}  ${to_province}  ${to_district}  ${to_parish}
    ELSE IF  '${zone}' == 'ZONE11'
                Log to console  (${zone})
                    ${cost_total_by_list}=   api_portal_logistic_point___teature.Send api for delivery cost in zone  ${zone}  ${to_region}  ${to_province}  ${to_district}  ${to_parish}  ${to_code}  ${zone_11_from_addresss}  ${zone_11_case_a_weights}  ${zone_11_case_a_sizes}  ${zone_11_case_b_weights}  ${zone_11_case_b_sizes}  ${zone_11_case_c_weights}  ${zone_11_case_c_sizes}
                    ${price_total_by_list}=  api_portal_logistic_point___teature.Collect doc for delivery priec in zone  ${cost_total_by_list}  ${flash_sec2_weight}  ${flash_sec2_size}  ${flash_zone_11}  ${remote}  ${tourism}  ${island}  ${zone_11_case_a_weights}  ${zone_11_case_a_sizes}  ${zone_11_case_b_weights}  ${zone_11_case_b_sizes}  ${zone_11_case_c_weights}  ${zone_11_case_c_sizes}
                    api_portal_logistic_point___teature.Verify data for delivery  ${cost_total_by_list}  ${price_total_by_list}  ${zone_11_from_addresss}  ${to_province}  ${to_district}  ${to_parish}
    ELSE
        Log to console  ERROR !!! ${zone} NOT FOUNT.
    END