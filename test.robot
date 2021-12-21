*** Settings ***
Library    SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${pw_field}     //*[@type="password"]
${login_oauth_btn}  //*[text()="Log in"]
${acc_info}     dt_core_account-info_acc-info
${acc_switcher_tab}     dt_core_account-switcher_demo-tab
${real_acc}     real_account_tab
${demo_account}     //*[contains(@id,"dt_VRTC")]
${trade_chart}       chart_container
${trade_btn}       //*[@class="cq-menu-btn"]
${synthetic_indices}    //*[text()="Synthetic Indices"]
${volatility_10}     //*[text()="Volatility 10 (1s) Index"]
${buy_contract}     dt_purchase_call_button
${forex}    //*[text()="Forex"]
${AUD_USD}  //*[text()="AUD/USD"]
${contract_dropdown}    dt_contract_dropdown
${toggle}   dt_simple_toggle
${payout_toggle}    dc_payout_toggle_item
${amount_input}     dt_amount_input
${sell_contract}     dt_purchase_put_button
${higher_lower}     dt_contract_high_low_item
${barrier_input}    dt_barrier_1_input
${account_toggle}   //*[@class="account-settings-toggle"]
${API_token}    dc_api-token_link
${api_token_checkbox}   //*[@class="da-api-token__checkbox-wrapper"]
${token_field}     //*[@class="dc-input__field"]
${create_btn}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button


*** Test Cases ***
Open Deriv
    Login   ${my_email}   ${my_pw}
#    Buy Rise Contract
#    Buy Lower Contract
#    Check Relative Barrier Error
    API Token Page