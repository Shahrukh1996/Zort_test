import pandas as pd

flash_data = [0, 1, 3, 5, 7, 9, 11, 12, 13, 15, 17, 19, 21, 23, 25]
def read_flash_data ():
    data = pd.read_excel('C:/Users/totsawat.a_zortout/Documents/zortautomatetest/resources/testdata/api_portal/logistic_point/flash_zortout.xlsx', sheet_name='Flash-Data', usecols = flash_data)

    sec_1_weight = []
    sec_1_size = []
    col_zone_1 = []
    col_zone_2 = []
    col_zone_3 = []
    col_zone_4 = []
    col_zone_5 = []

    sec_2_weight = []
    sec_2_size = []
    col_zone_6 = []
    col_zone_7 = []
    col_zone_8 = []
    col_zone_9 = []
    col_zone_10 = []
    col_zone_11 = []

    for i in range(len(data)):
        sec_1_weight.append(str(data.loc[i, "weight1"]))
        sec_1_size.append(str(data.loc[i, "size1"]))
        col_zone_1.append(str(data.loc[i, "Unnamed: 3"]))
        col_zone_2.append(str(data.loc[i, "Unnamed: 5"]))
        col_zone_3.append(str(data.loc[i, "Unnamed: 7"]))
        col_zone_4.append(str(data.loc[i, "Unnamed: 9"]))
        col_zone_5.append(str(data.loc[i, "Unnamed: 11"]))

        sec_2_weight.append(str(data.loc[i, "weight2"]))
        sec_2_size.append(str(data.loc[i, "size2"]))
        col_zone_6.append(str(data.loc[i, "Unnamed: 15"]))
        col_zone_7.append(str(data.loc[i, "Unnamed: 17"]))
        col_zone_8.append(str(data.loc[i, "Unnamed: 19"]))
        col_zone_9.append(str(data.loc[i, "Unnamed: 21"]))
        col_zone_10.append(str(data.loc[i, "Unnamed: 23"]))
        col_zone_11.append(str(data.loc[i, "Unnamed: 25"]))

    return sec_1_weight, sec_1_size, col_zone_1, col_zone_2, col_zone_3, col_zone_4, col_zone_5, sec_2_weight, sec_2_size, col_zone_6, col_zone_7, col_zone_8, col_zone_9, col_zone_10, col_zone_11

