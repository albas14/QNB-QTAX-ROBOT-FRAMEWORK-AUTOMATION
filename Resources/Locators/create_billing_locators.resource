*** Settings ***
Documentation    Kumpulan Locator untuk Halaman Create Billing ID Teller


*** Variables ***
# ==========================================
# Elemen Navigasi Dashboard & Menu
# ==========================================
${FRAME_DASHBOARD}           xpath=//frame[@src='Home/Home.aspx']
${MENU_PEMBAYARAN_PAJAK}     id=Main_ucTeller_btnBillingList
${SUBMENU_CREATE_BILLING}    css=#mnuTransactionCreatedBilling

# ... (Biarkan sisa locator lainnya tetap sama seperti sebelumnya) ...
# ==========================================
# Elemen Tombol & Pop-up Form Utama
# ==========================================
${BTN_CREATE_NEW_BILLING}    css=#ctl00_Main_rbtCreateNewBillingId
#${BTN_VIEW_BILLING}          css=#ctl00_Main_rgList_ctl00_ctl04_ibtView
${FRAME_POPUP}               xpath=//iframe[@name='PopUpWindow']
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
${INPUT_TAX_ACCOUNT_MAP}     id=ctl00_Main_rcbTaxAccountCode_Input
${INPUT_PAYMENT_CODE}        id=ctl00_Main_rcbPaymentCode_Input
${INPUT_TAX_YEAR}            id=ctl00_Main_rntYear
${INPUT_AMOUNT}              id=ctl00_Main_rntAmount
${BTN_ADD_PAYMENT}           id=ctl00_Main_rbtAddTax
${BTN_SUBMIT_BILLING}        id=ctl00_Main_rbtSubmit

# Elemen di dalam PopUpWindow Frame
${BTN_TO_SETTLEMENT}         css=#ctl00_Main_rbtToSettlement
${BTN_INQUIRY}               css=#ctl00_Main_rbtInquiry
${BTN_PROCESS_SETTLEMENT}    xpath=//span[contains(text(),'Process Settlement')]

# Elemen di dalam 3 Nested Frames
${BTN_REFRESH}               css=#Main_btnRefresh