*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     ScreenCapLibrary
Resource    ../variables/login_variables.resource
Resource    ../locators/login_locators.resource

*** Keywords ***
# ==========================================
# AUTOMATIC SETUP & TEARDOWN (CLEAN CODE)
# ==========================================
Setup Awal Test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_USERNAME}    10s
    Mulai Perekaman Video

Teardown Akhir Test
    Ambil Screenshot Dengan Timestamp
    Hentikan Perekaman Video
    Close Browser

# ==========================================
# HELPER KEYWORDS (INTERNAL)
# ==========================================
Mulai Perekaman Video
    ${timestamp}=       Get Current Date    result_format=%Y%m%d_%H%M%S
    Start Video Recording    alias=video1    name=${CURDIR}/../../results/Screen Record/${TEST NAME}_${timestamp}

Hentikan Perekaman Video
    Stop Video Recording     alias=video1

Ambil Screenshot Dengan Timestamp
    ${timestamp}=       Get Current Date    result_format=%Y%m%d_%H%M%S
    Capture Page Screenshot    ${CURDIR}/../../results/Screen Shots/${TEST NAME}_${timestamp}.png

# ==========================================
# ACTION KEYWORDS
# ==========================================
Isi Username Dan Password
    [Arguments]    ${username}    ${password}
    Input Text     ${INPUT_USERNAME}    ${username}
    Input Text     ${INPUT_PASSWORD}    ${password}

Klik Tombol Login
    Click Element  ${BTN_LOGIN}

Login Sebagai Teller
    Wait Until Element Is Visible    ${INPUT_USERNAME}    10s
    Isi Username Dan Password        ${TELLER_USER}       ${TELLER_PASS}
    Klik Tombol Login
    
    # UBAH BAGIAN INI: Hapus baris Wait Until Element Is Visible css=...
    # Ganti dengan Sleep untuk memberi waktu browser melakukan proses login (loading)
    Sleep    3s

Login Sebagai Admin
    Wait Until Element Is Visible    ${INPUT_USERNAME}    10s
    # Sesuaikan '${ADMIN_USER}' dan '${ADMIN_PASS}' dengan variabel admin milikmu
    Isi Username Dan Password        ${ADMIN_USER}        ${ADMIN_PASS}
    Klik Tombol Login
    Sleep                            3s