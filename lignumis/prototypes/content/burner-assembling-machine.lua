local item_sounds = require("__base__.prototypes.item_sounds")

local gfx = "__lignumis__/graphics/entity/burner-assembling-machine/"

local assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
assembling_machine.name = "burner-assembling-machine"
assembling_machine.icon = "__lignumis__/graphics/icons/burner-assembling-machine.png"
assembling_machine.minable.result = "burner-assembling-machine"
assembling_machine.next_upgrade = "steam-assembling-machine"
assembling_machine.corpse = "burner-assembling-machine-remnants"
assembling_machine.resistances = nil
assembling_machine.graphics_set.animation.layers[1].filename =
gfx .. "burner-assembling-machine.png"
assembling_machine.crafting_categories = {
    "crafting",
    "basic-crafting",
    "organic-or-assembling",
    "wood-processing-or-assembling"
}
assembling_machine.crafting_speed = 0.25
assembling_machine.energy_source = {
    type = "burner",
    fuel_categories = { "chemical" },
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions_per_minute = { noise = 50 },
    smoke = {
        {
            name = "smoke",
            deviation = { 0.1, 0.1 },
            frequency = 2,
            position = { 0.0, -0.8 },
            starting_vertical_speed = 0.08,
            starting_frame_deviation = 60
        }
    }
}
assembling_machine.energy_usage = "75kW"

local remnants = table.deepcopy(data.raw["corpse"]["assembling-machine-1-remnants"])
remnants.name = "burner-assembling-machine-remnants"
remnants.icon = "__lignumis__/graphics/icons/burner-assembling-machine.png"
remnants.animation[1].filename = gfx .. "burner-assembling-machine-remnants.png"
remnants.animation[2].filename = gfx .. "burner-assembling-machine-remnants.png"
remnants.animation[3].filename = gfx .. "burner-assembling-machine-remnants.png"
remnants.order = "0[burner-assembling-machine]"

data:extend({
    assembling_machine,
    remnants,
    {
        type = "item",
        name = "burner-assembling-machine",
        icon = "__lignumis__/graphics/icons/burner-assembling-machine.png",
        subgroup = "production-machine",
        order = "0[burner-assembling-machine]",
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        place_result = "burner-assembling-machine",
        stack_size = 50
    },
    {
        type = "recipe",
        name = "burner-assembling-machine",
        enabled = false,
        ingredients = {
            { type = "item", name = "wooden-gear-wheel", amount = 5 },
            { type = "item", name = "lumber",            amount = 8 },
            { type = "item", name = "gold-cable",        amount = 20 }
        },
        results = { { type = "item", name = "burner-assembling-machine", amount = 1 } },
        energy_required = 4
    },
    {
        type = "technology",
        name = "burner-automation",
        icon = "__lignumis__/graphics/technology/burner-automation.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "burner-assembling-machine"
            },
            {
                type = "unlock-recipe",
                recipe = "burner-long-handed-inserter"
            }
        },
        prerequisites = { "wood-science-pack" },
        unit = {
            count = 10,
            ingredients = { { "wood-science-pack", 1 } },
            time = 10
        },
        ignore_tech_cost_multiplier = true
    }
})
