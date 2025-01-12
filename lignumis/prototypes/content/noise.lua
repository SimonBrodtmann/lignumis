-- Entities added by Lignumis define noise emissions/absorption in their own file.

local function emit(type, name, amount)
    local entity = data.raw[type][name]
    entity.energy_source = entity.energy_source or {}
    entity.energy_source.emissions_per_minute = entity.energy_source.emissions_per_minute or {}
    entity.energy_source.emissions_per_minute.noise = amount
end

local function emit_constant(type, name, amount)
    local entity = data.raw[type][name]
    entity.emissions_per_second = entity.emissions_per_second or {}
    entity.emissions_per_second.noise = amount / 60
end

data:extend({
    {
        type = "airborne-pollutant",
        name = "noise",
        chart_color = { r = 183, g = 0, b = 225, a = 149 },
        icon = {
            filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
            priority = "high",
            size = 64,
            mipmap_count = 2,
            y = 3 * 64,
            flags = { "gui-icon" }
        },
        affects_evolution = true,
        affects_water_tint = false,
    }
})


-- Nauvis enemies use noise

data.raw["unit-spawner"]["spitter-spawner"].absorptions_per_second.noise = { absolute = 200, proportional = 0.01 }
data.raw["unit-spawner"]["biter-spawner"].absorptions_per_second.noise = { absolute = 200, proportional = 0.01 }
data.raw["unit"]["small-biter"].absorptions_to_join_attack.noise = 1
data.raw["unit"]["medium-biter"].absorptions_to_join_attack.noise = 5
data.raw["unit"]["big-biter"].absorptions_to_join_attack.noise = 20
data.raw["unit"]["behemoth-biter"].absorptions_to_join_attack.noise = 100
data.raw["unit"]["small-spitter"].absorptions_to_join_attack.noise = 1
data.raw["unit"]["medium-spitter"].absorptions_to_join_attack.noise = 3
data.raw["unit"]["big-spitter"].absorptions_to_join_attack.noise = 8
data.raw["unit"]["behemoth-spitter"].absorptions_to_join_attack.noise = 50


-- All trees absorb noise

for _, tree in pairs(data.raw.tree) do
    emit_constant("plant", "tree-plant", -6)
end
emit_constant("plant", "tree-plant", -6)


-- Tiles absorb noise

local tiles = {"grass-1", "grass-2", "grass-3", "grass-4", "water", "deepwater", "natural-gold-soil"}
for _, tile in pairs(tiles) do
    if not data.raw.tile[tile].absorptions_per_second then
        data.raw.tile[tile].absorptions_per_second = {}
    end
    data.raw.tile[tile].absorptions_per_second.noise = 0.001
end


-- Walls absorb noise

emit_constant("wall", "wooden-wall", -10)
emit_constant("wall", "stone-wall", -20)
emit_constant("gate", "gate", -10)


-- Buildings emit noise

emit("furnace", "stone-furnace", 10)
emit("furnace", "electric-furnace", 10)
emit("mining-drill", "burner-mining-drill", 50)
emit("mining-drill", "electric-mining-drill", 100)
emit("mining-drill", "big-mining-drill", 200)
--emit("mining-drill", "deep-miner", 2000)
--emit("agricultural-tower", "burner-agricultural-tower", 100)
emit("agricultural-tower", "agricultural-tower", 100)
--emit("assembling-machine", "burner-assembling-machine", 50)
--emit("assembling-machine", "steam-assembling-machine", 50)
emit("assembling-machine", "assembling-machine-1", 10)
emit("assembling-machine", "assembling-machine-2", 15)
emit("assembling-machine", "assembling-machine-3", 20)
emit("assembling-machine", "chemical-plant", 10)
emit("boiler", "boiler", 5)
emit("generator", "steam-engine", 10)
emit("boiler", "heat-exchanger", 1)
emit("generator", "steam-turbine", 20)
--emit("rocket-silo", "provisional-rocket-silo", 10000)
--emit_constant("rocket-silo", "provisional-rocket-silo", 1000)
emit("rocket-silo", "rocket-silo", 10000)
emit_constant("rocket-silo", "rocket-silo", 1000)
--emit("lab", "wood-lab", 10)
emit("lab", "lab", 5)
emit("lab", "biolab", 20)
emit("locomotive", "locomotive", 200)
emit_constant("locomotive", "locomotive", 10)

--emit_constant("transport-belt", "wood-transport-belt", 3)
emit_constant("transport-belt", "transport-belt", 4)
emit_constant("transport-belt", "fast-transport-belt", 8)
emit_constant("transport-belt", "express-transport-belt", 12)
emit_constant("transport-belt", "turbo-transport-belt", 16)
--emit_constant("underground-belt", "wood-underground-belt", 30)
emit_constant("underground-belt", "underground-belt", 40)
emit_constant("underground-belt", "fast-underground-belt", 50)
emit_constant("underground-belt", "express-underground-belt", 60)
emit_constant("underground-belt", "turbo-underground-belt", 80)
--emit_constant("splitter", "wood-splitter", 60)
emit_constant("splitter", "splitter", 70)
emit_constant("splitter", "fast-splitter", 80)
emit_constant("splitter", "express-splitter", 90)
emit_constant("splitter", "turbo-splitter", 100)