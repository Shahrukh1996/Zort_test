*** Keywords ***
Input advance search
    [Documentation]     Input advance search
    [Arguments]     ${number}   ${customer}     ${product}  ${refer}    ${shipping}
    light_portal_view_sell_list_page.Input search number         ${number}
    light_portal_view_sell_list_page.Input search customer name  ${customer}
    light_portal_view_sell_list_page.Input search product        ${product}
    light_portal_view_sell_list_page.Input search refer          ${refer}
    light_portal_view_sell_list_page.Input search shipping       ${shipping}

Clear advance search checkbox
    [Documentation]     Clear advance search checkbox
    light_portal_view_sell_list_page.Click checkbox wait transfer of transfer product
    light_portal_view_sell_list_page.Click checkbox success of transfer product
    light_portal_view_sell_list_page.Click checkbox transfer some part of transfer product
    light_portal_view_sell_list_page.Click checkbox cancel of transfer product
    light_portal_view_sell_list_page.Click checkbox cancel and expire of transfer product
    light_portal_view_sell_list_page.Click checkbox wait shipping of transfer product
    light_portal_view_sell_list_page.Click checkbox shipping of transfer product
    light_portal_view_sell_list_page.Click checkbox cancel shipping of transfer product
    light_portal_view_sell_list_page.Click checkbox wait payment of payment status
    light_portal_view_sell_list_page.Click checkbox payment some part of payment status
    light_portal_view_sell_list_page.Click checkbox full payment of payment status
    light_portal_view_sell_list_page.Click checkbox cancel of payment status

Click select datepicker date month and year
    [Documentation]     Click select datepicker date month and year
    [Arguments]         ${day}      ${month}        ${year}
    light_portal_view_sell_list_page.Click datepicker goto year page
    light_portal_view_sell_list_page.Click select year from datepicker       ${year}
    light_portal_view_sell_list_page.Click select month from datepicker      ${month}
    light_portal_view_sell_list_page.Click select date from datepicker       ${day}