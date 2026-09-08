*** Settings ***
Documentation    Test Suite untuk fitur Create Billing ID oleh Teller
Resource         ../../../resources/keywords/create_billing_keywords.resource
Resource         ../../../resources/keywords/login_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Create Billing ID Teller Manual Input
    [Documentation]    Membuat data billing ID menggunakan data yang di-set secara manual
    
    # 1. Login dan Navigasi
    Login Sebagai Teller
    Navigasi Ke Menu Create Billing Teller
    
    # 2. Set Data Manual
    Set Data Manual Billing ID
    
    # 3. Buka Pop Up & Isi Form Utama
    Buka Pop Up Create New Billing ID
    Isi Form Create New Billing ID Bagian Pertama
    ...    ${INPUT_ACCOUNT_MANUAL}
    ...    ${INPUT_TAX_MANUAL}
    ...    7012                         # <-- Ubah dari 1 menjadi 7012
    ...    ${INPUT_NAME_MANUAL}
    ...    Input Manual Billing Test QA
    
    # 4. Isi Detail Pajak & Submit
    Isi Detail Tax Payment Dan Submit                411119 - PPh Migas Lainnya   200 - Tahunan    2023    1500000