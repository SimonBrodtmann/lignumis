data:extend({
    {
        type = "fluid",
        name = "wood-pulp",
        default_temperature = 150,
        fuel_value = "150kJ",
        base_color = { r = 0.57, g = 0.392, b = 0.114 },
        flow_color = { r = 0.57, g = 0.392, b = 0.114 },
        icon = "__lignumis__/graphics/icons/wood-pulp.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "fluid",
        order = "w[wood]"
    },
    {
        type = "recipe",
        category = "crafting-with-fluid",
        name = "wood-liquefaction",
        icon_size = 64,
        icon_mipmaps = 4,
        icons = {
            { icon = "__lignumis__/graphics/icons/wood-pulp.png" },
            { icon = "__base__/graphics/icons/wood.png",         scale = 0.25, shift = { 8, 8 } },
        },
        subgroup = "fluid-recipes",
        order = "a[oil-processing]-d[wood-liquefaction]",
        enabled = false,
        energy_required = 3,
        crafting_machine_tint = {
            primary = { r = 0.57, g = 0.392, b = 0.114, a = 1.000 },
            secondary = { r = 0.57, g = 0.392, b = 0.114, a = 1.000 },
            tertiary = { r = 0.57, g = 0.392, b = 0.114, a = 1.000 },
            quaternary = { r = 0.57, g = 0.392, b = 0.114, a = 1.000 }
        },
        ingredients = {
            { type = "item",  name = "wood",  amount = 1 },
            { type = "fluid", name = "steam", amount = 5 }
        },
        results = {
            { type = "fluid", name = "wood-pulp", amount = 10 }
        }
    },
    {
        type = "technology",
        name = "wood-liquefaction",
        icon_size = 256,
        icon_mipmaps = 4,
        icons = {
            { icon = "__base__/graphics/technology/oil-processing.png", icon_size = 256 },
            { icon = "__lignumis__/graphics/icons/wood-pulp.png",       icon_size = 64, scale = 1 }
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "wood-liquefaction"
            }
        },
        prerequisites = { "steam-science-pack" },
        unit = {
            ingredients = {
                { "wood-science-pack",  1 },
                { "steam-science-pack", 1 }
            },
            time = 15,
            count = 50
        },
        order = "w"
    }
})
