local sounds = require("__base__.prototypes.entity.sounds")
local resource_autoplace = require("resource-autoplace")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

local grass_driving_sound = {
    sound = {
        filename = "__base__/sound/driving/vehicle-surface-grass.ogg", volume = 0.5,
        advanced_volume_control = { fades = { fade_in = { curve_type = "cosine", from = { control = 0.5, volume_percentage = 0.0 }, to = { 1.5, 100.0 } } } }
    },
    fade_ticks = 6
}

data:extend({
    {
        type = "resource",
        name = "peat",
        icon = "__lignumis__/graphics/icons/peat.png",
        flags = { "placeable-neutral" },
        order = "a-b-b",
        tree_removal_probability = 0.1,
        tree_removal_max_distance = 32 * 32,
        minable = {
            count = 2,
            mining_particle = "wooden-particle",
            mining_time = 1,
            results = {
                {
                    type = "item",
                    name = "peat",
                    amount = 2
                },
                {
                    type = "item",
                    name = "wood",
                    amount_min = 1,
                    amount_max = 8,
                    probability = 0.1
                }
            }
        },
        walking_sound = sounds.plant,
        driving_sound = grass_driving_sound,
        collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        autoplace = resource_autoplace.resource_autoplace_settings {
            name = "lignumis_peat",
            order = "b",
            base_density = 2,
            base_spots_per_km2 = 5,
            has_starting_area_placement = true,
            regular_rq_factor_multiplier = 1,
            starting_rq_factor_multiplier = 1,
            candidate_spot_count = 21
        },
        stage_counts = { 15000, 9500, 5500, 2900, 1300, 400, 150, 80 },
        stages = {
            sheet = {
                filename = "__base__/graphics/entity/iron-ore/iron-ore.png",
                priority = "extra-high",
                size = 128,
                frame_count = 8,
                variation_count = 8,
                scale = 0.5,
                tint = { b = 0.24, g = 0.50, r = 0.79 }
            }
        },
        map_color = { 0.4, 0.2470, 0.1176 },
        mining_visualisation_tint = { b = 0.24, g = 0.50, r = 0.79 },
        factoriopedia_simulation = {
            init = "    game.simulation.camera_position = {0, -0.5}\n\n    game.surfaces[1].create_entity{name = \"peat\", position = {-2.5, -2.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-1.5, -2.5}, amount = 100}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-0.5, -2.5}, amount = 500}\n    game.surfaces[1].create_entity{name = \"peat\", position = {1.5, -2.5}, amount = 150}\n    game.surfaces[1].create_entity{name = \"peat\", position = {0.5, -2.5}, amount = 200}\n    game.surfaces[1].create_entity{name = \"peat\", position = {2.5, -2.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-4.5, -0.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-3.5, -1.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-3.5, -0.5}, amount = 150}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-2.5, -1.5}, amount = 150}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-2.5, -0.5}, amount = 650}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-0.5, -0.5}, amount = 1000}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-1.5, -0.5}, amount = 850}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-0.5, -1.5}, amount = 800}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-1.5, -1.5}, amount = 650}\n    game.surfaces[1].create_entity{name = \"peat\", position = {1.5, -1.5}, amount = 450}\n    game.surfaces[1].create_entity{name = \"peat\", position = {1.5, -0.5}, amount = 1000}\n    game.surfaces[1].create_entity{name = \"peat\", position = {0.5, -0.5}, amount = 1050}\n    game.surfaces[1].create_entity{name = \"peat\", position = {0.5, -1.5}, amount = 850}\n    game.surfaces[1].create_entity{name = \"peat\", position = {3.5, -1.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {3.5, -0.5}, amount = 250}\n    game.surfaces[1].create_entity{name = \"peat\", position = {2.5, -1.5}, amount = 250}\n    game.surfaces[1].create_entity{name = \"peat\", position = {2.5, -0.5}, amount = 500}\n    game.surfaces[1].create_entity{name = \"peat\", position = {4.5, -0.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-2.5, 1.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-3.5, 0.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-2.5, 0.5}, amount = 200}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-1.5, 1.5}, amount = 150}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-0.5, 1.5}, amount = 550}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-0.5, 0.5}, amount = 850}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-1.5, 0.5}, amount = 700}\n    game.surfaces[1].create_entity{name = \"peat\", position = {1.5, 1.5}, amount = 250}\n    game.surfaces[1].create_entity{name = \"peat\", position = {0.5, 1.5}, amount = 300}\n    game.surfaces[1].create_entity{name = \"peat\", position = {1.5, 0.5}, amount = 550}\n    game.surfaces[1].create_entity{name = \"peat\", position = {0.5, 0.5}, amount = 1000}\n    game.surfaces[1].create_entity{name = \"peat\", position = {3.5, 1.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {2.5, 1.5}, amount = 150}\n    game.surfaces[1].create_entity{name = \"peat\", position = {3.5, 0.5}, amount = 150}\n    game.surfaces[1].create_entity{name = \"peat\", position = {2.5, 0.5}, amount = 300}\n    game.surfaces[1].create_entity{name = \"peat\", position = {4.5, 0.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {-0.5, 2.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {1.5, 2.5}, amount = 50}\n    game.surfaces[1].create_entity{name = \"peat\", position = {2.5, 2.5}, amount = 50}\n  "
        }
    },
    {
        type = "item",
        name = "peat",
        icon = "__lignumis__/graphics/icons/peat.png",
        subgroup = "raw-resource",
        order = "a[peat]",
        inventory_move_sound = item_sounds.landfill_inventory_move,
        pick_sound = item_sounds.landfill_inventory_pickup,
        drop_sound = item_sounds.landfill_inventory_move,
        stack_size = 100,
        weight = 2 * kg,
        random_tint_color = item_tints.iron_rust,
        fuel_category = "chemical",
        fuel_value = "8MJ",
    }
})