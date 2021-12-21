*** Settings ***
Documentation    Suite description

*** Keyword ***
Login
    [arguments]     ${email}    ${pw}
    Open Browser    url=https://app.deriv.com   browser=chrome
    Set window size     1920    1080
    wait until page does not contain element     dt_core_header_acc-info-preloader   60
    wait until page contains element     ${login_btn}     60
    Click Element   ${login_btn}
    wait until page contains element     ${email_field}     15
    input text   ${email_field}   ${email}
    input text   ${pw_field}   ${pw}
    Click Element   ${login_oauth_btn}
    wait until page does not contain element     dt_core_header_acc-info-preloader   60
    wait until page contains element     ${acc_info}    15
    Click Element   ${acc_info}
    sleep   3
    wait until page contains element   ${acc_switcher_tab}    15
    Click Element   ${acc_switcher_tab}
    wait until page contains element   ${demo_account}    15
    Click Element   ${demo_account}

Buy Rise Contract
    Reload Page
    wait until page does not contain element   //*[@class="chart-container__loader"]   60
    wait until page contains element    ${trade_chart}   15
    Click Element   ${trade_btn}
    Click Element   ${synthetic_indices}
    wait until page contains element    ${volatility_10}   15
    Click Element   ${volatility_10}
    sleep   5
    wait until element is visible   ${buy_contract}      60
    Click Element   ${buy_contract}

Buy Lower Contract
    wait until page contains element    ${trade_chart}   15
    Click Element   ${trade_btn}
    Click Element   ${forex}
    wait until page contains element    ${AUD_USD}   15
    Click Element   ${AUD_USD}
    wait until page does not contain element    //*[@class="chart-container__loader"]   60
    click element   ${contract_dropdown}
    click element   ${higher_lower}
    wait until page does not contain element    //*[@class="chart-container__loader"]   60
    click element   ${toggle}
    sleep   3
    press keys     name=duration   BACKSPACE
    input text     name=duration    2
    click element   ${payout_toggle}
    Wait Until Page Contains Element    ${amount_input}    5
    ${current_value}=    Get Element Attribute    ${amount_input}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${amount_input}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${amount_input}   DELETE
    input text      ${amount_input}     15.50
    sleep   3
    wait until element is enabled   ${sell_contract}
    click element   ${sell_contract}

Check Relative Barrier Error
    Wait Until Page Contains Element    ${amount_input}    5
    ${current_value}=    Get Element Attribute    ${amount_input}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${amount_input}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${amount_input}   DELETE
    input text      ${amount_input}     10
    sleep   3
    Wait Until Page Contains Element    ${barrier_input}    7
    ${current_value}=    Get Element Attribute    ${barrier_input}    value
    ${value_length}=    Get Length    ${current_value}
    # sometimes text cursor starts from the middle, so delete front and back characters
    Repeat Keyword    ${value_length}    Press Keys    ${barrier_input}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${barrier_input}   DELETE
    input text      ${barrier_input}     +1

API Token Page
    Reload Page
    wait until page does not contain element     dt_core_header_acc-info-preloader   60
    Wait Until Page Contains Element    ${account_toggle}    15
    Click Element   ${account_toggle}
#    wait until page does not contain element    //*[@class="initial-loader account__initial-loader"]    60
    Wait Until Page Contains Element    ${API_token}    15
    Click Element   ${API_token}
    Wait Until Page Contains Element    ${api_token_checkbox}    15
    Wait Until Page Contains Element  ${token_field}   15
    Element should be disabled      ${create_btn}
    input text      ${token_field}      b@rba7a?+
    sleep   3
    Wait Until Page Contains Element    ${token_field}    7
    ${current_value}=    Get Element Attribute    ${token_field}    value
    ${value_length}=    Get Length    ${current_value}
    Repeat Keyword    ${value_length}    Press Keys    ${token_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${token_field}   DELETE
    Click Element   //*[text()="Read"]
    input text      ${token_field}      b
    sleep   2
    Press Keys    ${token_field}   BACKSPACE
    sleep   2
    Click Element   //*[text()="Trade"]
    input text      ${token_field}      abcdefghijklmnopqrstuvwxyz12345678
    sleep   2
    Wait Until Page Contains Element    ${token_field}    7
    ${current_value}=    Get Element Attribute    ${token_field}    value
    ${value_length}=    Get Length    ${current_value}
    Repeat Keyword    ${value_length}    Press Keys    ${token_field}   BACKSPACE
    Repeat Keyword    1   Press Keys    ${token_field}   DELETE
    Click Element   //*[text()="Payments"]
    sleep   2
    Click Element   //*[text()="Admin"]
    sleep   2
    Click Element   //*[text()="Trading information"]
    sleep   3


