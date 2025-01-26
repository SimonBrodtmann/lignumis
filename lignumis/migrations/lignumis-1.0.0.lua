local RocketSilo = require("scripts/wooden-rocket-silo")

if not storage.rocket_silos then
    storage.rocket_silos = {}
end

if not game.planets["lignumis"] then return end

local lignumis = game.planets["lignumis"].surface

for _, silo in pairs(lignumis.find_entities_filtered { name = "provisional-rocket-silo" }) do
    local found = false
    for _, entry in pairs(storage.rocket_silos) do
        if entry.real_silo == silo then
            found = true
            break
        end
    end
    if not found then
        RocketSilo.events[defines.events.on_script_trigger_effect]({
            effect_id = "provisional-rocket-ready",
            surface_index = lignumis.index,
            cause_entity = silo
        })
    end
end
