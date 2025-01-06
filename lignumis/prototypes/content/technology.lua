data:extend({
    {
        type = "technology",
        name = "planet-discovery-nauvis",
        icons = util.technology_icon_constant_planet("__lignumis__/graphics/technology/nauvis.png"),
        icon_size = 256,
        essential = true,
        effects = {
            {
                type = "unlock-space-location",
                space_location = "nauvis",
                use_icon_overlay_constant = true
            },
            {
                type = "unlock-recipe",
                recipe = "destination-nauvis"
            },
            {
                type = "unlock-space-platforms",
                modifier = true,
                hidden = true
            }
        },
        prerequisites = { "provisional-rocketry" },
        unit = {
            count = 100,
            ingredients = {
                { "wood-science-pack",  1 },
                { "steam-science-pack", 1 }
            },
            time = 30
        }
    },
    {
        type = "technology",
        name = "iron-processing",
        icon = "__base__/graphics/icons/iron-plate.png",
        icon_size = 64,
        essential = true,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "iron-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "iron-chest"
            },
            {
                type = "unlock-recipe",
                recipe = "iron-gear-wheel"
            }
        },
        prerequisites = { "planet-discovery-nauvis" },
        unit = {
            count = 50,
            ingredients = {
                { "wood-science-pack",  1 },
                { "steam-science-pack", 1 }
            },
            time = 15
        }
    },
    {
        type = "technology",
        name = "copper-processing",
        icon = "__base__/graphics/icons/copper-plate.png",
        icon_size = 64,
        essential = true,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "copper-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "copper-cable"
            }
        },
        prerequisites = { "planet-discovery-nauvis" },
        unit = {
            count = 50,
            ingredients = {
                { "wood-science-pack",  1 },
                { "steam-science-pack", 1 }
            },
            time = 15
        }
    },
    {
        type = "technology",
        name = "gold-fluid-handling",
        icon = "__lignumis__/graphics/technology/gold-fluid-handling.png",
        icon_size = 256,
        prerequisites = { "burner-automation" },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "gold-pipe"
            },
            {
                type = "unlock-recipe",
                recipe = "gold-pipe-to-ground"
            },
            {
                type = "unlock-recipe",
                recipe = "gold-storage-tank"
            },
            {
                type = "unlock-recipe",
                recipe = "desiccation-furnace"
            },
            {
                type = "unlock-recipe",
                recipe = "moist-stromatolite-remnant-desiccation"
            },
            {
                type = "unlock-recipe",
                recipe = "moist-stromatolite-remnant-desiccation-without-steam"
            }
        },
        unit = {
            count = 20,
            ingredients = { { "wood-science-pack", 1 } },
            time = 15
        }
    },
    {
        type = "technology",
        name = "provisional-rocketry",
        icon = "__lignumis__/graphics/technology/provisional-rocketry.png",
        icon_size = 256,
        essential = true,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "provisional-rocket-silo"
            }
        },
        prerequisites = { "wood-liquefaction" },
        unit = {
            count = 500,
            ingredients = {
                { "wood-science-pack",  1 },
                { "steam-science-pack", 1 }
            },
            time = 15
        }
    }
})
