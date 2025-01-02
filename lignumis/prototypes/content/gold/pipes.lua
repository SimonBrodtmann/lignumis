local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

function make_rotated_animation_variations_from_sheet(variation_count, sheet) --makes remnants work with more than 1 variation
    local result = {}

    local function set_y_offset(variation, i)
        local frame_count = variation.frame_count or 1
        local line_length = variation.line_length or frame_count
        if (line_length < 1) then
            line_length = frame_count
        end

        local height_in_frames = math.floor((frame_count * variation.direction_count + line_length - 1) / line_length)
        -- if (height_in_frames ~= 1) then
        --   log("maybe broken sheet: h=" .. height_in_frames .. ", vc=" .. variation_count .. ", " .. variation.filename)
        -- end
        variation.y = variation.height * (i - 1) * height_in_frames
    end

    for i = 1, variation_count do
        local variation = util.table.deepcopy(sheet)

        if variation.layers then
            for _, layer in pairs(variation.layers) do
                set_y_offset(layer, i)
            end
        else
            set_y_offset(variation, i)
        end

        table.insert(result, variation)
    end
    return result
end

local pipe = util.copy(data.raw.pipe["pipe"])
pipe.name = "gold-pipe"
pipe.icon = "__lignumis__/graphics/icons/gold-pipe.png"
pipe.corpse = "gold-pipe-remnants"
pipe.next_upgrade = "pipe"
pipe.fluid_box.volume = 50
pipe.minable.result = "gold-pipe"

pipe.fluid_box.pipe_covers.north.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-north.png"
pipe.fluid_box.pipe_covers.east.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-east.png"
pipe.fluid_box.pipe_covers.south.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-south.png"
pipe.fluid_box.pipe_covers.west.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-west.png"

pipe.pictures.straight_vertical_single.filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-straight-vertical-single.png"
pipe.pictures.straight_vertical.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-straight-vertical.png"
pipe.pictures.straight_vertical_window.filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-straight-vertical-window.png"
pipe.pictures.straight_horizontal_window.filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-straight-horizontal-window.png"
pipe.pictures.straight_horizontal.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-straight-horizontal.png"
pipe.pictures.corner_up_right.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-corner-up-right.png"
pipe.pictures.corner_up_left.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-corner-up-left.png"
pipe.pictures.corner_down_right.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-corner-down-right.png"
pipe.pictures.corner_down_left.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-corner-down-left.png"
pipe.pictures.t_up.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-t-up.png"
pipe.pictures.t_down.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-t-down.png"
pipe.pictures.t_right.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-t-right.png"
pipe.pictures.t_left.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-t-left.png"
pipe.pictures.cross.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cross.png"
pipe.pictures.ending_up.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-ending-up.png"
pipe.pictures.ending_down.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-ending-down.png"
pipe.pictures.ending_right.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-ending-right.png"
pipe.pictures.ending_left.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-ending-left.png"

local pipe_item = {
    type = "item",
    name = "gold-pipe",
    icon = "__lignumis__/graphics/icons/gold-pipe.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-a[gold-pipe]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "gold-pipe",
    stack_size = 100,
    weight = 5 * kg,
    random_tint_color = item_tints.iron_rust
}

local pipe_recipe = {
    type = "recipe",
    name = "gold-pipe",
    ingredients = { { type = "item", name = "gold-plate", amount = 1 } },
    results = { { type = "item", name = "gold-pipe", amount = 1 } },
    enabled = false
}

local pipe_remnants = {
    type = "corpse",
    name = "gold-pipe-remnants",
    icon = "__lignumis__/graphics/icons/gold-pipe.png",
    flags = { "placeable-neutral", "not-on-map" },
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(2, {
        filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-remnants.png",
        width = 122,
        height = 120,
        line_length = 1,
        direction_count = 2,
        shift = util.by_pixel(1.5, 2.5), -- -0,5
        scale = 0.5
    })
}

