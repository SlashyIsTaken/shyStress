local stress = 0 -- Don't Touch
local devmode = false -- Don't Touch
local settings = { -- Adjust these to your liking
    level1 = 120000, -- 2 minutes to cycle if stress is below 2000
    level2 = 60000, -- 1 minute to cycle if stress is below 4000
    level3 = 30000, -- 30 seconds to cycle if stress is below 7000
}

RegisterNetEvent("shyStress:AddStress")
AddEventHandler("shyStress:AddStress", function(addstress)
    if not devmode then
        stress = stress + addstress
        -- Add your notification export here, with something like "stress gained"
    end
end)

RegisterNetEvent("shyStress:RelieveStress")
AddEventHandler("shyStress:RelieveStress", function(relstress)
    if not devmode then
        stress = stress - relstress
        -- Add your notification export here, with something like "stress relieved"
    end
end)

RegisterNetEvent("shyStress:devmode")
AddEventHandler("shyStress:devmode", function()
    devmode = not devmode
end)

Citizen.CreateThread(function()
    while true do
        local wait = settings.level1
        if not devmode then
            if stresslevel > 7000 then
                wait = settings.level3
            elseif stresslevel > 4000 then
                wait = settings.level2
            elseif stresslevel > 2000 then
                wait = settings.level1
            end
            if stresslevel > 1000 then
              TriggerScreenblurFadeIn(1000.0)
              Wait(1100)
              TriggerScreenblurFadeOut(1000.0)
            end
        end 
        Citizen.Wait(wait)
    end
end)