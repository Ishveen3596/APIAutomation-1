*** Settings ***
Library   RequestsLibrary
Library   Collections
Library   OperatingSystem



*** Variables ***
${base_url}   http://100.25.39.215:8001/devices
${Model}   models
${bearerToken}   Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJybGFpcmRAZXh0cmVtZW5ldHdvcmtzLmNvbSIsInVzZXJJZCI6NTUzNCwicm9sZSI6IkFkbWluaXN0cmF0b3IiLCJjdXN0b21lcklkIjo1NDk5LCJjdXN0b21lck1vZGUiOjAsImhpcUVuYWJsZWQiOmZhbHNlLCJvd25lcklkIjoxMDgxLCJvcmdJZCI6MCwiZGF0YUNlbnRlciI6IkE2UjEiLCJpc3MiOiJleHRyZW1lY2xvdWRpcS5jb20iLCJpYXQiOjE2MjY3NTk1MDcsImV4cCI6MTYyNjg0NTkwN30.2l4WWudB3Ql3vLRbkC2b7ombhuMzTjjY-5xaSPCQM-w


*** Test Cases ***
GET_modelInfo
    create session  mysession   ${base_url}
    ${header}  create dictionary   Authorization=${bearerToken}    accept=application/json
    ${response}=    get request  mysession   /${Model}      headers=${header}
#    log to console  ${response.status_code}
#    log to console  ${response.content}
#    log to console  ${response.headers}


     #VALIDATIONS
     ${status_code}=   convert to string   ${response.status_code}
     should be equal  ${status_code}  200

     ${body}=  convert to string  ${response.content}
     should contain  ${body}        models

     ${contentTypeValue}=  get from dictionary  ${response.headers}   content-type
     should be equal   ${contentTypeValue}  application/json