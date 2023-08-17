RegisterNetEvent('anticheat:remove:weapon')
AddEventHandler('anticheat:remove:weapon', function(weapon)
    for k, v in pairs(Config.weaponsBlacklist) do
        if GetHashKey(v) == weapon then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeWeapon(v)
        end
    end
end)
