waitingforpress = false

RegisterNetEvent('karnemelk:client:beldewouten')
AddEventHandler('karnemelk:client:beldewouten', function(straat, posx, posy)
    -- Edit this line below to match your own notify system and preferred message.
    exports['okokNotify']:Alert("<b>SHOTS FIRED</b>", "<br>Shots were heard near <i>" ..straat.. "</i>. <br><br>Press <b>Z</> to set a waypoint!", 10000, 'warning')
    waitingforpress(posx, posy)
end)

RegisterNetEvent('maakdiekauloblip', function(gx, gy, gz)
    local gunshotBlip = AddBlipForRadius(gx, gy, gz, Config.BlipRadius)
    SetBlipSprite(gunshotBlip, 161)
    SetBlipColour(gunshotBlip, Config.BlipColor)
    SetBlipAsShortRange(gunshotBlip, 0)
    Wait(Config.BlipTime)
    SetBlipSprite(gunshotBlip, 2)						
end)

-- Main Thread, loop only eats ms when ped is armed.
Citizen.CreateThread( function()
    local sleep = 2000
    while true do
        local ped = PlayerPedId()
		local weapon = GetSelectedPedWeapon(ped)
		local isSilenced = IsPedCurrentWeaponSilenced(ped)
        local plyPos = GetEntityCoords(ped, true)
        local posx = plyPos.x
        local posy = plyPos.y
        local s1 = GetStreetNameAtCoord(plyPos.x, plyPos.y, plyPos.z)
        local street = GetStreetNameFromHashKey(s1)
		if IsPedArmed(ped, 4) then
            sleep = 25
        else
            sleep = 2000
        end

		if IsPedShooting(ped) and not isSilenced and not isBlacklisted(weapon) then
            TriggerServerEvent('inProgressBlip', plyPos.x, plyPos.y, plyPos.z)
            TriggerServerEvent('karnemelk:beldewouten', street, posx, posy)
            Wait(Config.AlertCooldown)
		end
        Citizen.Wait(sleep)
    end
end)

function waitingforpress(posx, posy)
    local timer = 1500
    while timer >= 1 do
        Citizen.Wait(1)
        if IsControlJustPressed(1, 48) then
            SetNewWaypoint(posx, posy)
        end
        timer = timer - 1
    end
end

function isBlacklisted(model)
	for _, blacklistedWeapon in pairs(Config.Blacklist) do
		if model == blacklistedWeapon then
			return true
		end
	end
	return false
end