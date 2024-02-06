fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "DX-AntiBX"
author  "DX Development"
description "ไม่เปลี่ยนชื่อสคริปต์เป็นการให้เกียรติอย่างหนึ่ง"
version '1.0 Beta'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua', -- หากไม่ได้ใช้ให้ลบออก
}

client_script 'cl.lua'
