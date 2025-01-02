local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
        type = "lab",
        name = "wood-lab",
        icon = "__lignumis__/graphics/icons/wood-lab.png",
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.2, result = "wood-lab"},
        fast_replaceable_group = "lab",
        max_health = 150,
        corpse = "lab-remnants",
        dying_explosion = "lab-explosion",
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        damaged_trigger_effect = util.copy(data.raw.lab["lab"].damaged_trigger_effect),
        on_animation =
        {
            layers =
            {
                {
                    filename = "__lignumis__/graphics/entity/wood-lab.png",
                    width = 194,
                    height = 174,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 1.5),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/lab/lab-integration.png",
                    width = 242,
                    height = 162,
                    line_length = 1,
                    repeat_count = 33,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 15.5),
                    scale = 0.5
                },
                {
                    filename = "__lignumis__/graphics/entity/wood-lab-light.png",
                    blend_mode = "additive",
                    draw_as_light = true,
                    width = 216,
                    height = 194,
                    frame_count = 33,
                    line_length = 11,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(0, 0),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/lab/lab-shadow.png",
                    width = 242,
                    height = 136,
                    line_length = 1,
                    repeat_count = 33,
                    animation_speed = 1 / 3,
                    shift = util.by_pixel(13, 11),
                    scale = 0.5,
                    draw_as_shadow = true
                }
            }
        },
        off_animation =
        {
            layers =
            {
                {
                    filename = "__lignumis__/graphics/entity/wood-lab.png",
                    width = 194,
                    height = 174,
                    shift = util.by_pixel(0, 1.5),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/lab/lab-integration.png",
                    width = 242,
                    height = 162,
                    shift = util.by_pixel(0, 15.5),
                    scale = 0.5
                },
                {
                    filename = "__base__/graphics/entity/lab/lab-shadow.png",
                    width = 242,
                    height = 136,
                    shift = util.by_pixel(13, 11),
                    draw_as_shadow = true,
                    scale = 0.5
                }
            }
        },
        working_sound =
        {
            sound = { filename = "__base__/sound/lab.ogg", volume = 0.7, modifiers = { volume_multiplier("main-menu", 2.2), volume_multiplier("tips-and-tricks", 0.8) } },
            audible_distance_modifier = 0.7,
            fade_in_ticks = 4,
            fade_out_ticks = 20
        },
        impact_category = "wood",
        open_sound = { filename = "__base__/sound/open-close/lab-open.ogg", volume = 0.6 },
        close_sound = { filename = "__base__/sound/open-close/lab-close.ogg", volume = 0.6 },
        energy_source =
        {
            type = "burner",
            fuel_categories = {"chemical"},
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions_per_minute = { pollution = 12, noise = 1 },
            light_flicker = {color = {0,0,0}},
            smoke =
            {
                {
                    name = "smoke",
                    deviation = {0.1, 0.1},
                    frequency = 3
                }
            }
        },
        energy_usage = "150kW",
        researching_speed = 0.5,
        inputs =
        {
            "wood-science-pack",
            "steam-science-pack"
        },
        icons_positioning =
        {
            {inventory_index = defines.inventory.lab_modules, shift = {0, 0.9}},
            {inventory_index = defines.inventory.lab_input, shift = {0, 0}, max_icons_per_row = 4, separation_multiplier = 1/1.1}
        },
    },
    {
        type = "item",
        name = "wood-lab",
        icon = "__lignumis__/graphics/icons/wood-lab.png",
        subgroup = "production-machine",
        order = "z[lab]",
        inventory_move_sound = item_sounds.lab_inventory_move,
        pick_sound = item_sounds.lab_inventory_pickup,
        drop_sound = item_sounds.lab_inventory_move,
        place_result = "wood-lab",
        stack_size = 10
    },
    {
        type = "recipe",
        name = "wood-lab",
        energy_required = 2,
        ingredients = {
            { type = "item", name = "lumber", amount = 10 },
            { type = "item", name = "wooden-gear-wheel", amount = 10 },
            { type = "item", name = "stone-brick", amount = 10 },
            { type = "item", name = "gold-plate", amount = 20 }
        },
        results = { { type = "item", name = "wood-lab", amount = 1 } },
        enabled = false
    }
})