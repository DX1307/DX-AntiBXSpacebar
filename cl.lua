
local Anti = false
local AntiSpacebar = false
local count = 0

CreateThread(function()
	while true do
		local sleep = true
		local GetPlayerPed = GetPlayerPed(-1)
		Wait(9)
		local gotWeapon, hasWeapon = GetCurrentPedWeapon(GetPlayerPed, true)
		if gotWeapon ~= false then
			for k, v in pairs(Config.Key) do
				if IsControlPressed(0, v) then
					sleep = false
					stopWeapon(hasWeapon)
					Anti = true
					CreateThread(function()
						while Anti do
							local sleep = true
							local PlayerPedId = PlayerPedId()
							DisablePlayerFiring(PlayerPedId,true)
							DisableControlAction(0, 140, true)
							DisableControlAction(0, 25, true)
							Wait(9)
						end
					end)
				end
			end

			if IsControlPressed(0, Config.KeySpacebar) then
				sleep = false
				count = count + 0.1
				if count > Config.HoldSpacebar then
					AntiSpacebar = true
					CreateThread(function()
						while AntiSpacebar do
							local PlayerPedId = PlayerPedId()
							DisablePlayerFiring(PlayerPedId,true)
							DisableControlAction(0, 140, true)
							DisableControlAction(0, 25, true)
							DisableControlAction(0, Config.KeySpacebar, true)
							if (IsDisabledControlJustPressed(0, Config.KeySpacebar)) then
								AntiSpam('AntiSpacebar', 'ห้ามกด Spacebar ค้าง')
							end
							Wait(9)
						end
					end)
					AntiSpacebarfun(hasWeapon)
				end
			end
		end
		if sleep then
			Wait(200)
		end
	end
end)

local UnarmedHash = `WEAPON_UNARMED`

function stopWeapon(hasWeapon)
	local PlayerPedId = PlayerPedId()
	Anti = true
	SetCurrentPedWeapon(PlayerPedId, UnarmedHash, true)
	RemoveWeaponFromPed(PlayerPedId, hasWeapon)
	Wait(Config.DelayAntiKey * 1000)
	Anti = false
end

function AntiSpacebarfun(hasWeapon)
	local PlayerPedId = PlayerPedId()
	SetCurrentPedWeapon(PlayerPedId, UnarmedHash, true)
	RemoveWeaponFromPed(PlayerPedId, hasWeapon)
	Wait(Config.DelayAntiSpacebar * 1000)
	AntiSpacebar = false
	count = 0
end