*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***
${base_url}         http://100.25.39.215:8001/devices
${Device_id}        12
${file_name}        device.csv
${bearerToken}     Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJybGFpcmRAZXh0cmVtZW5ldHdvcmtzLmNvbSIsInVzZXJJZCI6NTUzNCwicm9sZSI6IkFkbWluaXN0cmF0b3IiLCJjdXN0b21lcklkIjo1NDk5LCJjdXN0b21lck1vZGUiOjAsImhpcUVuYWJsZWQiOmZhbHNlLCJvd25lcklkIjoxMDgxLCJvcmdJZCI6MCwiZGF0YUNlbnRlciI6IkE2UjEiLCJpc3MiOiJleHRyZW1lY2xvdWRpcS5jb20iLCJpYXQiOjE2MjY5Njc0ODUsImV4cCI6MTYyNzA1Mzg4NX0.vSUzON4h1_7AiR4YsC-75BG7y1kWRFADrNNA6puMgsE


*** Test Cases ***
GETDownloadFile
        create session      mysession       ${base_url}
         ${header}  create dictionary   Authorization=${bearerToken}    accept=application/json
         ${response}=    get request  mysession   /${Device_id}/download    headers=${header}
         Create Binary File     ${EXECDIR}/${file_name}     ${response.content}

         ${contentTypeValue}=  get from dictionary  ${response.headers}   content-type
         should be equal   ${contentTypeValue}      text/csv; charset=utf-8
         log to console  ${response.headers}
