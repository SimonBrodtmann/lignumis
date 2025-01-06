local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
    {
        type = "repair-tool",
        name = "basic-repair-pack",
        icon = "__lignumis__/graphics/icons/basic-repair-pack.png",
        subgroup = "tool",
        order = "b[repair]-0[basic-repair-pack]",
        inventory_move_sound = item_sounds.repair_pack_inventory_move,
        pick_sound = item_sounds.repair_pack_inventory_pickup,
        drop_sound = item_sounds.repair_pack_inventory_move,
        speed = 1,
        durability = 150,
        stack_size = 100,
        random_tint_color = item_tints.iron_rust
    },
    {
        type = "recipe",
        name = "basic-repair-pack",
        enabled = false,
        ingredients = {
            { type = "item", name = "gold-cable",        amount = 4 },
            { type = "item", name = "wooden-gear-wheel", amount = 1 }
        },
        results = { { type = "item", name = "basic-repair-pack", amount = 1 } }
    },
    {
        type = "technology",
        name = "basic-repair-pack",
        icon = "__lignumis__/graphics/technology/basic-repair-pack.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "basic-repair-pack"
            }
        },
        prerequisites = { "wood-science-pack" },
        unit = {
            count = 25,
            ingredients = { { "wood-science-pack", 1 } },
            time = 10
        }
    }
})
