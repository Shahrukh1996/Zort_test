*** Settings ***

### config ###
Library         pabot.PabotLib
Library         OperatingSystem
Library         Collections
Library         String
Library         DebugLibrary
Library         DobbyCommonLibrary
Library         SeleniumLibrary    run_on_failure=None
Library         RequestsLibrary
Library         ExcelLibrary
Library         JSONLibrary
Library         DateTime

Library         ${CURDIR}/library/SELL_03_04.py
Library         ${CURDIR}/library/logistic_point.py

Resource        DobbyCommonLibrary/DobbyWebCommon.robot
Resource        DobbyCommonLibrary/DobbyCommon.robot


### commom [light_portal] ###
Resource        ${CURDIR}/../keywords/common/light_portal/light_portal_common_keywords.robot
### commom [middle_portal] ###
Resource        ${CURDIR}/../keywords/common/middle_portal/common_keywords_middle_portal.robot
### commom [api_portal] ###
Resource        ${CURDIR}/../keywords/common/api_portal/api_portal_common___keywords.robot


### resource ###
Variables       ${CURDIR}/translation/th.yaml
Variables       ${CURDIR}/settings/setting.yaml
### resource [light_portal] ###
Variables       ${CURDIR}/testdata/light_portal/SELL_03_04.yaml
Variables       ${CURDIR}/testdata/light_portal/light_portal_data.yaml
### resource [middle_portal] ###
Variables       ${CURDIR}/testdata/middle_portal/BC_PRINT_PRODUCT.yaml
### resource [api_portal] ###
Variables       ${CURDIR}/testdata/api_portal/logistic_point/data.yaml


### pages [light_portal] ###
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_add_sell_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_detail_sell_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_side_menu_bar.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_view_sell_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_quotation_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_add_quotation_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_print_quotation_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_return_product_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_add_return_product_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_print_return_product_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_pack_product_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_bundle_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_bundle_detail_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_buy___add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_buy___list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_buy___detail_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_sell___add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_sell___edit_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_sell___list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_sell___detail_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_detail_buy_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_return_buy_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_variant_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_return_sell_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_transfer_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_detail_product_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_category_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_detail_product_category_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_edit_product_category_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_add_product_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_edit_product_bundle_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_add_return_buy_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_detail_return_buy_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_edit_return_buy_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_warehouse_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_report_sales_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_report_overview_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_add_buy_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_receive_product_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_add_transfer_product_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_login_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_home_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_search_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_category_add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_category_edit_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_category_list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_returnsell_add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_returnsell_detail_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_returnsell_list_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_connect___list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_connect___detail_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_contact___add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_contact___edit_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_contact___list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_contact___detail_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_promotion___add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_promotion___edit_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_promotion___list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_promotion___detail_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_products___add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_products___edit_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_products___list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_products___detail_page.robot

Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_set___add_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_set___edit_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_set___list_page.robot
Resource        ${CURDIR}/../keywords/pages/light_portal/light_portal_product_set___detail_page.robot


### pages [middle_portal] ###
Resource        ${CURDIR}/../keywords/pages/middle_portal/middle_portal_product_add_page.robot
Resource        ${CURDIR}/../keywords/pages/middle_portal/middle_portal_product_edit_page.robot
Resource        ${CURDIR}/../keywords/pages/middle_portal/middle_portal_product_list_page.robot
Resource        ${CURDIR}/../keywords/pages/middle_portal/middle_portal_product_detail_page.robot


### features [light_portal] ###
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_add_sell_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_detail_sell_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_add_quotation_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_print_quotation_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_add_return_product_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_print_return_product_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_return_product_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_pack_product_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_add_product_bundle_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_detail_product_bundle_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_product_bundle_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_buy_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_variant_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_view_sell_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_product_transfer_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_product_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_product_category_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_edit_product_category_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_detail_product_category_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_add_product_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_detail_product_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_edit_product_bundle_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_add_return_buy_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_detail_return_buy_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_product_warehouse_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_return_buy_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_report_sales_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_report_overview_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_add_buy_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_receive_product_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_detail_buy_list_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_home_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_login_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_search_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_category_features.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_returnsell_features.robot

Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_buy___feature.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_sell___feature.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_contact___teature.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_connect___teature.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_promotion___feature.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_products___feature.robot
Resource        ${CURDIR}/../keywords/features/light_portal/light_portal_product_set___feature.robot


### features [middle_portal] ###
Resource        ${CURDIR}/../keywords/features/middle_portal/middle_portal_product_features.robot


### features [api_portal] ###
Resource        ${CURDIR}/../keywords/features/api_portal/api_portal_logistic_point___teature.robot