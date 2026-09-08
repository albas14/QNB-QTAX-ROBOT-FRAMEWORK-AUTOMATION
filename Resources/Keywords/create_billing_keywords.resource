*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     String
Library     ScreenCapLibrary
Resource    ../variables/create_billing_variables.resource
Resource    ../locators/create_billing_locators.resource

*** Keywords ***
# ==========================================
# HELPER KEYWORDS (MANUAL DATA SETTER)
# ==========================================
Set Data Manual Billing ID
    [Documentation]    Set variabel manual untuk Account No, Tax Payer ID, dan Client Name
    Set Test Variable   ${INPUT_ACCOUNT_MANUAL}     ${MANUAL_ACCOUNT_NO}
    Set Test Variable   ${INPUT_TAX_MANUAL}         ${MANUAL_TAX_PAYER_ID}
    Set Test Variable   ${INPUT_NAME_MANUAL}        ${MANUAL_CLIENT_NAME}
*** Keywords ***
# ==========================================
# HELPER KEYWORDS (DYNAMIC DATA GENERATOR)
# ==========================================
Buat Data Dinamis Billing ID
    [Documentation]    Generate data unik 16 digit untuk Account & NPWP, serta Client Name dinamis
    
    # 1. Account Number: Tepat 16 digit angka (Awalan '123' + 13 digit acak)
    ${rand_acc}=        Generate Random String    13    [NUMBERS]
    Set Test Variable   ${DYNAMIC_ACCOUNT_NO}     123${rand_acc}

    # 2. Tax Payer ID (NPWP): Tepat 16 digit angka acak
    ${rand_npwp}=       Generate Random String    16    [NUMBERS]
    Set Test Variable   ${DYNAMIC_TAX_ID}         ${rand_npwp}

    # 3. Client Name: Teks acak + Timestamp agar selalu unik
    ${rand_name}=       Generate Random String    5     [LETTERS]
    ${timestamp}=       Get Current Date          result_format=%M%S
    Set Test Variable   ${DYNAMIC_CLIENT_NAME}    Client ${rand_name} ${timestamp}

# ==========================================
# ACTION KEYWORDS : CREATE BILLING TELLER
# ==========================================

Navigasi Ke Menu Create Billing Teller
    # 1. Masuk ke frame untuk klik menu utama (Parent Menu)
    Sleep    5s
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    30s
    Select Frame                        ${FRAME_DASHBOARD}
    Wait Until Element Is Visible       ${MENU_PEMBAYARAN_PAJAK}    15s
    Click Element                       ${MENU_PEMBAYARAN_PAJAK}
    Unselect Frame
    
    # 2. Tunggu frame termuat ulang, lalu masuk kembali untuk klik Sub-Menu
    Sleep    3s
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    30s
    Select Frame                        ${FRAME_DASHBOARD}
    Wait Until Element Is Visible       ${SUBMENU_CREATE_BILLING}   15s
    Click Element                       ${SUBMENU_CREATE_BILLING}
    Unselect Frame

Buka Pop Up Create New Billing ID
    # 3. Masuk ke frame halaman Create Billing yang sudah terbuka
    Sleep    3s
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    15s
    Select Frame                        ${FRAME_DASHBOARD}
    
    # 4. Klik tombol Add New
    Wait Until Element Is Visible       ${BTN_CREATE_NEW_BILLING}   15s
    Click Element                       ${BTN_CREATE_NEW_BILLING}
    
    # Keluar dari frame setelah pop-up muncul
    Unselect Frame
    Sleep    2s

Isi Form Create New Billing ID Bagian Pertama
    [Arguments]    ${account_no}    ${tax_payer_id}    ${channel_value}    ${client_name}    ${description}
    
    # 1. Menembus Frame Luar (Dashboard)
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    15s
    Select Frame                        ${FRAME_DASHBOARD}
    
    # 2. Menembus Frame Kedua di dalamnya (PopUpWindow)
    Wait Until Page Contains Element    ${FRAME_POPUP}        15s
    Select Frame                        ${FRAME_POPUP}
    
