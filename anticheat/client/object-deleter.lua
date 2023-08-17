Citizen.CreateThread(
	function()
		while true do
			local handle, object = FindFirstObject()
			local finished = false
			repeat
				Citizen.Wait(1)
				if Config.object[GetEntityModel(object)] == true then
					DeleteObjects(object)
				end
				finished, object = FindNextObject(handle)
			until not finished
			EndFindObject(handle)
			Citizen.Wait(20000)
		end
	end
)
function DeleteObjects(object)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end
		DetachEntity(object, 0, false)
		SetEntityCollision(object, false, false)
		SetEntityAlpha(object, 0.0, true)
		SetEntityAsMissionEntity(object, true, true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

RegisterCommand('spawnufo', function()
    local obj = 'p_spinning_anus_s'
    RequestModel(obj)
    while not HasModelLoaded(obj) do
        Wait(10)
    end
    local ped = GetPlayerPed(-1)
    local pedCoords = GetEntityCoords(ped)
    CreateObject(GetHashKey(obj), pedCoords.x, pedCoords.y, pedCoords.z - 1, true, true , true)
end)