local pipe_to_ground = util.copy(data.raw["pipe-to-ground"]["pipe-to-ground"])
pipe_to_ground.name = "gold-pipe-to-ground"
pipe_to_ground.icon = "__lignumis__/graphics/icons/gold-pipe-to-ground.png"
pipe_to_ground.corpse = "gold-pipe-to-ground-remnants"
pipe_to_ground.next_upgrade = "pipe-to-ground"
pipe_to_ground.fluid_box.volume = 50
pipe_to_ground.fluid_box.pipe_connections[2].max_underground_distance = 6
pipe_to_ground.minable.result = "gold-pipe-to-ground"

pipe_to_ground.fluid_box.pipe_covers.north.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-north.png"
pipe_to_ground.fluid_box.pipe_covers.east.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-east.png"
pipe_to_ground.fluid_box.pipe_covers.south.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-south.png"
pipe_to_ground.fluid_box.pipe_covers.west.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-west.png"

pipe_to_ground.pictures.north.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-to-ground-up.png"
pipe_to_ground.pictures.east.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-to-ground-right.png"
pipe_to_ground.pictures.south.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-to-ground-down.png"
pipe_to_ground.pictures.west.filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-to-ground-left.png"

local pipe_to_ground_item = {
    type = "item",
    name = "gold-pipe-to-ground",
    icon = "__lignumis__/graphics/icons/gold-pipe-to-ground.png",
    subgroup = "energy-pipe-distribution",
    order = "a[pipe]-b[gold-pipe-to-ground]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "gold-pipe-to-ground",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
}

local pipe_to_ground_recipe = {
    type = "recipe",
    name = "gold-pipe-to-ground",
    enabled = false,
    ingredients = {
        { type = "item", name = "gold-pipe",  amount = 6 },
        { type = "item", name = "gold-plate", amount = 4 }
    },
    results = { { type = "item", name = "gold-pipe-to-ground", amount = 2 } }
}

local pipe_to_ground_remnants = {
    type = "corpse",
    name = "gold-pipe-to-ground-remnants",
    icon = "__lignumis__/graphics/icons/gold-pipe-to-ground.png",
    flags = { "placeable-neutral", "not-on-map" },
    hidden_in_factoriopedia = true,
    subgroup = "energy-pipe-distribution-remnants",
    order = "a-d-a",
    collision_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = {
        filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-to-ground-remnants.png",
        width = 90,
        height = 80,
        line_length = 1,
        direction_count = 1,
        shift = util.by_pixel(0.5, -3),
        scale = 0.5
    }
}

