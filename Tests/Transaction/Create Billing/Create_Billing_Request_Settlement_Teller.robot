*** Settings ***
Documentation    Test Suite untuk fitur Create Billing ID oleh Teller
Resource         ../../../resources/keywords/create_billing_keywords.resource
Resource         ../../../resources/keywords/login_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Process Settlement Billing ID Teller
   
    # 1. Alur Utama Login & Navigasi
    Login Sebagai Teller
    Navigasi Ke Menu Create Billing Teller
    # 2. Klik View dan Lanjut ke Settlement
    Buka Detail Billing Dan Ke Settlement    20260907140339857443

    # 3. Inquiry, Process Settlement, dan Accept Alert Browser
    Proses Settlement Billing ID