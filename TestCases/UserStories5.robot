*** Settings ***
Library     Collections
Library     RequestsLibrary

*** Variables ***

${base_url}  http://localhost:8080
${API_url}    /

*** Test Cases ***
Act1_button_to_dispense_is_red
    RequestsLibrary.create session  mysession     ${base_url}
    ${response}=    get request    mysession    ${API_url}
    ${status_code}=     convert to string       ${response.status_code}
    ${content}=     convert to string       ${response.content}
    should be equal        ${status_code}     200
    should contain      ${content}  btn btn-danger btn-block


Act2_Dispense_Now_Button
    RequestsLibrary.create session  mysession     ${base_url}
    ${response}=    get request    mysession    ${API_url}
    ${status_code}=     convert to string       ${response.status_code}
    ${content}=     convert to string       ${response.content}
    should be equal        ${status_code}     200
    should contain      ${content}    style="font-size: 5em">Dispense Now</a>


#AC3: After clicking on the button, it should direct me to a page with a text that says “Cash dispensed”
