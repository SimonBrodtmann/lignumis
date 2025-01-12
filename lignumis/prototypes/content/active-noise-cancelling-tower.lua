local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
    {
        type = "recipe-category",
        name = "active-noise-cancelling"
    },
    {
        type = "assembling-machine",
        name = "active-noise-cancelling-tower",
        icons = {
            { icon = "__base__/graphics/icons/programmable-speaker.png" },
            { icon = "__lignumis__/graphics/icons/active-noise-cancelling.png", scale = 0.25, shift = { 8, 8 } }
        },
        icon_draw_specification = { shift = { 0, -1 }, scale = 0.75, scale_for_many = 0.5 },
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.1, result = "active-noise-cancelling-tower" },
        fast_replaceable_group = "active-noise-cancelling-tower",
        max_health = 150,
        crafting_speed = 1,
        crafting_categories = { "active-noise-cancelling" },
        energy_usage = "6MW",
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = { noise = -1000 },
            drain = "0W"
        },
        fixed_recipe = "active-noise-cancelling",
        is_military_target = true,
        show_recipe_icon_on_map = true,
        map_color = { r = 112, g = 61, b = 150, a = 1 },
        corpse = "programmable-speaker-remnants",
        dying_explosion = "programmable-speaker-explosion",
        collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        damaged_trigger_effect = hit_effects.entity({ { -0.2, -2 }, { 0.2, 0.2 } }),
        drawing_box_vertical_extension = 2,
        open_sound = sounds.machine_open,
        close_sound = sounds.machine_close,
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker.png",
                        priority = "extra-high",
                        width = 59,
                        height = 178,
                        shift = util.by_pixel(-2.25, -39.5),
                        scale = 0.5
                    },
                    {
                        filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker-shadow.png",
                        priority = "extra-high",
                        width = 237,
                        height = 50,
                        shift = util.by_pixel(52.75, -3),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        water_reflection = {
            pictures = {
                filename = "__base__/graphics/entity/programmable-speaker/programmable-speaker-reflection.png",
                priority = "extra-high",
                width = 12,
                height = 24,
                shift = util.by_pixel(0, 45),
                variation_count = 1,
                scale = 5
            },
            rotate = false,
            orientation_to_variation = false
        },
        surface_conditions = { { property = "pollution-type", min = 3, max = 3 } }
    },
    {
        type = "item",
        name = "active-noise-cancelling-tower",
        icons = {
            { icon = "__base__/graphics/icons/programmable-speaker.png" },
            { icon = "__lignumis__/graphics/icons/active-noise-cancelling.png", scale = 0.25, shift = { 8, 8 } }
        },
        subgroup = "circuit-network",
        order = "d[other]-c[active-noise-cancelling-tower]",
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        place_result = "active-noise-cancelling-tower",
        stack_size = 10,
        random_tint_color = item_tints.iron_rust
    },
    {
        type = "recipe",
        name = "active-noise-cancelling-tower",
        enabled = false,
        energy_required = 20,
        ingredients = {
            { type = "item", name = "gold-plate",            amount = 6 },
            { type = "item", name = "gold-cable",            amount = 6 },
            { type = "item", name = "low-density-structure", amount = 4 },
            { type = "item", name = "processing-unit",       amount = 8 }
        },
        results = { { type = "item", name = "active-noise-cancelling-tower", amount = 1 } }
    },
    {
        type = "recipe",
        name = "active-noise-cancelling",
        icons = { { icon = "__lignumis__/graphics/icons/active-noise-cancelling.png" } },
        enabled = false,
        energy_required = 1000000,
        ingredients = {},
        results = {},
        category = "active-noise-cancelling",
        hide_from_stats = true,
        hide_from_player_crafting = true,
        surface_conditions = { { property = "pollution-type", min = 3, max = 3 } }
    },
    {
        type = "technology",
        name = "active-noise-cancelling",
        icon = "__lignumis__/graphics/technology/active-noise-cancelling.png",
        icon_size = 128,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "active-noise-cancelling-tower"
            },
            {
                type = "unlock-recipe",
                recipe = "active-noise-cancelling"
            }
        },
        prerequisites = { "utility-science-pack" },
        unit = {
            time = 60,
            count = 500,
            ingredients = {
                { "wood-science-pack",       1 },
                { "steam-science-pack",      1 },
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "space-science-pack",      1 },
                { "utility-science-pack",    1 }
            }
        }
    }
})
