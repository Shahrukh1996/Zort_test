*** Variables ***



*** Keywords ***
Read json file
    [Arguments]      ${json_file}
    [Documentation]  ดึง data จาก json file
        ${read_file}=  OperatingSystem.Get file  ${json_file}
        ${data}=  BuiltIn.Evaluate  json.loads('''${read_file}''')  json
    [Return]  ${data}

Convert response
    [Arguments]      ${response}
    [Documentation]  ดึง data จาก response
    ${res_str}=   String.Decode bytes to string  ${response.content}  UTF-8
    ${res_json}=  JSONLibrary.Convert String to JSON  ${res_str}
    [Return]  ${res_json}

Send api post
    [Arguments]      ${url}  ${header}  ${body}
    [Documentation]  ยิง api post
        # ยิง api
        RequestsLibrary.Create session  myssion  ${url ['ip']}  disable_warnings=1
        ${response}=  RequestsLibrary.Post on session  myssion  ${url ['path']}  headers=${header}  json=${body}
        # แปลง res
        ${res_json}=  api_portal_common___keywords.Convert response  ${response}
    [Return]  ${res_json}