local tank = {
    type = "storage-tank",
    name = "gold-storage-tank",
    icon = "__lignumis__/graphics/icons/gold-storage-tank.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "gold-storage-tank" },
    max_health = 300,
    corpse = "gold-storage-tank-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    drawing_box_vertical_extension = 0.15,
    icon_draw_specification = { scale = 1, shift = { 0, -0.25 } },
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box = {
        volume = 10000,
        pipe_covers = pipecoverspictures(),
        pipe_connections = {
            { direction = defines.direction.north, position = { 0.5, -0.5 } },
            { direction = defines.direction.east,  position = { 0.5, -0.5 } },
            { direction = defines.direction.west,  position = { -0.5, -0.5 } }
        },
        hide_connection_info = true
    },
    two_direction_only = false,
    window_bounding_box = { { -0.2, 11 / 64 }, { 0.2, 1.0 - 16 / 64 } },
    pictures = {
        picture = {
            sheets = {
                {
                    filename = "__lignumis__/graphics/entity/gold-storage-tank.png",
                    priority = "extra-high",
                    width = 128,
                    height = 160,
                    scale = 0.5,
                    frames = 4,
                    shift = util.by_pixel(0, -8)
                },
                {
                    filename = "__lignumis__/graphics/entity/gold-storage-tank.png",
                    priority = "extra-high",
                    y = 160,
                    width = 160,
                    height = 128,
                    scale = 0.5,
                    frames = 4,
                    shift = util.by_pixel(0, 8),
                    draw_as_shadow = true
                }
            }
        },
        window_background = {
            filename = "__lignumis__/graphics/entity/gold-storage-tank-window-background.png",
            priority = "extra-high",
            width = 20,
            height = 41,
            scale = 0.5,
            shift = util.by_pixel(0, -0.5)
        },
        fluid_background = {
            filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
            priority = "extra-high",
            width = 32,
            height = 15,
            scale = 1.0
        },
        flow_sprite = {
            filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
            priority = "extra-high",
            width = 160,
            height = 20,
            scale = 1.0
        },
        gas_flow = {
            filename = "__base__/graphics/entity/pipe/steam.png",
            priority = "extra-high",
            line_length = 10,
            width = 48,
            height = 30,
            frame_count = 60,
            axially_symmetrical = false,
            animation_speed = 0.25,
            direction_count = 1,
            scale = 0.5
        }
    },
    flow_length_in_ticks = 405, -- should match the Storage Tank
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound = {
        sound = {
            filename = "__base__/sound/storage-tank.ogg",
            volume = 0.5
        },
        match_volume_to_activity = true,
        audible_distance_modifier = 0.5,
        max_sounds_per_type = 3
    },
    circuit_connector = circuit_connector_definitions.create_vector
        (universal_connector_template,
            {
                {
                    variation = 25,
                    main_offset = util.by_pixel(-20, 0),
                    shadow_offset = util.by_pixel(-20, 0),
                    show_shadow = false
                },
                {
                    variation = 25,
                    main_offset = util.by_pixel(-20, 0),
                    shadow_offset = util.by_pixel(-20, 0),
                    show_shadow = false
                },
                {
                    variation = 27,
                    main_offset = util.by_pixel(20, 0),
                    shadow_offset = util.by_pixel(20, 0),
                    show_shadow = false
                },
                {
                    variation = 27,
                    main_offset = util.by_pixel(20, 0),
                    shadow_offset = util.by_pixel(20, 0),
                    show_shadow = false
                },
            }
        ),
    circuit_wire_max_distance = default_circuit_wire_max_distance,
}

tank.fluid_box.pipe_covers.north.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-north.png"
tank.fluid_box.pipe_covers.east.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-east.png"
tank.fluid_box.pipe_covers.south.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-south.png"
tank.fluid_box.pipe_covers.west.layers[1].filename = "__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-west.png"

local tank_item = {
    type = "item",
    name = "gold-storage-tank",
    icon = "__lignumis__/graphics/icons/gold-storage-tank.png",
    subgroup = "storage",
    order = "b[fluid]-a[gold-storage-tank]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "gold-storage-tank",
    stack_size = 10
}

local tank_recipe = {
    type = "recipe",
    name = "gold-storage-tank",
    energy_required = 3,
    enabled = false,
    ingredients = {
        { type = "item", name = "gold-plate", amount = 20 },
        { type = "item", name = "lumber",     amount = 20 }
    },
    results = { { type = "item", name = "gold-storage-tank", amount = 1 } }
}

local tank_remnants = {
    type = "corpse",
    name = "gold-storage-tank-remnants",
    icon = "__lignumis__/graphics/icons/gold-storage-tank.png",
    flags = { "placeable-neutral", "building-direction-8-way", "not-on-map" },
    hidden_in_factoriopedia = true,
    subgroup = "storage-remnants",
    order = "a-d-a",
    selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15,                       -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet(1,
        {
            filename = "__lignumis__/graphics/entity/gold-storage-tank-remnants.png",
            line_length = 1,
            width = 284,
            height = 188,
            direction_count = 1,
            shift = util.by_pixel(17, 12),
            scale = 0.5
        })
}

data:extend({
    pipe,
    pipe_item,
    pipe_recipe,
    pipe_remnants,
    pipe_to_ground,
    pipe_to_ground_item,
    pipe_to_ground_recipe,
    pipe_to_ground_remnants,
    tank,
    tank_item,
    tank_recipe,
    tank_remnants
})