# 3. Interaksi dengan elemen di dalam Pop-up
    Wait Until Element Is Visible       ${RDO_NASABAH}        15s
    Wait Until Element Is Enabled       ${RDO_NASABAH}        15s
    Click Element                       ${RDO_NASABAH}
    
    # PERBAIKAN: Berikan jarak minimal 2 spasi atau Tab di antara variabel locator dan value-nya
    Input Text                          ${INPUT_ACCOUNT_NO}      ${account_no}
    Input Text                          ${INPUT_TAX_PAYER_ID}    ${tax_payer_id}
    
    Select From List By Value           ${DDL_CHANNEL_TYPE}      ${channel_value}

    Wait Until Element Is Visible       ${INPUT_CLIENT_NAME}  15s
    Wait Until Element Is Enabled       ${INPUT_CLIENT_NAME}  10s
    Set Focus To Element                ${INPUT_CLIENT_NAME}
    Click Element                       ${INPUT_CLIENT_NAME}
    Input Text                          ${INPUT_CLIENT_NAME}     ${client_name}
    Input Text                          ${INPUT_DESCRIPTION}     ${description}

Isi Detail Tax Payment Dan Submit
    [Arguments]    ${map_code}    ${payment_code}    ${tax_year}    ${amount}
    
    # 1. Reset posisi frame ke paling luar, lalu masuk berurutan ke 4 lapis frame
    Unselect Frame
    Select Frame    ${FRAME_DASHBOARD}    # Frame 1
    Select Frame    ${FRAME_POPUP}        # Frame 2
    
# 2. Interaksi Dropdown Tax Account Map
    Wait Until Element Is Visible    ${INPUT_TAX_ACCOUNT_MAP}    15s
    Click Element                    ${INPUT_TAX_ACCOUNT_MAP}
    Sleep                            1s
    Wait Until Element Is Visible    xpath=//li[normalize-space()="${map_code}"]    10s
    Click Element                    xpath=//li[normalize-space()="${map_code}"]
    
    # Jeda postback server Telerik
    Sleep                            2s 
    
    # 3. Interaksi Dropdown Payment Code
    Wait Until Element Is Visible    ${INPUT_PAYMENT_CODE}    15s
    Click Element                    ${INPUT_PAYMENT_CODE}
    Sleep                            1s
    Wait Until Element Is Visible    xpath=//div[@id="ctl00_Main_rcbPaymentCode_DropDown"]//li[normalize-space()="${payment_code}"]    10s
    Click Element                    xpath=//div[@id="ctl00_Main_rcbPaymentCode_DropDown"]//li[normalize-space()="${payment_code}"]
    
   # 4. Pengisian Tahun Pajak & Nominal
    Wait Until Element Is Visible    ${INPUT_TAX_YEAR}    10s
    Click Element                    ${INPUT_TAX_YEAR}
    Input Text                       ${INPUT_TAX_YEAR}    ${tax_year}
    
    Wait Until Element Is Visible    ${INPUT_AMOUNT}      10s
    Click Element                    ${INPUT_AMOUNT}
    Input Text                       ${INPUT_AMOUNT}      ${amount}
    
    # 5. Tambah Detail Pajak & Submit Form Utama
    Wait Until Element Is Visible    ${BTN_ADD_PAYMENT}   10s
    Click Element                    ${BTN_ADD_PAYMENT}
    Sleep                            2s 
    
    Wait Until Element Is Visible    ${BTN_SUBMIT_BILLING}  10s
    Click Element                    ${BTN_SUBMIT_BILLING}
    
    # 6. Menerima pop-up konfirmasi (Alert) jika ada
    Run Keyword And Ignore Error     Handle Alert    ACCEPT    timeout=5s
    Run Keyword And Ignore Error     Handle Alert    ACCEPT    timeout=5s


