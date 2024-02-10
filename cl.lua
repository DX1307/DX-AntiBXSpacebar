local Anti = false
local AntiSpacebar = false
local count = 0

CreateThread(function()
	while true do
		local sleep = true
		local playerPed = PlayerPedId()
		Wait(9)
		local gotWeapon, hasWeapon = GetCurrentPedWeapon(playerPed, true)
		
		if gotWeapon ~= false then
			for k, v in pairs(Config.Key) do
				if IsControlPressed(0, v) then
					sleep = false
					Anti = true
					DisableActionsWhileAnti(playerPed)
					stopWeapon(playerPed, hasWeapon)
				end
			end

			if IsControlPressed(0, Config.KeySpacebar) then
				sleep = false
				count = count + 0.1
				if count > Config.HoldSpacebar then
					AntiSpacebar = true
					DisableActionsWhileAnti(playerPed)
					AntiSpacebarfun(playerPed, hasWeapon)
				end
			end
		end

		if sleep then
			Wait(200)
		end
	end
end)

function stopWeapon(playerPed, hasWeapon)
	SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
	RemoveWeaponFromPed(playerPed, hasWeapon)
	Wait(Config.DelayAntiKey * 1000)
	Anti = false
end

function AntiSpacebarfun(playerPed, hasWeapon)
	SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
	RemoveWeaponFromPed(playerPed, hasWeapon)
	Wait(Config.DelayAntiSpacebar * 1000)
	AntiSpacebar = false
	count = 0
end

function DisableActionsWhileAnti(playerPed)
	CreateThread(function()
		while Anti or AntiSpacebar do
			DisablePlayerFiring(playerPed, true)
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 25, true)
			if AntiSpacebar then
				DisableControlAction(0, Config.KeySpacebar, true)
				if IsDisabledControlJustPressed(0, Config.KeySpacebar) then
					AntiSpam('AntiSpacebar', 'ห้ามกด Spacebar ค้าง')
				end
			end
			Wait(9)
		end
	end)
end
