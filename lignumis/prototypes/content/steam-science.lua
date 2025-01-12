local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "tool",
        name = "steam-science-pack",
        localised_description = { "item-description.science-pack" },
        icon = "__lignumis__/graphics/icons/steam-science-pack.png",
        subgroup = "science-pack",
        color_hint = { text = "A" },
        order = "1[steam-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.iron_rust,
        default_import_location = "lignumis"
    },
    {
        type = "recipe",
        name = "steam-science-pack",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 20,
        ingredients = {
            { type = "item",  name = "gold-plate", amount = 2 },
            { type = "fluid", name = "steam",      amount = 10 }
        },
        results = { { type = "item", name = "steam-science-pack", amount = 2 } },
        crafting_machine_tint = {
            primary = { r = 0.65, g = 0.27, b = 0.18, a = 1.000 },
            secondary = { r = 0.65, g = 0.27, b = 0.18, a = 1.000 },
        },
        allow_productivity = true
    },
    {
        type = "technology",
        name = "steam-science-pack",
        icon = "__lignumis__/graphics/technology/steam-science-pack.png",
        icon_size = 256,
        essential = true,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "steam-science-pack"
            }
        },
        prerequisites = { "steam-automation" },
        unit = {
            count = 20,
            ingredients = { { "wood-science-pack", 1 } },
            time = 15
        }
    }
})
