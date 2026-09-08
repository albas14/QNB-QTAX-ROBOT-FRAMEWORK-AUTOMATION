*** Settings ***
Documentation    Test Suite untuk fitur Create Billing ID oleh Teller
Resource         ../../../resources/keywords/create_billing_keywords.resource
Resource         ../../../resources/keywords/login_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Create New Billing ID Teller
    [Documentation]    Memastikan Teller berhasil membuat Billing ID baru dengan data dinamis (16 digit Account & NPWP, CCY IDR)
    
    # 1. Alur Utama Login & Navigasi
    Login Sebagai Teller
    Navigasi Ke Menu Create Billing Teller
    Buka Pop Up Create New Billing ID
    
    # 2. Generate Data Dinamis
    Buat Data Dinamis Billing ID
    
    # 3. Eksekusi Form Menggunakan Variabel Dinamis
    Isi Form Create New Billing ID Bagian Pertama    ${DYNAMIC_ACCOUNT_NO}    ${DYNAMIC_TAX_ID}    7012    ${DYNAMIC_CLIENT_NAME}    Pembayaran Pajak Tahunan Dinamis
    Isi Detail Tax Payment Dan Submit                411119 - PPh Migas Lainnya   200 - Tahunan    2023    1500000