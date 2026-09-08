*** Settings ***
Documentation    File khusus untuk variabel dan data konfigurasi Create Billing ID Teller

*** Variables ***
# Variabel dinamis untuk linter VS Code (mencegah error VariableNotFound)
${DYNAMIC_ACCOUNT_NO}   ${EMPTY}
${DYNAMIC_TAX_ID}       ${EMPTY}
${DYNAMIC_CLIENT_NAME}  ${EMPTY}

# MANUAL DATA INPUT VARIABLES
# ==========================================
${MANUAL_ACCOUNT_NO}     4561452364125
${MANUAL_TAX_PAYER_ID}   3326501102202121
${MANUAL_CLIENT_NAME}    test qa balance