local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "item",
        name = "lumber",
        icon = "__lignumis__/graphics/icons/lumber.png",
        pictures = {
            { filename = "__lignumis__/graphics/icons/lumber.png",   size = 64, scale = 0.5, mipmap_count = 4 },
            { filename = "__lignumis__/graphics/icons/lumber-1.png", size = 64, scale = 0.5, mipmap_count = 4 },
            { filename = "__lignumis__/graphics/icons/lumber-2.png", size = 64, scale = 0.5, mipmap_count = 4 },
        },
        subgroup = "intermediate-product",
        order = "A[basic-intermediates]-c[lumber]",
        inventory_move_sound = item_sounds.wood_inventory_move,
        pick_sound = item_sounds.wood_inventory_pickup,
        drop_sound = item_sounds.wood_inventory_move,
        stack_size = 100,
        random_tint_color = { 1.0, 0.95, 0.9, 1.0 },
        fuel_category = "wood",
        fuel_value = "4MJ"
    },
    {
        type = "recipe",
        name = "lumber",
        category = "wood-processing-or-assembling",
        allow_productivity = true,
        allow_as_intermediate = true,
        ingredients = { { type = "item", name = "wood", amount = 2 } },
        results = { { type = "item", name = "lumber", amount = 1 } },
        energy_required = 1
    }
})
