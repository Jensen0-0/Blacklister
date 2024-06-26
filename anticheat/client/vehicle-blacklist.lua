Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))
			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(Config.vehicleBlacklist) do
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)
		if isCarBlacklisted(carModel) then
            DeleteEntity(car)
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(Config.vehicleBlacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end
	return false
end
