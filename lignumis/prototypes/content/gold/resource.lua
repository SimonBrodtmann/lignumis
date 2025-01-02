local item_sounds = require("__base__.prototypes.item_sounds")
local resource_autoplace = require("resource-autoplace")

resource_autoplace.initialize_patch_set("gold-patch", true)

data:extend({
    {
        name = "deep-mining",
        type = "resource-category",
    },
    {
        type = "resource",
        name = "gold-patch",
        icon = "__lignumis__/graphics/icons/gold-patch.png",
        icon_size = 64,
        flags = { "placeable-neutral" },
        category = "deep-mining",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable = {
            mining_time = 1,
            result = "gold-ore",
        },
        collision_box = { { -4.4, -4.4 }, { 4.4, 4.4 } },
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
        autoplace = {
            probability_expression =
            "0.03 * control:lignumis_gold:frequency - abs(basis_noise{x = x, y = y, seed0 = map_seed, seed1 = 2000000, input_scale = 1/16, output_scale = 1/3})",
            richness_expression =
            "(sqrt(x^2 + y^2) * 1000 + basis_noise{x = x, y = y, seed0 = map_seed, seed1 = 1000000, input_scale = 1/16, output_scale = 1/3} * 1000) * control:lignumis_gold:richness",
            tile_restriction = { "natural-gold-soil" }
        },
        stage_counts = { 0 },
        stages = {
            sheet = {
                filename = "__lignumis__/graphics/entity/gold-patch.png",
                priority = "extra-high",
                width = 975,
                height = 664,
                scale = 0.5,
                frame_count = 1,
                variation_count = 1
            }
        },
        map_color = { r = 1, g = 0.82, b = 0.28 },
        map_grid = false
    },
    {
        type = "item",
        name = "gold-ore",
        icon = "__lignumis__/graphics/icons/gold-ore.png",
        pictures = {
            { size = 64, filename = "__lignumis__/graphics/icons/gold-ore-1.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__lignumis__/graphics/icons/gold-ore-2.png", scale = 0.5, mipmap_count = 4 },
            { size = 64, filename = "__lignumis__/graphics/icons/gold-ore-3.png", scale = 0.5, mipmap_count = 4 },
        },
        flags = { "always-show" },
        subgroup = "raw-resource",
        order = "f[gold-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        default_import_location = "lignumis",
        weight = 2 * kg
    }
})
