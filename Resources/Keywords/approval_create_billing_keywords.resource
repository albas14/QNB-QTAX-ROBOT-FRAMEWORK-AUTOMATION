*** Settings ***
Documentation    Kumpulan Keywords untuk Alur Approval Create Billing ID Admin
Library          SeleniumLibrary
Resource         ../locators/create_billing_locators.resource
Resource         ../locators/approval_create_billing_locators.resource
Resource         ../variables/approval_create_billing_variables.resource

*** Keywords ***
Navigasi Ke Menu Approval Create Billing Admin
    # 1. Pastikan keluar dulu ke konteks utama
    Unselect Frame
    
    # 2. Masuk ke Frame Pertama dan Kedua secara berurutan sesuai nested frames
    Wait Until Page Contains Element    ${FRAME_DASHBOARD}    15s
    Select Frame                        ${FRAME_DASHBOARD}
    
    # 3. Klik menu APPROVAL yang ada di dalam nested frame tersebut[cite: 1]
    Wait Until Element Is Visible       ${MENU_APPROVAL}    15s
    Click Element                       ${MENU_APPROVAL}
    
    # 4. Keluar kembali dari frame setelah selesai klik menu utama
    Unselect Frame
    Unselect Frame
    
    # 5. Masuk kembali untuk klik Sub-Menu Approval Create Billing
    Sleep                               3s
    Select Frame                        ${FRAME_DASHBOARD}
    Wait Until Element Is Visible       ${SUBMENU_APPROVAL_CREATE_BILLING}    15s
    Click Element                       ${SUBMENU_APPROVAL_CREATE_BILLING}
    Unselect Frame
    Unselect Frame

Proses Bulk Approve Billing ID
    # 1. Masuk ke frame halaman daftar approval
    Sleep                               3s
    Select Frame                        ${FRAME_DASHBOARD}
    
    # 2. Centang checkbox bulk approve & klik tombol bulk approve
    Wait Until Element Is Visible       ${CHK_BULK_APPROVE}    15s
    Select Checkbox                     ${CHK_BULK_APPROVE}
    
    Wait Until Element Is Visible       ${BTN_BULK_APPROVE}    15s
    Click Element                       ${BTN_BULK_APPROVE}
    Unselect Frame

Konfirmasi Approve Di Pop Up
    # 1. Masuk ke 3 lapis frame untuk pop-up konfirmasi approve[cite: 1]
    Sleep                               3s
    Select Frame                        ${FRAME_DASHBOARD}
    Select Frame                        ${FRAME_POPUP_APPROVAL}
    
    # 2. Klik tombol Approve di dalam pop-up[cite: 1]
    Wait Until Element Is Visible       ${BTN_CONFIRM_APPROVE}    15s
    Click Element                       ${BTN_CONFIRM_APPROVE}

    
    # 3. Menangani konfirmasi JavaScript Alert / pesan sukses
    Run Keyword And Ignore Error        Handle Alert    ACCEPT    timeout=5s
    Run Keyword And Ignore Error        Handle Alert    ACCEPT    timeout=5s
    Sleep                               3s