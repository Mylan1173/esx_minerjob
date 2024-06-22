RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    Markers()
    TextUI()

end)

local rocks = {
    { pos = vector3(2938.68, 2797.782, 39.5), model = "prop_rock_2_a", spawned = false }, --1
    { pos = vector3(2943.68, 2804.782, 40.0), model = "prop_rock_2_a", spawned = false }, --2
    { pos = vector3(2961.3493652344, 2796.3217773438, 39.6), model = "prop_rock_2_a", spawned = false }, --3
    { pos = vector3(2965.7797851563, 2786.9948730469, 38.3), model = "prop_rock_2_a", spawned = false }, --4
    { pos = vector3(2958.748046875, 2780.9736328125, 39.3), model = "prop_rock_2_a", spawned = false }, --5
    { pos = vector3(2947.5578613281, 2788.3793945313, 39.3), model = "prop_rock_2_a", spawned = false }, --6
    { pos = vector3(2967.4396972656, 2800.9194335938, 40.0), model = "prop_rock_2_a", spawned = false }, --7
    { pos = vector3(2975.7414550781, 2780.5341796875, 37.3), model = "prop_rock_2_a", spawned = false }, --8
    { pos = vector3(2943.1474609375, 2770.3000488281, 38.0), model = "prop_rock_2_a", spawned = false }, --9
    { pos = vector3(2936.8957519531, 2779.5541992188, 38.0), model = "prop_rock_2_a", spawned = false }, --10
}


local spawnedRocks = 0
local lastrock = nil



CreateThread(function()
    while true do
        local plyPos = GetEntityCoords(PlayerPedId())
        for i, rock in pairs(rocks) do
            if #(plyPos - rock.pos) < 100 then
                SpawnRocks()
                if rock.spawned then
                    if #(plyPos - rock.pos) < 2.2 then
                        AddTextEntry("msg", "Nyomd meg az ~INPUT_CONTEXT~ -t, hogy el kezdj bányászni.")
                        BeginTextCommandDisplayHelp("msg")
                        EndTextCommandDisplayHelp(0, false, true, -1)
                        if IsControlJustReleased(1, 38) then

                            local player = GetPlayerPed(-1)
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            rock.spawned = false
            end
        end

        Wait(0)
    end
end)

function SpawnRocks()

end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        destroyRocks() --[[ todo ]]
    end
end)

local blip = AddBlipForCoord(2942.5649414063, 2795.1066894531, 40.582706451416)
SetBlipSprite(blip, 85)
SetBlipDisplay(blip, 2)
SetBlipScale(blip, 1.2)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Bánya")
EndTextCommandSetBlipName(blip)
SetBlipAsShortRange(blip, true)

local sblip = AddBlipForCoord(1074.6112060547, -1963.720703125, 31.014266967773)
SetBlipSprite(sblip, 85)
SetBlipDisplay(sblip, 2)
SetBlipScale(sblip, 1.2)
SetBlipAsShortRange(sblip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Érc eladás")
EndTextCommandSetBlipName(sblip)

local mblip = AddBlipForCoord(1912.73046875, 375.66738891602, 161.18954467773)
SetBlipSprite(mblip, 85)
SetBlipDisplay(mblip, 2)
SetBlipScale(mblip, 1.2)
SetBlipAsShortRange(mblip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Érc mosó")
EndTextCommandSetBlipName(mblip)

function OpenOresellMenu()

    local elements = {
        { label = ('Arany'), item = 'gold', cost = 200 },
        { label = ('Gyémánt'), item = 'diamond', cost = 200 },
        { label = ('Réz'), item = 'copper', cost = 200 },
        { label = ('Vas'), item = 'iron', cost = 200 },
        { label = ('Kén'), item = 'sulfur', cost = 200 },
        { label = ('Magnézium'), item = 'magnesium', cost = 200 }

    }
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'oresell', {
        title    = 'Érc eladás',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)

        local source = GetPlayerServerId(GetPlayerIndex(-1))

        TriggerServerEvent('esx_minerjob:SellItem', source, data.current)


    end, function(data, menu)
        menu.close()
    end)
end

local CurrentAction = nil
local CurrentActionMsg = nil

function Markers()
    CreateThread(function()
        while true do
            Wait(0)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local letSleep, isInMarker, hasExited = true, false, false
            local currentMarker

            for i, v in pairs(Config.Markers) do


                local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, v.coords.x,
                    v.coords.y, v.coords.z)

                if distance < 10 then
                    DrawMarker(Config.Marker.type, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.x, v.y, v.z, Config.Marker.r
                        , Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil,
                        nil, false)
                    letSleep = false
                end

                if distance < v.x then
                    isInMarker, currentMarker = true, i
                end

            end
        end
    end)
end

function TextUI()
    CreateThread(function()
        while true do
            Wait(0)
            if CurrentAction then
                exports['okokTextUI']:Open(CurrentActionMsg, 'yellow', 'left')

                if IsControlJustReleased(0, 38) then
                    if CurrentAction == 'WASH' then
                        
                    end
                end 
            end
        end
    end)
end
