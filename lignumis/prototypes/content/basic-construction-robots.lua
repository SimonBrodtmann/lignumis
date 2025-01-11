local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

local function robot(color)
    local result = table.deepcopy(data.raw["construction-robot"]["construction-robot"])
    result.name = "basic-construction-robot-" .. color
    result.icon = "__lignumis__/graphics/icons/basic-construction-robot-" .. color .. ".png"
    result.minable.result = "basic-construction-robot-" .. color
    result.max_health = 50
    result.speed = 0.04
    result.max_energy = "2MJ"
    result.idle.filename = "__lignumis__/graphics/entity/basic-construction-robot/basic-construction-robot-" ..
        color .. ".png"
    result.in_motion.filename = "__lignumis__/graphics/entity/basic-construction-robot/basic-construction-robot-" ..
        color .. ".png"
    result.working.filename =
        "__lignumis__/graphics/entity/basic-construction-robot/basic-construction-robot-" .. color .. "-working.png"
    return result
end

local function robot_item(color, order)
    return {
        type = "item",
        name = "basic-construction-robot-" .. color,
        icon = "__lignumis__/graphics/icons/basic-construction-robot-" .. color .. ".png",
        subgroup = "logistic-network",
        order = "a[robot]-b" .. order .. "[basic-construction-robot-" .. color .. "]",
        inventory_move_sound = item_sounds.robotic_inventory_move,
        pick_sound = item_sounds.robotic_inventory_pickup,
        drop_sound = item_sounds.robotic_inventory_move,
        place_result = "basic-construction-robot-" .. color,
        stack_size = 50,
        random_tint_color = item_tints.iron_rust
    }
end

local function robot_recipe(color, ingredients)
    return {
        type = "recipe",
        name = "basic-construction-robot-" .. color,
        enabled = false,
        energy_required = 10,
        ingredients = ingredients,
        results = { { type = "item", name = "basic-construction-robot-" .. color, amount = 1 } }
    }
end

local function generator(color)
    return {
        type = "generator-equipment",
        name = "basic-portable-generator-equipment-" .. color,
        sprite = {
            filename = "__lignumis__/graphics/equipment/basic-portable-generator-equipment-" ..
                color .. ".png",
            width = 128,
            height = 128,
            priority = "medium",
            scale = 0.5
        },
        shape = {
            width = 2,
            height = 2,
            type = "full"
        },
        burner = {
            type = "burner",
            fuel_categories = { "chemical" },
            emissions_per_minute = { noise = 5, pollution = 1 },
            fuel_inventory_size = 2,
            smoke = {
                {
                    name = "smoke",
                    deviation = { 0.1, 0.1 },
                    frequency = 5,
                    position = { 0, 0 },
                    starting_vertical_speed = 0.08,
                    starting_frame_deviation = 60
                }
            }
        },
        energy_source = {
            type = "electric",
            usage_priority = "secondary-output",
            output_flow_limit = "200kW"
        },
        power = "200kW",
        categories = { "armor" }
    }
end

local function generator_item(color, order)
    return {
        type = "item",
        name = "basic-portable-generator-equipment-" .. color,
        icon = "__lignumis__/graphics/icons/basic-portable-generator-equipment-" .. color .. ".png",
        subgroup = "equipment",
        order = "a[energy-source]-a" .. order .. "[basic-portable-generator-equipment-" .. color .. "]",
        inventory_move_sound = item_sounds.robotic_inventory_move,
        pick_sound = item_sounds.robotic_inventory_pickup,
        drop_sound = item_sounds.robotic_inventory_move,
        place_as_equipment_result = "basic-portable-generator-equipment-" .. color,
        stack_size = 10
    }
end

local function generator_recipe(color, ingredients)
    return {
        type = "recipe",
        name = "basic-portable-generator-equipment-" .. color,
        enabled = false,
        energy_required = 10,
        ingredients = ingredients,
        results = { { type = "item", name = "basic-portable-generator-equipment-" .. color, amount = 1 } }
    }
end

local function roboport(color)
    local result = table.deepcopy(data.raw["roboport-equipment"]["personal-roboport-equipment"])
    result.name = "basic-personal-roboport-equipment-" .. color
    result.take_result = "basic-personal-roboport-equipment-" .. color
    result.sprite.filename = "__lignumis__/graphics/equipment/basic-personal-roboport-equipment-" .. color .. ".png"
    result.energy_source.input_flow_limit = "400kW"
    result.energy_source.buffer_capacity = "10MJ"
    result.charging_energy = "500kW"
    result.construction_radius = 10
    return result
