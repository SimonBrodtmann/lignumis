local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
    {
        type = "recipe",
        name = "cupriavidus-necator-starter",
        category = "organic-or-chemistry",
        energy_required = 12.8,
        enabled = false,
        ingredients = {
            { type = "item",  name = "peat",                   amount = 10 },
            { type = "item",  name = "gold-stromatolite-seed", amount = 1 },
            { type = "fluid", name = "wood-pulp",              amount = 100 },
            { type = "fluid", name = "water",                  amount = 100 }
        },
        results = { { type = "item", name = "cupriavidus-necator", amount_min = 4, amount_max = 10, probability = 0.1 } },
        result_is_always_fresh = true,
        icons = {
            { icon = "__lignumis__/graphics/icons/cupriavidus-necator-1.png" },
            { icon = "__lignumis__/graphics/icons/peat.png",                 scale = 0.25, shift = { 8, 8 } },
            { icon = "__lignumis__/graphics/icons/wood-pulp.png",            scale = 0.25, shift = { 8, 8 } }
        },
        crafting_machine_tint = {
            primary = { r = 1.000, g = 1.000, b = 1.000, a = 1.000 },    -- #fefeffff
            secondary = { r = 0.771, g = 0.771, b = 0.771, a = 1.000 },  -- #c4c4c4ff
            tertiary = { r = 0.768, g = 0.665, b = 0.762, a = 1.000 },   -- #c3a9c2ff
            quaternary = { r = 0.000, g = 0.000, b = 0.000, a = 1.000 }, -- #000000ff
        },
        enabled = false,
        allow_quality = false,
        preserve_products_in_machine_output = true,
        order = "0[lignumis]-b[cupriavidus-necator-starter]",
    },
    {
        type = "recipe",
        name = "cupriavidus-necator",
        category = "organic-or-chemistry",
        energy_required = 12.8,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "wood-pulp",           amount = 40 },
            { type = "fluid", name = "water",               amount = 100 },
            { type = "item",  name = "cupriavidus-necator", amount = 10 },
        },
        results = {
            { type = "item", name = "cupriavidus-necator", amount_min = 10, amount_max = 80, ignored_by_productivity = 1 }
        },
        result_is_always_fresh = true,
        crafting_machine_tint = {
            primary = { r = 1.000, g = 1.000, b = 1.000, a = 1.000 },    -- #fefeffff
            secondary = { r = 0.771, g = 0.771, b = 0.771, a = 1.000 },  -- #c4c4c4ff
            tertiary = { r = 0.768, g = 0.665, b = 0.762, a = 1.000 },   -- #c3a9c2ff
            quaternary = { r = 0.000, g = 0.000, b = 0.000, a = 1.000 }, -- #000000ff
        },
        enabled = false,
        allow_productivity = true,
        preserve_products_in_machine_output = true
    },
    {
        type = "item",
        name = "cupriavidus-necator",
        icon = "__lignumis__/graphics/icons/cupriavidus-necator-1.png",
        pictures = {
            { filename = "__lignumis__/graphics/icons/cupriavidus-necator-1.png", size = 64, scale = 0.5 },
            { filename = "__lignumis__/graphics/icons/cupriavidus-necator-2.png", size = 64, scale = 0.5 },
            { filename = "__lignumis__/graphics/icons/cupriavidus-necator-3.png", size = 64, scale = 0.5 },
        },
        stack_size = 1000,
        spoil_result = "dead-cupriavidus-necator",
        spoil_ticks = 2 * 60 * 60,
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        drop_sound = space_age_item_sounds.agriculture_inventory_move,
        subgroup = "agriculture-processes",
        order = "0[lignumis]-c1[cupriavidus-necator]",
        default_import_location = "lignumis",
        weight = 1 * kg
    },
    {
        type = "item",
        name = "dead-cupriavidus-necator",
        icon = "__lignumis__/graphics/icons/dead-cupriavidus-necator-1.png",
        pictures = {
            { filename = "__lignumis__/graphics/icons/dead-cupriavidus-necator-1.png", size = 64, scale = 0.5 },
            { filename = "__lignumis__/graphics/icons/dead-cupriavidus-necator-2.png", size = 64, scale = 0.5 },
            { filename = "__lignumis__/graphics/icons/dead-cupriavidus-necator-3.png", size = 64, scale = 0.5 },
        },
        stack_size = 1000,
        inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
        pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
        drop_sound = space_age_item_sounds.agriculture_inventory_move,
        subgroup = "agriculture-processes",
        order = "0[lignumis]-c2[dead-cupriavidus-necator]",
        default_import_location = "lignumis",
        weight = 1 * kg
    },
    {
        type = "recipe",
        name = "plastic-from-cupriavidus-necator",
        category = "organic-or-chemistry",
        icons = {
            { icon = "__base__/graphics/icons/plastic-bar.png" },
            { icon = "__lignumis__/graphics/icons/cupriavidus-necator-1.png", scale = 0.25, shift = { 8, 8 } }
        },
        energy_required = 12.8,
        enabled = false,
        auto_recycle = false,
        ingredients = { { type = "item", name = "cupriavidus-necator", amount = 100 } },
        results = {
            { type = "item",  name = "plastic-bar", amount_min = 1, amount_max = 20 },
            { type = "fluid", name = "wood-pulp",   amount = 10,    ignore_productivity = 10 }
        },
        crafting_machine_tint = {
            primary = { r = 1.000, g = 1.000, b = 1.000, a = 1.000 },    -- #fefeffff
            secondary = { r = 0.771, g = 0.771, b = 0.771, a = 1.000 },  -- #c4c4c4ff
            tertiary = { r = 0.768, g = 0.665, b = 0.762, a = 1.000 },   -- #c3a9c2ff
            quaternary = { r = 0.000, g = 0.000, b = 0.000, a = 1.000 }, -- #000000ff
        },
        enabled = false,
        subgroup = "agriculture-processes",
        order = "0[lignumis]-d1[plastic]",
        allow_productivity = true
    },
    {
        type = "recipe",
        name = "plastic-from-dead-cupriavidus-necator",
        category = "organic-or-chemistry",
        icons = {
            { icon = "__base__/graphics/icons/plastic-bar.png" },
            { icon = "__lignumis__/graphics/icons/dead-cupriavidus-necator-1.png", scale = 0.25, shift = { 8, 8 } }
        },
        energy_required = 12.8,
        enabled = false,
        auto_recycle = false,
        ingredients = { { type = "item", name = "dead-cupriavidus-necator", amount = 100 } },
        results = {
            { type = "item",  name = "plastic-bar", amount_min = 1, amount_max = 14 },
            { type = "fluid", name = "wood-pulp",   amount = 7,     ignore_productivity = 7 }
        },
        crafting_machine_tint = {
            primary = { r = 1.000, g = 1.000, b = 1.000, a = 1.000 },    -- #fefeffff
            secondary = { r = 0.771, g = 0.771, b = 0.771, a = 1.000 },  -- #c4c4c4ff
            tertiary = { r = 0.768, g = 0.665, b = 0.762, a = 1.000 },   -- #c3a9c2ff
            quaternary = { r = 0.000, g = 0.000, b = 0.000, a = 1.000 }, -- #000000ff
        },
        enabled = false,
        subgroup = "agriculture-processes",
        order = "0[lignumis]-d2[plastic]",
        allow_productivity = true
    },
    {
        type = "recipe",
        name = "low-density-structure-gold",
        category = "crafting",
        energy_required = 15,
        enabled = false,
        auto_recycle = false,
        ingredients = {
            { type = "item", name = "gold-plate",  amount = 20 },
            { type = "item", name = "plastic-bar", amount = 7 },
            { type = "item", name = "wood",        amount = 8 }
        },
        results = { { type = "item", name = "low-density-structure", amount = 2 } },
        allow_productivity = true,
        icons = {
            { icon = "__base__/graphics/icons/low-density-structure.png" },
            { icon = "__lignumis__/graphics/icons/gold-plate.png",       scale = 0.25, shift = { 8, 8 } }
        }
    },
    {
        type = "recipe",
        name = "nutrients-from-wood-pulp",
        category = "smelting",
        energy_required = 1,
        enabled = false,
        auto_recycle = false,
        ingredients = { { type = "fluid", name = "wood-pulp", amount = 10 } },
        results = { { type = "item", name = "nutrients", amount = 5 } },
        allow_productivity = true,
        icons = {
            { icon = "__space-age__/graphics/icons/nutrients.png" },
            { icon = "__base__/graphics/icons/wood.png",          scale = 0.25, shift = { 8, 8 } }
        },
        order = "0[lignumis]-a[nutrients]",
    },
    {
        type = "recipe",
        name = "rocket-fuel-from-wood-pulp-and-peat",
        energy_required = 15,
        enabled = false,
        auto_recycle = false,
        category = "crafting-with-fluid",
        ingredients =
        {
            { type = "item",  name = "peat",      amount = 9 },
            { type = "fluid", name = "wood-pulp", amount = 45 }
        },
        results = { { type = "item", name = "rocket-fuel", amount = 1 } },
        crafting_machine_tint =
        {
            primary = { r = 1.0, g = 0.7, b = 0.0, a = 1.000 },
            secondary = { r = 1.0, g = 0.7, b = 0.0, a = 1.000 },
        },
        allow_productivity = true,
        icons = {
            { icon = "__base__/graphics/icons/rocket-fuel.png" },
            { icon = "__lignumis__/graphics/icons/peat.png",      scale = 0.25, shift = { 8, 8 } },
            { icon = "__lignumis__/graphics/icons/wood-pulp.png", scale = 0.25, shift = { 8, 8 } }
        },
        subgroup = "agriculture-processes",
        order = "0[lignumis]-e[rocket-fuel]",
    }
})

table.assign(data.raw.technology["plastics"].effects, {
    { type = "unlock-recipe", recipe = "cupriavidus-necator-starter" },
    { type = "unlock-recipe", recipe = "cupriavidus-necator" },
    { type = "unlock-recipe", recipe = "plastic-from-cupriavidus-necator" },
    { type = "unlock-recipe", recipe = "plastic-from-dead-cupriavidus-necator" }
})

table.insert(data.raw.technology["low-density-structure"].effects,
    { type = "unlock-recipe", recipe = "low-density-structure-gold" })

table.insert(data.raw.technology["rocket-fuel"].effects,
    { type = "unlock-recipe", recipe = "rocket-fuel-from-wood-pulp-and-peat" })

table.insert(data.raw.technology["agriculture"].effects, { type = "unlock-recipe", recipe = "nutrients-from-wood-pulp" })
