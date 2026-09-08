*** Variables ***
# Locator Halaman Login QNB
${INPUT_USERNAME}    css=#Main_tbUserName
${INPUT_PASSWORD}    css=#Main_tbPassword
${BTN_LOGIN}         css=#Main_rbtLoginNew

# Locator Halaman Dashboard
${LBL_WELCOME}       xpath=//*[contains(text(),'Welcome to TAXIS Gateway Application')]

# Locator Menu Teller & Pembayaran Pajak
${FRAME_DASHBOARD}          xpath=//frame[@src='Home/Home.aspx']
${MENU_PEMBAYARAN_PAJAK}    css=a[id='Main_ucTeller_btnBillingList'] p
${SUBMENU_CREATE_BILLING}   css=#mnuTransactionCreatedBilling
${BTN_CREATE_NEW_BILLING}   css=span[id='ctl00_Main_rbtCreateNewBillingId'] span[class='rbText']

# ==========================================
# FORM CREATE NEW BILLING ID (POP-UP)
# ==========================================
${FRAME_POPUP}              xpath=//iframe[@name='PopUpWindow']
${RDO_NASABAH}               id=Main_rblNasabahType_0
${INPUT_ACCOUNT_NO}          id=Main_tbCustomerAcctNo

# --- HASIL REVISI LOCATOR TERBARU ---
${INPUT_TAX_PAYER_ID}        id=ctl00_Main_tbTaxPayerIdNo_Input
${DDL_CHANNEL_TYPE}          id=Main_ddlChannelType
${INPUT_CLIENT_NAME}         id=Main_tbCustomerName
${INPUT_DESCRIPTION}         id=Main_tbDescription

# ==========================================
# Elemen Form Detail Pajak & Submit
# ==========================================
${INPUT_TAX_ACCOUNT_MAP}     id=Main_rcbTaxAccountCode_Input
${INPUT_PAYMENT_CODE}        id=Main_rcbPaymentCode_Input
${INPUT_TAX_YEAR}            id=Main_rntYear
${INPUT_AMOUNT}              id=Main_rntAmount
${BTN_ADD_PAYMENT}           id=Main_rbtAddTax
${BTN_SUBMIT_BILLING}        id=Main_rbtSubmit