*** Settings ***
Documentation    Test Suite untuk Membuat 5 Data Billing ID Teller Secara Manual
Resource         ../../../resources/keywords/login_keywords.resource
Resource         ../../../resources/keywords/create_billing_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Create 5 Data Billing ID Teller Manual Input
    [Documentation]    Membuat 5 data billing ID berturut-turut menggunakan data manual
    
    # 1. Login & Navigasi Utama (Dilakukan 1x di awal)
    Login Sebagai Teller
    Navigasi Ke Menu Create Billing Teller
    
    # 2. Loop Pembuatan 5 Data
    FOR    ${i}    IN RANGE    1    6
        Log    --- MENGISI DATA BILLING MANUAL KE-${i} ---
        
        # Reset konteks frame ke posisi paling luar
        Unselect Frame
        
        # Buka Pop Up Create Billing
        Buka Pop Up Create New Billing ID
        
        # Isi Form Bagian Pertama (Account No, Tax Payer ID, Channel 7012, Name dengan Indeks, & Desc)
        Isi Form Create New Billing ID Bagian Pertama
        ...    1220004088001
        ...    3326501102202121
        ...    7012
        ...    test qa balance ${i}
        ...    Input Manual Billing Test QA Data Ke-${i}
        
        # Isi Detail Tax Payment Dan Submit (Gunakan format teks opsi yang lengkap)
        Isi Detail Tax Payment Dan Submit
        ...    411119 - PPh Migas Lainnya
        ...    200 - Tahunan
        ...    2023
        ...    1500000
        
        # Jeda antar iterasi
        Sleep    2s
    END