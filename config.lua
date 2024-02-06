Config = {} 

---@ ปุ่ม https://docs.fivem.net/docs/game-references/controls/

---@ (เพิ่มปุ่มที่บล็อคได้ไม่จำกัด)
Config.Key = { 73, 29, }
---@ (ดีเลย์ หน่วยเป็นวินาที)
Config.DelayAntiKey = 5


---@ (เพิ่มปุ่ม Spacebar)
Config.KeySpacebar = 22
---@ (ดีเลย์ หน่วยเป็นวินาที)
Config.DelayAntiSpacebar = 5
---@ (กด Spacebar นานกี่วินาทีถึงจะบล็อค)
Config.HoldSpacebar = 5

---@ (แจ้งเตือนของตนเอง)
function AntiSpam(id, text)
    -- body
    lib.notify({
        id = id,
        title = 'แจ้งเตือน',
        description = text,
        duration = 5000,
        position = 'center-right',
        type = 'error'
    })
end