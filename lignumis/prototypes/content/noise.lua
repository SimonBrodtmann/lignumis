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

for _, tree in pairs(data.raw.tree) do
    if tree.emissions_per_second then
        tree.emissions_per_second.noise = -0.01
    end
end

data.raw.furnace["stone-furnace"].energy_source.emissions_per_minute.noise = 4
data.raw["mining-drill"]["burner-mining-drill"].energy_source.emissions_per_minute.noise = 12