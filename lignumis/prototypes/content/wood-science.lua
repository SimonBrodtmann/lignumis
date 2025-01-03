local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "tool",
        name = "wood-science-pack",
        localised_description = { "item-description.science-pack" },
        icon = "__lignumis__/graphics/icons/wood-science-pack.png",
        subgroup = "science-pack",
        color_hint = { text = "A" },
        order = "0[wood-science-pack]",
        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        stack_size = 200,
        weight = 1 * kg,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
        random_tint_color = item_tints.iron_rust
    },
    {
        type = "recipe",
        name = "wood-science-pack",
        enabled = false,
        energy_required = 5,
        ingredients = {
            { type = "item", name = "wooden-gear-wheel", amount = 1 },
            { type = "item", name = "stone-brick",       amount = 1 }
        },
        results = { { type = "item", name = "wood-science-pack", amount = 1 } },
        crafting_machine_tint = {
            primary = { r = 0.65, g = 0.27, b = 0.18, a = 1.000 },
            secondary = { r = 0.65, g = 0.27, b = 0.18, a = 1.000 },
        },
        allow_productivity = true
    },
    {
        type = "technology",
        name = "wood-science-pack",
        icon = "__lignumis__/graphics/technology/wood-science-pack.png",
        icon_size = 256,
        essential = true,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "wood-lab"
            },
            {
                type = "unlock-recipe",
                recipe = "wood-science-pack"
            }
        },
        research_trigger =
        {
            type = "craft-item",
            item = "lumber",
            count = 10
        }
    }
})
