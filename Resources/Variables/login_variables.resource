*** Settings ***
# File ini khusus untuk menyimpan seluruh Variabel Global & Data Konfigurasi

*** Variables ***
${URL}                  http://10.10.10.9/QNB-TAXIS/
${BROWSER}              Edge
${ADMIN_USER}           admin1
${ADMIN_PASS}           P@ssw0rd
${TELLER_USER}          qateller
${TELLER_PASS}          P@ssw0rd!@#

# Variabel dinamis untuk linter VS Code (mencegah error VariableNotFound)
${DYNAMIC_ACCOUNT_NO}   ${EMPTY}
${DYNAMIC_TAX_ID}       ${EMPTY}
${DYNAMIC_CLIENT_NAME}  ${EMPTY}