test_case = [1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73]
def read_test_case ():
    data = pd.read_excel('C:/Users/totsawat.a_zortout/Documents/zortautomatetest/resources/testdata/api_portal/logistic_point/flash_zortout.xlsx', sheet_name='Flash-Testcase', usecols = test_case)

    col_region = []
    col_province = []
    col_district = []
    col_parish = []
    col_code = []
    col_remote = []
    col_tourism = []
    col_island = []

    zone_1_case_a_weight = []
    zone_1_case_a_size = []
    zone_1_case_b_weight = []
    zone_1_case_b_size = []

    zone_2_case_a_weight = []
    zone_2_case_a_size = []
    zone_2_case_b_weight = []
    zone_2_case_b_size = []
    zone_2_case_c_weight = []
    zone_2_case_c_size = []

    zone_3_case_a_weight = []
    zone_3_case_a_size = []
    zone_3_case_b_weight = []
    zone_3_case_b_size = []
    zone_3_case_c_weight = []
    zone_3_case_c_size = []

    zone_4_case_a_weight = []
    zone_4_case_a_size = []
    zone_4_case_b_weight = []
    zone_4_case_b_size = []
    zone_4_case_c_weight = []
    zone_4_case_c_size = []

    zone_5_case_a_weight = []
    zone_5_case_a_size = []
    zone_5_case_b_weight = []
    zone_5_case_b_size = []
    zone_5_case_c_weight = []
    zone_5_case_c_size = []

    zone_6_case_a_weight = []
    zone_6_case_a_size = []
    zone_6_case_b_weight = []
    zone_6_case_b_size = []
    zone_6_case_c_weight = []
    zone_6_case_c_size = []

    zone_7_case_a_weight = []
    zone_7_case_a_size = []
    zone_7_case_b_weight = []
    zone_7_case_b_size = []
    zone_7_case_c_weight = []
    zone_7_case_c_size = []

    zone_8_case_a_weight = []
    zone_8_case_a_size = []
    zone_8_case_b_weight = []
    zone_8_case_b_size = []
    zone_8_case_c_weight = []
    zone_8_case_c_size = []

    zone_9_case_a_weight = []
    zone_9_case_a_size = []
    zone_9_case_b_weight = []
    zone_9_case_b_size = []
    zone_9_case_c_weight = []
    zone_9_case_c_size = []

    zone_10_case_a_weight = []
    zone_10_case_a_size = []
    zone_10_case_b_weight = []
    zone_10_case_b_size = []
    zone_10_case_c_weight = []
    zone_10_case_c_size = []

    zone_11_case_a_weight = []
    zone_11_case_a_size = []
    zone_11_case_b_weight = []
    zone_11_case_b_size = []
    zone_11_case_c_weight = []
    zone_11_case_c_size = []

    for i in range(len(data)):
        col_region.append(str(data.loc[i, "Unnamed: 1"]))
        col_province.append(str(data.loc[i, "Unnamed: 2"]))
        col_district.append(str(data.loc[i, "Unnamed: 3"]))
        col_parish.append(str(data.loc[i, "Unnamed: 4"]))
        col_code.append(str(data.loc[i, "Unnamed: 5"]))
        col_remote.append(str(data.loc[i, "Unnamed: 6"]))
        col_tourism.append(str(data.loc[i, "Unnamed: 7"]))
        col_island.append(str(data.loc[i, "Unnamed: 8"]))

        zone_1_case_a_weight.append(str(data.loc[i, "Unnamed: 10"]))
        zone_1_case_a_size.append(str(data.loc[i, "Unnamed: 11"]))
        zone_1_case_b_weight.append(str(data.loc[i, "Unnamed: 12"]))
        zone_1_case_b_size.append(str(data.loc[i, "Unnamed: 13"]))

        zone_2_case_a_weight.append(str(data.loc[i, "Unnamed: 14"]))
        zone_2_case_a_size.append(str(data.loc[i, "Unnamed: 15"]))
        zone_2_case_b_weight.append(str(data.loc[i, "Unnamed: 16"]))
        zone_2_case_b_size.append(str(data.loc[i, "Unnamed: 17"]))
        zone_2_case_c_weight.append(str(data.loc[i, "Unnamed: 18"]))
        zone_2_case_c_size.append(str(data.loc[i, "Unnamed: 19"]))

        zone_3_case_a_weight.append(str(data.loc[i, "Unnamed: 20"]))
        zone_3_case_a_size.append(str(data.loc[i, "Unnamed: 21"]))
        zone_3_case_b_weight.append(str(data.loc[i, "Unnamed: 22"]))
        zone_3_case_b_size.append(str(data.loc[i, "Unnamed: 23"]))
        zone_3_case_c_weight.append(str(data.loc[i, "Unnamed: 24"]))
        zone_3_case_c_size.append(str(data.loc[i, "Unnamed: 25"]))

        zone_4_case_a_weight.append(str(data.loc[i, "Unnamed: 26"]))
        zone_4_case_a_size.append(str(data.loc[i, "Unnamed: 27"]))
        zone_4_case_b_weight.append(str(data.loc[i, "Unnamed: 28"]))
        zone_4_case_b_size.append(str(data.loc[i, "Unnamed: 29"]))
        zone_4_case_c_weight.append(str(data.loc[i, "Unnamed: 30"]))
        zone_4_case_c_size.append(str(data.loc[i, "Unnamed: 31"]))

        zone_5_case_a_weight.append(str(data.loc[i, "Unnamed: 32"]))
        zone_5_case_a_size.append(str(data.loc[i, "Unnamed: 33"]))
        zone_5_case_b_weight.append(str(data.loc[i, "Unnamed: 34"]))
        zone_5_case_b_size.append(str(data.loc[i, "Unnamed: 35"]))
        zone_5_case_c_weight.append(str(data.loc[i, "Unnamed: 36"]))
        zone_5_case_c_size.append(str(data.loc[i, "Unnamed: 37"]))

        zone_6_case_a_weight.append(str(data.loc[i, "Unnamed: 38"]))
        zone_6_case_a_size.append(str(data.loc[i, "Unnamed: 39"]))
        zone_6_case_b_weight.append(str(data.loc[i, "Unnamed: 40"]))
        zone_6_case_b_size.append(str(data.loc[i, "Unnamed: 41"]))
        zone_6_case_c_weight.append(str(data.loc[i, "Unnamed: 42"]))
        zone_6_case_c_size.append(str(data.loc[i, "Unnamed: 43"]))

        zone_7_case_a_weight.append(str(data.loc[i, "Unnamed: 44"]))
        zone_7_case_a_size.append(str(data.loc[i, "Unnamed: 45"]))
        zone_7_case_b_weight.append(str(data.loc[i, "Unnamed: 46"]))
        zone_7_case_b_size.append(str(data.loc[i, "Unnamed: 47"]))
        zone_7_case_c_weight.append(str(data.loc[i, "Unnamed: 48"]))
        zone_7_case_c_size.append(str(data.loc[i, "Unnamed: 49"]))

        zone_8_case_a_weight.append(str(data.loc[i, "Unnamed: 50"]))
        zone_8_case_a_size.append(str(data.loc[i, "Unnamed: 51"]))
        zone_8_case_b_weight.append(str(data.loc[i, "Unnamed: 52"]))
        zone_8_case_b_size.append(str(data.loc[i, "Unnamed: 53"]))
        zone_8_case_c_weight.append(str(data.loc[i, "Unnamed: 54"]))
        zone_8_case_c_size.append(str(data.loc[i, "Unnamed: 55"]))

        zone_9_case_a_weight.append(str(data.loc[i, "Unnamed: 56"]))
        zone_9_case_a_size.append(str(data.loc[i, "Unnamed: 57"]))
        zone_9_case_b_weight.append(str(data.loc[i, "Unnamed: 58"]))
        zone_9_case_b_size.append(str(data.loc[i, "Unnamed: 59"]))
        zone_9_case_c_weight.append(str(data.loc[i, "Unnamed: 60"]))
        zone_9_case_c_size.append(str(data.loc[i, "Unnamed: 61"]))

        zone_10_case_a_weight.append(str(data.loc[i, "Unnamed: 62"]))
        zone_10_case_a_size.append(str(data.loc[i, "Unnamed: 63"]))
        zone_10_case_b_weight.append(str(data.loc[i, "Unnamed: 64"]))
        zone_10_case_b_size.append(str(data.loc[i, "Unnamed: 65"]))
        zone_10_case_c_weight.append(str(data.loc[i, "Unnamed: 66"]))
        zone_10_case_c_size.append(str(data.loc[i, "Unnamed: 67"]))

        zone_11_case_a_weight.append(str(data.loc[i, "Unnamed: 68"]))
        zone_11_case_a_size.append(str(data.loc[i, "Unnamed: 69"]))
        zone_11_case_b_weight.append(str(data.loc[i, "Unnamed: 70"]))
        zone_11_case_b_size.append(str(data.loc[i, "Unnamed: 71"]))
        zone_11_case_c_weight.append(str(data.loc[i, "Unnamed: 72"]))
        zone_11_case_c_size.append(str(data.loc[i, "Unnamed: 73"]))

    return col_region, col_province, col_district, col_parish, col_code, col_remote, col_tourism, col_island, zone_1_case_a_weight, zone_1_case_a_size, zone_1_case_b_weight, zone_1_case_b_size, zone_2_case_a_weight, zone_2_case_a_size, zone_2_case_b_weight, zone_2_case_b_size, zone_2_case_c_weight, zone_2_case_c_size, zone_3_case_a_weight, zone_3_case_a_size, zone_3_case_b_weight, zone_3_case_b_size, zone_3_case_c_weight, zone_3_case_c_size, zone_4_case_a_weight, zone_4_case_a_size, zone_4_case_b_weight, zone_4_case_b_size, zone_4_case_c_weight, zone_4_case_c_size, zone_5_case_a_weight, zone_5_case_a_size, zone_5_case_b_weight, zone_5_case_b_size, zone_5_case_c_weight, zone_5_case_c_size, zone_6_case_a_weight, zone_6_case_a_size, zone_6_case_b_weight, zone_6_case_b_size, zone_6_case_c_weight, zone_6_case_c_size, zone_7_case_a_weight, zone_7_case_a_size, zone_7_case_b_weight, zone_7_case_b_size, zone_7_case_c_weight, zone_7_case_c_size, zone_8_case_a_weight, zone_8_case_a_size, zone_8_case_b_weight, zone_8_case_b_size, zone_8_case_c_weight, zone_8_case_c_size, zone_9_case_a_weight, zone_9_case_a_size, zone_9_case_b_weight, zone_9_case_b_size, zone_9_case_c_weight, zone_9_case_c_size, zone_10_case_a_weight, zone_10_case_a_size, zone_10_case_b_weight, zone_10_case_b_size, zone_10_case_c_weight, zone_10_case_c_size, zone_11_case_a_weight, zone_11_case_a_size, zone_11_case_b_weight, zone_11_case_b_size, zone_11_case_c_weight, zone_11_case_c_size