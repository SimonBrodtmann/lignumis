local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local stromatolite = util.copy(data.raw["simple-entity"]["copper-stromatolite"])
stromatolite.name = "gold-stromatolite"
stromatolite.icon = "__lignumis__/graphics/icons/gold-stromatolite.png"
stromatolite.autoplace = {
    probability_expression =
    "basis_noise{x = x, y = y, seed0 = map_seed, seed1 = 2000000, input_scale = 1/8, output_scale = 1/3}",
    tile_restriction = { "natural-gold-soil" }
}
stromatolite.collision_mask = util.copy(data.raw["plant"]["tree-plant"].collision_mask)
stromatolite.mining_time = 2
stromatolite.minable.results = {
    { type = "item", name = "gold-ore",               amount_min = 1, amount_max = 7 },
    { type = "item", name = "gold-bacteria",          amount_min = 3, amount_max = 9 },
    { type = "item", name = "gold-stromatolite-seed", amount = 1,     probability = 0.1 }
}
stromatolite.map_color = { 255, 171, 0, 0.5 }
stromatolite.pictures = {
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-01.png",
        width = 209,
        height = 138,
        shift = { 0.304688, -0.4 },
        scale = 0.4,

    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-02.png",
        width = 165,
        height = 129,
        shift = { 0.0, 0.0390625 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-03.png",
        width = 151,
        height = 139,
        shift = { 0.151562, 0.0 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-04.png",
        width = 216,
        height = 110,
        shift = { 0.390625, 0.0 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-05.png",
        width = 154,
        height = 147,
        shift = { 0.328125, 0.0703125 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-06.png",
        width = 154,
        height = 132,
        shift = { 0.16875, -0.1 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-07.png",
        width = 193,
        height = 130,
        shift = { 0.3, -0.2 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-08.png",
        width = 136,
        height = 117,
        shift = { 0.0, 0.0 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-09.png",
        width = 157,
        height = 115,
        shift = { 0.1, 0.0 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-10.png",
        width = 198,
        height = 153,
        shift = { 0.325, -0.1 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-11.png",
        width = 190,
        height = 115,
        shift = { 0.453125, 0.0 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-12.png",
        width = 229,
        height = 126,
        shift = { 0.539062, -0.015625 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-13.png",
        width = 151,
        height = 125,
        shift = { 0.0703125, 0.179688 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-14.png",
        width = 137,
        height = 117,
        shift = { 0.160938, 0.0 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-15.png",
        width = 201,
        height = 141,
        shift = { 0.242188, -0.195312 },
        scale = 0.4
    },
    {
        filename = "__lignumis__/graphics/entity/gold-stromatolite-16.png",
        width = 209,
        height = 154,
        shift = { 0.351562, -0.1 },
        scale = 0.4
    }
}

local plant = util.copy(data.raw["plant"]["tree-plant"])
plant.name = "gold-stromatolite-plant"
plant.localised_name = { "entity-name.gold-stromatolite-plant" }
plant.icon = "__lignumis__/graphics/icons/gold-stromatolite.png"
plant.map_color = { 255, 171, 0, 0.5 }
plant.agricultural_tower_tint = {
    primary = { r = 255, g = 171, b = 0, a = 1 },
    secondary = { r = 40, g = 100, b = 25, a = 1 }, -- #89421dff
}
plant.minable = {
    mining_particle = "copper-ore-particle",
    mining_time = 2,
    results = {
        { type = "item", name = "moist-stromatolite-remnant", amount_min = 23, amount_max = 37 },
        { type = "item", name = "gold-bacteria",              amount_min = 13, amount_max = 17 },
        { type = "item", name = "gold-stromatolite-seed",     amount_min = 1,  amount_max = 2 }
    }
}
plant.growth_ticks = 20 * minute
plant.variations = nil
plant.variation_weights = nil
plant.collision_box = { { -0.5, -0.5 }, { 0.5, 0.5 } }
plant.selection_box = { { -0.7, -0.7 }, { 0.7, 0.7 } }
plant.remains_when_mined = nil
plant.pictures = util.copy(stromatolite.pictures)
plant.autoplace = {
    probability_expression = "0",
    tile_restriction = { "natural-gold-soil" }
}

local seed = {
    type = "item",
    name = "gold-stromatolite-seed",
    localised_name = { "item-name.gold-stromatolite-seed" },
    icon = "__lignumis__/graphics/icons/gold-stromatolite-seed.png",
    pictures = {
        { size = 64, filename = "__lignumis__/graphics/icons/gold-stromatolite-seed-1.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/gold-stromatolite-seed-2.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/gold-stromatolite-seed-3.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/gold-stromatolite-seed-4.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/gold-stromatolite-seed-5.png", scale = 0.5, mipmap_count = 4 }
    },
    flags = { "always-show" },
    subgroup = "agriculture-processes",
    order = "a[seeds]-d[gold-stromatolite-seed]",
    plant_result = "gold-stromatolite-plant",
    place_result = "gold-stromatolite-plant",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 10,
    default_import_location = "lignumis",
    weight = 10 * kg
}

local bacteria = {
    type = "item",
    name = "gold-bacteria",
    icon = "__lignumis__/graphics/icons/gold-bacteria.png",
    pictures = {
        { size = 64, filename = "__lignumis__/graphics/icons/gold-bacteria.png",   scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/gold-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/gold-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/gold-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    flags = { "always-show" },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-e[gold-bacteria]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "lignumis",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "gold-ore"
}

local remnant = {
    type = "item",
    name = "moist-stromatolite-remnant",
    icon = "__lignumis__/graphics/icons/moist-stromatolite-remnant-1.png",
    pictures = {
        { size = 64, filename = "__lignumis__/graphics/icons/moist-stromatolite-remnant-1.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/moist-stromatolite-remnant-2.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__lignumis__/graphics/icons/moist-stromatolite-remnant-3.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "agriculture-processes",
    order = "b[agriculture]-f[moist-stromatolite-remnant]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "lignumis",
    weight = 1 * kg
}

data:extend({
    stromatolite,
    plant,
    seed,
    bacteria,
    remnant
})