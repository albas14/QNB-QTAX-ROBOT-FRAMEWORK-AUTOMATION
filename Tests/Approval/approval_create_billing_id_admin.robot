*** Settings ***
Documentation    Test Suite untuk Proses Approval Create Billing ID oleh Admin
Resource         ../../resources/keywords/login_keywords.resource
Resource         ../../resources/keywords/approval_create_billing_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Approval Create Billing ID Admin Berhasil
    [Documentation]    Menguji alur admin melakukan login, navigasi menu approval, centang bulk approve, dan konfirmasi approve
    
    # 1. Login menggunakan akun Admin
    Login Sebagai Admin
    
    # 2. Navigasi ke menu approval create billing
    Navigasi Ke Menu Approval Create Billing Admin
    
    # 3. Proses centang dan klik tombol bulk approve
    Proses Bulk Approve Billing ID
    
    # 4. Konfirmasi approve di dalam pop-up
    Konfirmasi Approve Di Pop Up