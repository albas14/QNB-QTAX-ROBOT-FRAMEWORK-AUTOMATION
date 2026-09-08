*** Settings ***
Documentation    Test Suite untuk Login Role Teller QNB Taxis
Resource         ../../resources/keywords/login_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Login Berhasil Sebagai Teller
    [Documentation]    Menguji login menggunakan akun Teller
    Isi Username Dan Password    ${TELLER_USER}    ${TELLER_PASS}
    Klik Tombol Login