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
