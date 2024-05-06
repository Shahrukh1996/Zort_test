*** Keywords ***
Clear search advance checkbox
    [Documentation]     Clear search advance checkbox
    light_portal_product_transfer_list_page.Click checkbox transfer of type
    light_portal_product_transfer_list_page.Click checkbox bring of type
    light_portal_product_transfer_list_page.Click checkbox adjust of type
    light_portal_product_transfer_list_page.Click checkbox assemble product of type
    light_portal_product_transfer_list_page.Click checkbox split product of type
    light_portal_product_transfer_list_page.Click checkbox wait transfer of status
    light_portal_product_transfer_list_page.Click checkbox success of status
    light_portal_product_transfer_list_page.Click checkbox cancel of status

Input advance search
    [Documentation]     Input advance search
    [Arguments]     ${number}   ${product}  ${warehouse}    ${user_id}
    light_portal_product_transfer_list_page.Input search number      ${number}
    light_portal_product_transfer_list_page.Input search product     ${product}
    light_portal_product_transfer_list_page.Input search warehouse   ${warehouse}
    light_portal_product_transfer_list_page.Input search userid      ${user_id}

Verify search result
    [Documentation]     Verify search result
    [Arguments]     ${search}
    light_portal_product_transfer_list_page.Verify search result date            ${search.search_date}
    light_portal_product_transfer_list_page.Verify search result number          ${search.search_number}
    light_portal_product_transfer_list_page.Verify search result type            ${search.search_type}
    light_portal_product_transfer_list_page.Verify search result from warehouse  ${search.search_warehouse}
    light_portal_product_transfer_list_page.Verify search result to warehouse    ${search.search_to_warehouse}
    light_portal_product_transfer_list_page.Verify search result status          ${search.search_status}

Input require data when create product transfer list
    [Documentation]     Input require data when create product transfer list
    [Arguments]         ${from_store}     ${to_store}    ${add_transfer_list}
    light_portal_common_keywords.Scroll to top of page
    light_portal_product_transfer_list_page.Input basic data of transfer list    ${add_transfer_list ['basic_data']}
    light_portal_product_transfer_list_page.Select origin ware house
    light_portal_product_transfer_list_page.Input origin ware house              ${from_store}
    light_portal_product_transfer_list_page.Select destination warehouse
    light_portal_product_transfer_list_page.Input destination warehouse          ${to_store}
    light_portal_product_transfer_list_page.Click save on create transfer page

Verify require data should be corrected
    [Documentation]     Verify require data should be corrected
    [Arguments]         ${status}    ${from_store}    ${to_store}
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_transfer_list_page.Verify transfer status on data page              ${status}
    light_portal_product_transfer_list_page.Verify origin warehouse on data page             ${from_store}
    light_portal_product_transfer_list_page.verify destination warehouse on data page        ${to_store}
    light_portal_product_transfer_list_page.Verify transfer status on footer of data page    ${status}

Add product on edit data of transfer page
    [Documentation]     Add product on edit data of transfer page
    [Arguments]         ${product_id}
    light_portal_common_keywords.Auto keyword remove dom chat support
    light_portal_product_transfer_list_page.Click add product button
    light_portal_product_transfer_list_page.Click select product button
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_transfer_list_page.Input product id on select product function    ${product_id}
    SeleniumLibrary.Press keys      None        ENTER
    Sleep  2s
    light_portal_product_transfer_list_page.Click select product button on select product function
    light_portal_product_transfer_list_page.Increase number of product
    light_portal_product_transfer_list_page.Click save on create transfer page

Verify product id and amount should be corrected
    [Documentation]     Verify product id and amount should be corrected
    [Arguments]         ${product_id}    ${product_amount}
    light_portal_product_transfer_list_page.Verify product id on data page           ${product_id}
    light_portal_product_transfer_list_page.Verify amount product on data page       ${product_amount}

Goto edit page by clicking command button
    [Documentation]     Edit data by clicking command button
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_transfer_list_page.Click command button
    light_portal_product_transfer_list_page.Click edit from command button

Input origin store and destination store
    [Documentation]     Input origin store and destination store
    [Arguments]         ${from_store}    ${to_store}    ${add_transfer_list}
    light_portal_common_keywords.Scroll to top of page
    light_portal_product_transfer_list_page.Input basic data of transfer list    ${add_transfer_list ['basic_data']}
    light_portal_product_transfer_list_page.Select origin ware house
    light_portal_product_transfer_list_page.Input origin ware house          ${from_store}
    light_portal_product_transfer_list_page.Select destination warehouse
    light_portal_product_transfer_list_page.Input destination warehouse      ${to_store}

Add product by product code on transfer list page
    [Documentation]     Add product by product code on transfer list page
    [Arguments]         ${product_id}
    light_portal_common_keywords.Auto keyword remove dom chat support
    light_portal_product_transfer_list_page.Click select default product button
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_transfer_list_page.Input product id on select product function    ${product_id}
    SeleniumLibrary.Press keys      None        ENTER
    light_portal_common_keywords.Wait for jquery loading completed
    light_portal_product_transfer_list_page.Click select product button on select product function
    light_portal_product_transfer_list_page.Increase number of product
    light_portal_product_transfer_list_page.Click save on create transfer page

Click transfer partial goods and verify status chould be corrected
    [Documentation]     Click transfer partial goods and verify status chould be corrected
    [Arguments]         ${status}
    light_portal_product_transfer_list_page.Click transfer partial of goods
    light_portal_product_transfer_list_page.Click decrease button on trasfer partial of goods page
    light_portal_product_transfer_list_page.Click save button on trasfer partial of goods page
    light_portal_product_transfer_list_page.Verify transfer status on data page      ${status}

Click transfer all goods and verify status should be corrected
    [Documentation]     Click transfer all goods and verify status should be corrected
    [Arguments]         ${status}
    light_portal_product_transfer_list_page.Click transfer all goods
    light_portal_product_transfer_list_page.Click save button on transfer all goods page
    light_portal_product_transfer_list_page.Verify transfer status on data page      ${status}

Cancel transfer product by transfer id and verify status should be corrected
    [Documentation]     Cancel transfer product by transfer id and verify status should be corrected
    [Arguments]         ${id_transfer}
    light_portal_product_transfer_list_page.Click command button
    light_portal_product_transfer_list_page.Click cancel transfer goods
    light_portal_product_transfer_list_page.Click confirm cancel transfer goods
    light_portal_product_transfer_list_page.Search transfer number    ${id_transfer}
    light_portal_product_transfer_list_page.Verify cancel status should be displayed