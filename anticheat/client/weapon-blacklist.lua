disableallweapons = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			local _, weapon = GetCurrentPedWeapon(playerPed, true)
			if disableallweapons then
				RemoveAllPedWeapons(playerPed, true)
			else
				if isWeaponBlacklisted(weapon) then
					RemoveWeaponFromPed(playerPed, weapon)
					TriggerServerEvent('anticheat:remove:weapon', weapon)
				end
			end
		end
	end
end)

function isWeaponBlacklisted(model)
	for _, blacklistedWeapon in pairs(Config.weaponsBlacklist) do
		if model == GetHashKey(blacklistedWeapon) then
			return true
		end
	end
	return false
end
