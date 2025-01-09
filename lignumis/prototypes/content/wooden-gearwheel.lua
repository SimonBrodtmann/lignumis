local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "item",
        name = "wooden-gear-wheel",
        icon = "__lignumis__/graphics/icons/wooden-gear-wheel.png",
        subgroup = "intermediate-product",
        order = "a[basic-intermediates]-0[wooden-gear-wheel]",
        inventory_move_sound = item_sounds.wood_inventory_move,
        pick_sound = item_sounds.wood_inventory_pickup,
        drop_sound = item_sounds.wood_inventory_move,
        stack_size = 100,
        random_tint_color = item_tints.iron_rust
    },
    {
        type = "recipe",
        name = "wooden-gear-wheel",
        ingredients = { { type = "item", name = "lumber", amount = 1 } },
        results = { { type = "item", name = "wooden-gear-wheel", amount = 2 } },
        allow_productivity = true
    }
})