end

local function roboport_item(color, order)
    return {
        type = "item",
        name = "basic-personal-roboport-equipment-" .. color,
        icon = "__lignumis__/graphics/icons/basic-personal-roboport-equipment-" .. color .. ".png",
        place_as_equipment_result = "basic-personal-roboport-equipment-" .. color,
        subgroup = "utility-equipment",
        order = "e[robotics]-a" .. order .. "[basic-personal-roboport-equipment-" .. color .. "]",
        inventory_move_sound = item_sounds.roboport_inventory_move,
        pick_sound = item_sounds.roboport_inventory_pickup,
        drop_sound = item_sounds.roboport_inventory_move,
        stack_size = 10
    }
end

local function roboport_recipe(color, ingredients)
    return {
        type = "recipe",
        name = "basic-personal-roboport-equipment-" .. color,
        enabled = false,
        energy_required = 10,
        ingredients = ingredients,
        results = { { type = "item", name = "basic-personal-roboport-equipment-" .. color, amount = 1 } }
    }
end

local gold_robot_technology = {
    type = "technology",
    name = "basic-construction-robotics-gold",
    icon = "__lignumis__/graphics/technology/basic-construction-robotics-gold.png",
    icon_size = 256,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "basic-construction-robot-gold"
        },
        {
            type = "unlock-recipe",
            recipe = "basic-portable-generator-equipment-gold"
        },
        {
            type = "unlock-recipe",
            recipe = "basic-personal-roboport-equipment-gold"
        },
        {
            type = "create-ghost-on-entity-death",
            modifier = true
        }
    },
    prerequisites = { "steam-science-pack" },
    unit = {
        count = 200,
        ingredients = {
            { "wood-science-pack",  1 },
            { "steam-science-pack", 1 }
        },
        time = 15
    }
}

local copper_robot_technology = {
    type = "technology",
    name = "basic-construction-robotics-copper",
    icon = "__lignumis__/graphics/technology/basic-construction-robotics-copper.png",
    icon_size = 256,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "basic-construction-robot-copper"
        },
        {
            type = "unlock-recipe",
            recipe = "basic-portable-generator-equipment-copper"
        },
        {
            type = "unlock-recipe",
            recipe = "basic-personal-roboport-equipment-copper"
        }
    },
    prerequisites = { "basic-construction-robotics-gold", "automation-science-pack" },
    unit = {
        count = 50,
        ingredients = {
            { "automation-science-pack", 1 }
        },
        time = 15
    }
}

data:extend({
    -- Gold
    robot("gold"),
    robot_item("gold", 0),
    robot_recipe("gold", {
        { type = "item", name = "gold-plate",        amount = 2 },
        { type = "item", name = "wooden-gear-wheel", amount = 5 },
        { type = "item", name = "gold-cable",        amount = 10 }
    }),
    generator("gold"),
    generator_item("gold", 0),
    generator_recipe("gold", {
        { type = "item", name = "gold-plate",        amount = 10 },
        { type = "item", name = "wooden-gear-wheel", amount = 10 }
    }),
    roboport("gold"),
    roboport_item("gold", 0),
    roboport_recipe("gold", {
        { type = "item", name = "gold-plate",        amount = 10 },
        { type = "item", name = "wooden-gear-wheel", amount = 10 }
    }),

    -- Copper
    robot("copper"),
    robot_item("copper", 1),
    robot_recipe("copper", {
        { type = "item", name = "iron-plate",         amount = 2 },
        { type = "item", name = "iron-gear-wheel",    amount = 5 },
        { type = "item", name = "electronic-circuit", amount = 10 }
    }),
    generator("copper"),
    generator_item("copper", 1),
    generator_recipe("copper", {
        { type = "item", name = "copper-plate",    amount = 10 },
        { type = "item", name = "iron-gear-wheel", amount = 10 }
    }),
    roboport("copper"),
    roboport_item("copper", 1),
    roboport_recipe("copper", {
        { type = "item", name = "copper-plate",       amount = 10 },
        { type = "item", name = "iron-gear-wheel",    amount = 10 },
        { type = "item", name = "electronic-circuit", amount = 20 }
    }),

    -- Technology
    gold_robot_technology,
    copper_robot_technology,

    -- Equipment grids
    {
        type = "equipment-grid",
        name = "very-small-equipment-grid",
        width = 4,
        height = 4,
        equipment_categories = { "armor" }
    },
    {
        type = "equipment-grid",
        name = "tiny-equipment-grid",
        width = 4,
        height = 2,
        equipment_categories = { "armor" }
    }
})
