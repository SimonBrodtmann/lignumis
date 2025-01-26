local pipecovers = require("prototypes/content/gold/pipecovers")
local machinepipes = require("prototypes/content/gold/machinepipes")

local silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
silo.name = "provisional-rocket-silo"
silo.icon = "__lignumis__/graphics/icons/provisional-rocket-silo.png"
silo.module_slots = 0
silo.allowed_effects = { "consumption", "pollution", "speed" }
silo.minable = { mining_time = 1, result = "provisional-rocket-silo" }
silo.max_health = 1000
silo.energy_source = {
    type = "burner",
    fuel_categories = { "chemical" },
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions_per_minute = { noise = 10000 },
    smoke = {
        {
            name = "smoke",
            deviation = { 0.1, 0.1 },
            frequency = 20,
            position = { 2.0, -3.0 },
            starting_vertical_speed = 0.08,
            starting_frame_deviation = 60
        }
    }
}
silo.emissions_per_second = { noise = 1000 / 60 }
silo.energy_usage = "1MW"
silo.rocket_entity = "provisional-rocket"
silo.fixed_recipe = "provisional-rocket-part"
silo.door_opening_speed = 1 / (20 * 60)
silo.base_day_sprite.filename = "__lignumis__/graphics/entity/wooden-rocket-silo/06-rocket-silo.png"
silo.base_front_sprite.filename = "__lignumis__/graphics/entity/wooden-rocket-silo/14-rocket-silo-front.png"
silo.arm_01_back_animation.filename = "__lignumis__/graphics/entity/wooden-rocket-silo/08-rocket-silo-arms-back.png"
silo.arm_02_right_animation.filename = "__lignumis__/graphics/entity/wooden-rocket-silo/08-rocket-silo-arms-right.png"
silo.arm_03_front_animation.filename = "__lignumis__/graphics/entity/wooden-rocket-silo/13-rocket-silo-arms-front.png"
silo.fluid_boxes = {
    {
        production_type = "input",
        pipe_picture = machinepipes(),
        pipe_covers = pipecovers(),
        volume = 50,
        pipe_connections = { { flow_direction = "input", direction = defines.direction.south, position = { -2, 4 } } },
        secondary_draw_orders = { north = -1 }
    }
}
silo.fluid_boxes_off_when_no_fluid_recipe = true
silo.launch_to_space_platforms = false
silo.rocket_parts_required = 50
silo.rocket_parts_storage_cap = 50
silo.to_be_inserted_to_rocket_inventory_size = 1
silo.clamps_on_trigger = {
    type = "script",
    effect_id = "provisional-rocket-ready"
}

local silo_item = table.deepcopy(data.raw["item"]["rocket-silo"])
silo_item.name = "provisional-rocket-silo"
silo_item.order = "0[provisional-rocket-silo]"
silo_item.place_result = "provisional-rocket-silo"
silo_item.icon = "__lignumis__/graphics/icons/provisional-rocket-silo.png"

local silo_recipe = table.deepcopy(data.raw["recipe"]["rocket-silo"])
silo_recipe.name = "provisional-rocket-silo"
silo_recipe.results[1].name = "provisional-rocket-silo"
silo_recipe.ingredients = {
    { type = "item", name = "lumber",            amount = 500 },
    { type = "item", name = "wooden-gear-wheel", amount = 250 },
    { type = "item", name = "stone-brick",       amount = 500 },
    { type = "item", name = "gold-plate",        amount = 500 },
    { type = "item", name = "gold-cable",        amount = 100 }
}

local rocket = table.deepcopy(data.raw["rocket-silo-rocket"]["rocket-silo-rocket"])
rocket.name = "provisional-rocket"
rocket.inventory_size = 40
rocket.rising_speed = 1 / (14 * 60)
rocket.engine_starting_speed = 1 / (11 * 60)
rocket.flying_speed = 1 / (4000 * 60)
rocket.flying_acceleration = 0.005
rocket.rocket_sprite.layers[1].filename = "__lignumis__/graphics/entity/wooden-rocket-silo/rocket-static-pod.png"

local rocket_part_recipe = {
    type = "recipe",
    name = "provisional-rocket-part",
    icon = "__lignumis__/graphics/icons/provisional-rocket-part.png",
    energy_required = 6,
    enabled = false,
    hide_from_player_crafting = true,
    category = "rocket-building",
    ingredients = {
        { type = "item",  name = "lumber",            amount = 5 },
        { type = "item",  name = "wooden-gear-wheel", amount = 5 },
        { type = "item",  name = "gold-plate",        amount = 5 },
        { type = "item",  name = "gold-cable",        amount = 5 },
        { type = "fluid", name = "wood-pulp",         amount = 5 }
    },
    results = { { type = "item", name = "rocket-part", amount = 1 } },
    allow_productivity = true
}

local silo_ready = {
    type = "container",
    name = "provisional-rocket-silo-ready",
    icon = silo.icon,
    minable = { mining_time = 1, result = nil },
    deconstruction_alternative = "provisional-rocket-silo",
    inventory_size = 40,
    inventory_type = "normal",
    quality_affects_inventory_size = false,
    placeable_by = { item = "provisional-rocket-silo", count = 1 },
    health = 1000,
    surface_conditions = {
        {
            property = "pressure",
            min = 1
        }
    },
    flags = { "not-on-map", "not-blueprintable", "not-deconstructable", "not-flammable", "not-repairable", "not-upgradable", "no-automated-item-insertion", "no-automated-item-removal", "not-in-kill-statistics" },
    allow_copy_paste = false,
    additional_pastable_entities = { "provisional-rocket-silo" },
    collision_mask = { layers = {} },
    collision_box = table.deepcopy(silo.collision_box),
    selection_box = table.deepcopy(silo.selection_box),
}

local silo_ready_item = table.deepcopy(data.raw["item"]["rocket-silo"])
silo_ready_item.name = "provisional-rocket-silo-ready"
silo_ready_item.order = "0[provisional-rocket-silo-ready]"
silo_ready_item.place_result = "provisional-rocket-silo-ready"
silo_ready_item.icon = "__lignumis__/graphics/icons/provisional-rocket-silo.png"

data:extend({
    silo,
    silo_item,
    silo_recipe,
    rocket,
    rocket_part_recipe,
    silo_ready,
    silo_ready_item
})
