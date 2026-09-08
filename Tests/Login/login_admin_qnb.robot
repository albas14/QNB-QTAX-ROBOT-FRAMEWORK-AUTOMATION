*** Settings ***
Documentation    Test Suite untuk Login Role Admin QNB Taxis
Resource         ../../resources/keywords/login_keywords.resource

Test Setup       Setup Awal Test
Test Teardown    Teardown Akhir Test

*** Test Cases ***
Login Berhasil Sebagai Admin
    [Documentation]    Menguji login menggunakan akun Admin
    Isi Username Dan Password    ${ADMIN_USER}    ${ADMIN_PASS}
    Klik Tombol Login