*** Settings ***
Documentation    Test Suite untuk Membuat 5 Data Billing ID Teller Secara Otomatis
Resource         ../../../resources/keywords/login_keywords.resource
Resource         ../../../resources/keywords/create_billing_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Create 5 Data Billing ID Teller
    [Documentation]    Membuat 5 data billing ID berturut-turut menggunakan perulangan (FOR Loop)
    
    # 1. Login sebagai teller
    Login Sebagai Teller
    
    # 2. Navigasi ke menu create billing
    Navigasi Ke Menu Create Billing Teller
    
    # 3. Perulangan 5 kali untuk generate data dan submit form
    FOR    ${i}    IN RANGE    1    6
        Log    --- MENGISI DATA BILLING KE-${i} ---
        
        Unselect Frame
        # Generate data dinamis unik baru
        Buat Data Dinamis Billing ID
        
        # Buka pop up & isi form bagian pertama
        Buka Pop Up Create New Billing ID
        Isi Form Create New Billing ID Bagian Pertama    ${DYNAMIC_ACCOUNT_NO}    ${DYNAMIC_TAX_ID}    7012    ${DYNAMIC_CLIENT_NAME}    Pembayaran Pajak Rutin Data Ke-${i}
        
        # Isi detail pajak & submit
        Isi Detail Tax Payment Dan Submit    411119 - PPh Migas Lainnya    100 - Masa    2026    1500000
        
        Sleep    3s
    END