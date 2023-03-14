ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('karnemelk:beldewouten')
AddEventHandler('karnemelk:beldewouten', function(straat, posx, posy)
    local ply = ESX.GetPlayerFromId(source)
    if ply.getJob().name ~= 'police' or ply.getJob().name ~= 'offpolice' then
        local players = ESX.GetPlayers()
        for i = 1, #players do
            local player = ESX.GetPlayerFromId(players[i])
            if player.getJob().name == 'police' then
                TriggerClientEvent('karnemelk:client:beldewouten', players[i], straat, posx, posy)
            end
        end
    end
end)

RegisterServerEvent('inProgressBlip', function(gx, gy, gz)
    local players = ESX.GetPlayers()
    for i = 1, #players do
        local player = ESX.GetPlayerFromId(players[i])
        if player.getJob().name == 'police' then
            TriggerClientEvent("maakdiekauloblip", players[i], gx, gy, gz)
        end
    end
end)