# ==========================================
# ACTION KEYWORDS : CREATE BILLING TELLER SETTLEMENT
# ==========================================
Buka Detail Billing Dan Ke Settlement
    [Arguments]    ${ref_number}=20260907140339857443
    [Documentation]    Mencari baris berdasarkan Reference Number lalu klik button View transaksi
    
    # 1. Masuk ke Frame Utama Dashboard
    Unselect Frame
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    15s
    Select Frame                        ${FRAME_DASHBOARD}
    
    # 2. Dynamic XPath Presisi:
    # - Mencari tag <tr> yang mengandung teks Reference Number
    # - Mengunci tombol <input> yang id-nya mengandung 'ibtView' tetapi BUKAN 'ibtViewBillingCode'
    ${btn_view_dynamic}=    Set Variable    xpath=//tr[.//text()[contains(.,'${ref_number}')]]//input[contains(@id,'ibtView') and not(contains(@id,'ibtViewBillingCode'))]
    
    Wait Until Element Is Visible       ${btn_view_dynamic}    15s
    Scroll Element Into View            ${btn_view_dynamic}
    Click Element                       ${btn_view_dynamic}
    
    # 3. Masuk ke PopUpWindow Frame & Klik Settlement
    Unselect Frame
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    15s
    Select Frame                        ${FRAME_DASHBOARD}
    
    Wait Until Page Contains Element    ${FRAME_POPUP}        15s
    Select Frame                        ${FRAME_POPUP}
    
    Wait Until Element Is Visible       ${BTN_TO_SETTLEMENT}   15s
    Click Element                       ${BTN_TO_SETTLEMENT}
    
    Unselect Frame

Proses Settlement Billing ID
    [Documentation]    Keyword untuk menangani flow Inquiry, Process Settlement, dan Pop-up Alert
    
    # --- LANGKAH 1: Masuk ke Nested Frame (Dashboard + PopUpWindow) ---
    Unselect Frame
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    15s
    Select Frame                        ${FRAME_DASHBOARD}
    
    Wait Until Page Contains Element    ${FRAME_POPUP}        15s
    Select Frame                        ${FRAME_POPUP}
    
    # --- LANGKAH 2: Tunggu Tombol Inquiry Siap (Hilangnya status disabled) ---
    # 1. Jika overlay loading ada dan transparan/visible, tunggu hingga tidak terlihat
    Run Keyword And Ignore Error        Wait Until Element Is Not Visible    css=#pageLoadingOverlay    10s
    
    # 2. Tunggu tombol Inquiry sampai terlihat dan class 'rbDisabled' hilang
    Wait Until Element Is Visible       ${BTN_INQUIRY}         20s
    Wait Until Page Does Not Contain Element    xpath=//span[@id='ctl00_Main_rbtInquiry' and contains(@class,'rbDisabled')]    20s
    
    # 3. Eksekusi Klik Inquiry
    Click Element                       ${BTN_INQUIRY}
    
    # --- LANGKAH 3: Tunggu dan Klik Button Process Settlement ---
    Run Keyword And Ignore Error        Wait Until Element Is Not Visible    css=#pageLoadingOverlay    10s
    
    Wait Until Element Is Visible       ${BTN_PROCESS_SETTLEMENT}    20s
    Wait Until Page Does Not Contain Element    xpath=//*[contains(@id,'Process') and contains(@class,'rbDisabled')]    20s
    
    Click Element                       ${BTN_PROCESS_SETTLEMENT}
    
    # --- LANGKAH 4: Tangkap Alert JavaScript "Your request has been submitted" ---
    Run Keyword And Ignore Error        Handle Alert    ACCEPT    timeout=15s
    
    # Keluar dari frame setelah selesai
    Unselect Frame

    # --- LANGKAH 5: Masuk ke 3 Nested Frames & Klik Button Refresh ---
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    15s
    Select Frame                        ${FRAME_DASHBOARD}        # Frame 1
    Select Frame                        ${FRAME_DASHBOARD}        # Frame 2
    
    Wait Until Page Contains Element    ${FRAME_POPUP}        15s
    Select Frame                        ${FRAME_POPUP}            # Frame 3
    
    # Tunggu dan Klik Refresh Button
    Wait Until Element Is Visible       ${BTN_REFRESH}        20s
    Click Element                       ${BTN_REFRESH}
    
    # Keluar dari seluruh frame setelah selesai
    Unselect Frame