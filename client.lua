RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    Markers()
    TextUI()

end)

local rocks = {
    { pos = vector3(2938.68, 2797.782, 39.5), model = "prop_rock_2_a", spawned = false }, --1
}

local spawnedRocks = 0
local lastrock = nil



CreateThread(function()
    while true do
        local plyPos = GetEntityCoords(PlayerPedId())
        for i, rock in pairs(rocks) do
            if #(plyPos - rock.pos) < 100 then
                SpawnRocks()
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
        end
    end)
end

function TextUI()
    CreateThread(function()
        while true do
            Wait(0)
            end
        end
    end)
end
