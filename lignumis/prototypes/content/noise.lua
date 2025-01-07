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

data.raw["unit-spawner"]["spitter-spawner"].absorptions_per_second.noise = { absolute = 20, proportional = 0.01 }
data.raw["unit-spawner"]["biter-spawner"].absorptions_per_second.noise = { absolute = 20, proportional = 0.01 }
data.raw["unit"]["small-biter"].absorptions_to_join_attack.noise = 4
data.raw["unit"]["medium-biter"].absorptions_to_join_attack.noise = 20
data.raw["unit"]["big-biter"].absorptions_to_join_attack.noise = 80
data.raw["unit"]["behemoth-biter"].absorptions_to_join_attack.noise = 400
data.raw["unit"]["small-spitter"].absorptions_to_join_attack.noise = 4
data.raw["unit"]["medium-spitter"].absorptions_to_join_attack.noise = 12
data.raw["unit"]["big-spitter"].absorptions_to_join_attack.noise = 30
data.raw["unit"]["behemoth-spitter"].absorptions_to_join_attack.noise = 200

for _, tree in pairs(data.raw.tree) do
    if tree.emissions_per_second then
        tree.emissions_per_second.noise = -0.1
    end
end

data.raw.furnace["stone-furnace"].energy_source.emissions_per_minute.noise = 10
data.raw["mining-drill"]["burner-mining-drill"].energy_source.emissions_per_minute.noise = 50

local tiles = {"grass-1", "grass-2", "grass-3", "grass-4", "water", "deepwater", "natural-gold-soil"}
for _, tile in pairs(tiles) do
    if not data.raw.tile[tile].absorptions_per_second then
        data.raw.tile[tile].absorptions_per_second = {}
    end
    data.raw.tile[tile].absorptions_per_second.noise = 0.001
end