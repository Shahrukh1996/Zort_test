import os
import yaml
from pathlib import Path

def update_data (sell_name):

    current_directory = Path.cwd()

    # # ดึงไฟล์
    # with open('../../resources/testdata/light_portal/SELL_03_04.yaml', 'r', encoding="utf-8") as yaml_file:
    #     value = yaml.safe_load(yaml_file)

    # # กำหนดข้อมูลแก้ไข
    # value['sell_03_04']['test_data']['sell_name'] = sell_name

    # # แก้ไขข้อมูล
    # with open('../../resources/testdata/light_portal/SELL_03_04.yaml', 'w', encoding="utf-8") as yaml_file:
    #     yaml.dump(value, yaml_file)
        
    # # เรียกดูข้อมูล
    # with open('C:/Users/totsawat.a_zortout/Documents/zortautomatetest/resources/testdata/light_portal/SELL_03_04.yaml', encoding="utf-8") as yaml_file:
    #     output= yaml.safe_load(yaml_file)

    # ../../resources/testdata/light_portal/SELL_03_04.yaml
    # C:/Users/totsawat.a_zortout/Documents/zortautomatetest/resources/testdata/light_portal/SELL_03_04.yaml
    # C:/Users/totsawat.a_zortout/Documents/zortautomatetest/testscase/light_portal

    # /robot