function RandomOre()
    local random = math.random(100)
    local ore = nil
    if random > 0 and random <= 20 then
        ore = 'copper'
    elseif random > 20 and random <= 40 then
        ore = 'magnesium'
    elseif random > 40 and random <= 60 then
        ore = 'sulfur'
    elseif random > 40 and random <= 60 then
        ore = 'copper'
    elseif random > 60 and random <= 80 then
        ore = 'iron'
    elseif random > 80 and random <= 90 then
        ore = 'gold'
    elseif random > 90 and random <= 100 then
        ore = 'diamond'
    end

    return ore
end

RegisterServerEvent('esx_minerjob:giveItem')
AddEventHandler('esx_minerjob:giveItem', function(source, item, amount)
    if exports.ox_inventory:CanCarryItem(source, item, amount) then
        exports.ox_inventory:AddItem(source, item, amount)
    else
        print('full')
    end
end)

RegisterServerEvent('esx_minerjob:AddItem')
AddEventHandler('esx_minerjob:AddItem', function(player, item)
    if exports.ox_inventory:CanCarryItem(player, item, 1) then
        exports.ox_inventory:AddItem(player, item, 1)
    else
        TriggerClientEvent('okokNotify:Alert', player, "Érc mosó", "Nincs nálad elég hely!", 3000, 'error')
    end
end)
