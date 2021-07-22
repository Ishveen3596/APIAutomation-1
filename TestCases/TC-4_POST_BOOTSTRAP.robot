*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  os
Library  OperatingSystem
Library  RequestsLibrary
Library  Collections
Library  OperatingSystem
Library  os
Library  JSONLibrary

*** Variables ***
${base_url}         http://100.25.39.215:8001/devices
${bootstrap}        bootstrap
${bearerToken}      Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJybGFpcmRAZXh0cmVtZW5ldHdvcmtzLmNvbSIsInVzZXJJZCI6NTUzNCwicm9sZSI6IkFkbWluaXN0cmF0b3IiLCJjdXN0b21lcklkIjo1NDk5LCJjdXN0b21lck1vZGUiOjAsImhpcUVuYWJsZWQiOmZhbHNlLCJvd25lcklkIjoxMDgxLCJvcmdJZCI6MCwiZGF0YUNlbnRlciI6IkE2UjEiLCJpc3MiOiJleHRyZW1lY2xvdWRpcS5jb20iLCJpYXQiOjE2MjY4NjI4MDIsImV4cCI6MTYyNjk0OTIwMn0.pLaSkMWrLCoqijmq721hGwB4GK0yiosi26iU__IWhbY

*** Test Cases ***
POST_Bootstrap:
    create session      mysession       ${base_url}
#   ${body}=   create dictionary        model=Zebra MC70            serial_no=70000000000112
    ${json_obj}=    load json from file         C:/Users/VVDN/Desktop/Ishveen-Files/Extreme Networks/Notes/json-1.json
    ${header}  create dictionary        Authorization=${bearerToken}    accept=application/json         content-type=application/json
    ${response}=     post request       mysession          /${bootstrap}         data=${json_obj}      headers=${header}
#    log to console  ${response.status_code}
#    log to console  ${response.content}

     ${status_code}=   convert to string   ${response.status_code}
     should be equal  ${status_code}  200

