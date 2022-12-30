*** Settings ***
Library     Collections
Library     RequestsLibrary

Test Teardown       post request     mysession   ${clear_db_url}

*** Variables ***
${base_url}     http://localhost:8080
${api_url}      /calculator/insert
${tax_url}      /calculator/taxRelief
${clear_db_url}     /calculator/rakeDatabase


*** Test Cases ***
Act1_verify_API_return_natid_tax_relief_amount_and_name
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012001      gender=m     name=super man       natid=123456    salary=10000     tax=10
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "natid":"1234$$"
    should contain      ${content}      "name":"super man"
    should contain      ${content}     "relief":"7992.00"


Act2_verify_natid_is_masked_by_$_after_4th_character
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012001      gender=m     name=super man       natid=123456    salary=10000     tax=10
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "natid":"1234$$"


Act3_verify_computation_for_age_at_most_18_at_age_18_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012004      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"1990.00"


Act3_verify_computation_for_age_at_most_18_at_age_18_female
        RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012004      gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"2490.00"


Act3_verify_computation_for_age_at_most_18_at_age_19_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012003      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"1592.00"


Act3_verify_computation_for_age_at_most_18_at_age_19_female
        RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012003      gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"2092.00"


Act3_verify_computation_for_age_at_most_18_at_age_35_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011987      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"1592.00"


Act3_verify_computation_for_age_at_most_18_at_age_35_female
        RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011987      gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"2092.00"


Act3_verify_computation_for_age_at_most_18_at_age_36_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011986      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"995.00"


Act3_verify_computation_for_age_at_most_18_at_age_36_female
        RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011986      gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"1495.00"


Act3_verify_computation_for_age_at_most_18_at_age_50_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011972      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"995.00"


Act3_verify_computation_for_age_at_most_18_at_age_50_female
        RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011972      gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"1495.00"


Act3_verify_computation_for_age_at_most_18_at_age_51_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011971      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"730.00"


Act3_verify_computation_for_age_at_most_18_at_age_51_female
        RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011971      gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"1230.00"


Act3_verify_computation_for_age_at_most_18_at_age_75_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011947      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"730.00"


Act3_verify_computation_for_age_at_most_18_at_age_75_female
        RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011947     gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"1230.00"

Act3_verify_computation_for_age_at_most_18_at_age_76_male
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011946      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"99.00"


Act3_verify_computation_for_age_at_most_18_at_age_76_female
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011946     gender=f     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding is not working
    should contain      ${content}      "relief":"599.00"


Act4_check_rounding_rule_up
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012004      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  rounding up is not working
    should contain      ${content}      "relief":"1990.00"


Act4_check_rounding_rule_down
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01011946      gender=m     name=super man       natid=123456    salary=2000     tax=10.45
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"99.00"



Act5_if_tax_relief_is_0
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012005      gender=m     name=super man       natid=123456    salary=100     tax=100
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console  Is tax relief suppose to be 0 ?
    should contain      ${content}      "relief":"0.00"


Act5_if_tax_relief_is_1.3
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012005      gender=m     name=super man       natid=123456    salary=100     tax=98.7
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"50.00"


Act5_if_tax_relief_is_48.6
     RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012005      gender=m     name=super man       natid=123456    salary=100     tax=51.4
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"50.00"



Act5_if_tax_relief_is_50
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012005      gender=m     name=super man       natid=123456    salary=100     tax=50
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"50.00"


Act6_truncating_rule_with_lower_rounding
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012005     gender=m     name=super man       natid=123456    salary=2000     tax=20.505

    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    should contain      ${content}      "relief":"1979.00"


Act6_truncating_rule_with_upper_rounding
    RequestsLibrary.create session  mysession     ${base_url}
    ${body}=    create dictionary    birthday=01012005      gender=m     name=super man       natid=123456    salary=2000     tax=20.405
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      202

    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${tax_url}     headers=${header}
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      200
    ${content}=     convert to string       ${response.content}
    log to console      Since the relief is 1979.59 this means that the truncate is working but the rounding is not
    should contain      ${content}      "relief":"1980"