local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
    {
        type = "radar",
        name = "basic-radar",
        icon = "__lignumis__/graphics/icons/basic-radar.png",
        flags = { "placeable-player", "player-creation" },
        minable = { mining_time = 0.1, result = "basic-radar" },
        fast_replaceable_group = "small-radar",
        max_health = 100,
        corpse = "small-remnants",
        dying_explosion = "inserter-explosion",
        resistances = {
            {
                type = "fire",
                percent = 70
            },
            {
                type = "impact",
                percent = 30
            }
        },
        collision_box = { { -0.25, -0.25 }, { 0.25, 0.25 } },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        damaged_trigger_effect = hit_effects.entity(),
        max_distance_of_sector_revealed = 0,
        max_distance_of_nearby_sector_revealed = 1,
        energy_per_sector = "1J",
        energy_per_nearby_scan = "1J",
        energy_source = {
            type = "burner",
            fuel_categories = { "chemical" },
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions_per_minute = { noise = 5 }
        },
        energy_usage = "25kW",
        pictures = {
            layers = {
                {
                    filename = "__lignumis__/graphics/entity/basic-radar.png",
                    priority = "low",
                    width = 128,
                    height = 128,
                    apply_projection = false,
                    direction_count = 120,
                    line_length = 12,
                    shift = { 0.21, -0.2 },
                    scale = 0.35,
                }
            }
        },
        impact_category = "metal",
        radius_minimap_visualisation_color = { 0.059, 0.092, 0.235, 0.275 },
        rotation_speed = 0.0001,
        is_military_target = false
    },
    {
        type = "item",
        name = "basic-radar",
        icon = "__lignumis__/graphics/icons/basic-radar.png",
        subgroup = "defensive-structure",
        order = "d[radar]-0[basic-radar]",
        inventory_move_sound = item_sounds.metal_large_inventory_move,
        pick_sound = item_sounds.metal_large_inventory_pickup,
        drop_sound = item_sounds.metal_large_inventory_move,
        place_result = "basic-radar",
        stack_size = 20,
        random_tint_color = item_tints.iron_rust
    },
    {
        type = "recipe",
        name = "basic-radar",
        category = "crafting-with-fluid",
        ingredients = {
            { type = "item",  name = "stone-brick",       amount = 4 },
            { type = "item",  name = "wooden-gear-wheel", amount = 4 },
            { type = "item",  name = "gold-plate",        amount = 4 },
            { type = "item",  name = "gold-cable",        amount = 4 },
            { type = "fluid", name = "steam",             amount = 20 }
        },
        results = { { type = "item", name = "basic-radar", amount = 1 } },
        enabled = false
    },
    {
        type = "technology",
        name = "basic-radar",
        icon = "__lignumis__/graphics/technology/basic-radar.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "basic-radar"
            }
        },
        prerequisites = { "steam-science-pack" },
        unit = {
            count = 50,
            ingredients = { { "wood-science-pack", 1 }, { "steam-science-pack", 1 } },
            time = 10
        }
    }
})
