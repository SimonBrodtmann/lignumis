local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "item",
        name = "gold-plate",
        icon = "__lignumis__/graphics/icons/gold-plate.png",
        subgroup = "raw-material",
        color_hint = { text = "C" },
        order = "a[smelting]-0[gold-plate]",
        inventory_move_sound = item_sounds.metal_small_inventory_move,
        pick_sound = item_sounds.metal_small_inventory_pickup,
        drop_sound = item_sounds.metal_small_inventory_move,
        stack_size = 100
    },
    {
        type = "recipe",
        name = "gold-plate",
        category = "smelting",
        energy_required = 3.2,
        ingredients = { { type = "item", name = "gold-ore", amount = 1 } },
        results = { { type = "item", name = "gold-plate", amount = 1 } },
        allow_productivity = true
    },
    {
        type = "item",
        name = "gold-cable",
        icon = "__lignumis__/graphics/icons/gold-cable.png",
        subgroup = "intermediate-product",
        order = "a[basic-intermediates]-b0[gold-cable]",
        inventory_move_sound = item_sounds.wire_inventory_move,
        pick_sound = item_sounds.wire_inventory_pickup,
        drop_sound = item_sounds.wire_inventory_move,
        stack_size = 200,
        weight = 0.25 * kg,
        ingredient_to_weight_coefficient = 0.25
    },
    {
        type = "recipe",
        name = "gold-cable",
        ingredients = { { type = "item", name = "gold-plate", amount = 1 } },
        results = { { type = "item", name = "gold-cable", amount = 2 } },
        allow_productivity = true
    }
})
