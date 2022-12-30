*** Settings ***
Library     Collections
Library     RequestsLibrary

#Test Teardown       post request     mysession   ${clear_db_url}

*** Variables ***
${base_url}     http://localhost:8080
${api_url}      /calculator/insertMultiple
${clear_db_url}     /calculator/rakeDatabase
${check_summary}    /calculator/taxReliefSummary

*** Test Cases ***
#Act1_Natid_empty
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=    create dictionary    birthday=01012001      gender=m     name=superman       natid=      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console     natid cannot be empty
#    should be equal     ${status_code}      500
#
#
#Act1_Natid_less_than_3_character
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m     name=superman       natid=abc      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console      natid need to be more than 3 character
#    should be equal     ${status_code}      500
#
#
#Act1_Natid_character_special_charater
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m     name=superman       natid=abcDEF!@#$%^&*()      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_missing_Natid
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m     name=superman      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Natid_valid
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=    create dictionary    birthday=01012001      gender=m     name=superman      natid=123456      salary=100000     tax=10
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_Name_empty
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m     name=       natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console      Name cannot be empty
#    should be equal     ${status_code}      500
#
#
#Act1_Name_digit_special_charater
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m     name=!@#$%^&*()0123        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    Log to console      Name should not have special characters and digits
#    should be equal     ${status_code}      500
#
#
#Act1_missing_Name
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Name_valid
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_Gender_empty
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console      gender should not be empty
#    should be equal     ${status_code}      500
#
#
#Act1_Gnder_with_two_character
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=FM     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Gnder_with_special_character
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=@     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console      gender should not have special character
#    should be equal     ${status_code}      500
#
#
#Act1_Gnder_with_digit
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=1     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console      gender should not have digit
#    should be equal     ${status_code}      500
#
#
#Act1_missing_Gender
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console      gender should not be missing
#    should be equal     ${status_code}      500
#
#Act1_valid_Gender
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01012001      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_Birthday_day_is_zero
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=00012001      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#     ${content}=    convert to string    ${response.content}
#     should contain     ${content}      Invalid value for DayOfMonth (valid values 1 - 28/31)
#
#
#Act1_Birthday_day_is_higher_than_31
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=32012001      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      Invalid value for DayOfMonth (valid values 1 - 28/31)
#
#
#
#Act1_Birthday_month_is_zero
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01002001      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      Invalid value for MonthOfYear (valid values 1 - 12)
#
#
#Act1_Birthday_month_is_more_than_12
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01132001      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      Invalid value for MonthOfYear (valid values 1 - 12)
#
#
#Act1_Birthday_year_is_zero
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01010000      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      Invalid value for YearOfEra (valid values 1 - 999999999/1000000000)
#
#
#Act1_Birthday_year_is_one
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=01010001      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    log to console      the working class hero birthday is too low for it ot be feasable
#    should be equal     ${status_code}      500
#
#Act1_missing_Birthday
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Birthday_valid
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=100000     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_Salary_is_empty
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Salary_is_special_character
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=@     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      is neither a decimal digit number, decimal point
#
#
#Act1_Salary_is_character
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=abc     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      is neither a decimal digit number, decimal point
#
#
#Act1_Salary_is_negtative
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=-1123     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console      Salary should not be negative
#    should be equal     ${status_code}      500
#
#
#Act1_missing_Salary
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Salary_valid_digit
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=12345    tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_Salary_valid_decimal_digit
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345    salary=12345.23     tax=0
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_Tax_empty
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345    salary=12345.23     tax=
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Tax_is_character
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=123     tax=abc
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      is neither a decimal digit number, decimal point
#
#
#Act1_Tax_is_special_character
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=123     tax=@
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#    ${content}=    convert to string    ${response.content}
#    should contain     ${content}      is neither a decimal digit number, decimal point
#
#
#Act1_Tax_is_negative_number
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=123     tax=-123
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    log to console     Tax should not be negative
#    should be equal     ${status_code}      500
#
#
#Act1_missing_Tax
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=123
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      500
#
#
#Act1_Tax_valid_digit
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=123      tax=123
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#
#Act1_Tax_valid_decimal_digit
#    RequestsLibrary.create session  mysession     ${base_url}
#    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=123      tax=123.12
#    @{body}=    Create List     ${hero1}
#    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
#    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
#    #Validation
#    ${status_code}=     convert to string       ${response.status_code}
#    should be equal     ${status_code}      202
#
#

Act1_Valid_with_Invalid_working_class
    RequestsLibrary.create session  mysession     ${base_url}
    ${hero1}=     create dictionary    birthday=24011993      gender=m     name=super man        natid=12345      salary=123      tax=123.12
    ${hero2}=     create dictionary    name=super women        natid=54321     salary=321      tax=321
    @{body}=    Create List     ${hero1}    ${hero2}
    ${header}=      create dictionary    Content-Type=application/json      accept=*/*
    ${response}=    post request    mysession      ${api_url}   data=${body}   headers=${header}
    #Validation
    ${status_code}=     convert to string       ${response.status_code}
    should be equal     ${status_code}      500
    ${header}=      create dictionary    accept=*/*
    ${response}=    get request    mysession      ${check_summary}   headers=${header}
    ${content}=     convert to string       ${response.content}
    should contain  ${content}      "totalWorkingClassHeroes":"0"

*** Keywords ***

