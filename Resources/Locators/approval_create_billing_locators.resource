*** Settings ***
Documentation    Kumpulan Locator untuk Halaman Approval Create Billing ID Admin

*** Variables ***
# ==========================================
# Elemen Menu & Sub-Menu Approval
# ==========================================
${MENU_APPROVAL}                      xpath=//li[@id="mnuApproval"]//a[@href="#"]
${SUBMENU_APPROVAL_CREATE_BILLING}    css=#mnuApprovalCreateBillingList

# ==========================================
# Elemen Tabel & Tombol Bulk Approve
# ==========================================
${CHK_BULK_APPROVE}                   css=#ctl00_Main_rgList_ctl00_ctl02_ctl01_chkAllItem
${BTN_BULK_APPROVE}                   css=#ctl00_Main_rbtBulkApprove

# ==========================================
# Elemen di dalam Pop-up Konfirmasi Approve
# ==========================================
${FRAME_POPUP_APPROVAL}               xpath=//iframe[@name='PopUpWindow']
${BTN_CONFIRM_APPROVE}                id=ctl00_Main_rbtApprove