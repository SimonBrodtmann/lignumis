local item_sounds = require("__base__.prototypes.item_sounds")
local pipecovers = require("prototypes/content/gold/pipecovers")
local machinepipes = require("prototypes/content/gold/machinepipes")

local gfx = "__lignumis__/graphics/entity/steam-assembling-machine/"

local assembling_machine = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])
assembling_machine.name = "steam-assembling-machine"
assembling_machine.icon = "__lignumis__/graphics/icons/steam-assembling-machine.png"
assembling_machine.minable.result = "steam-assembling-machine"
assembling_machine.next_upgrade = "assembling-machine-1"
assembling_machine.module_slots = nil
assembling_machine.corpses = "steam-assembling-machine-remnants"
assembling_machine.resistances = nil
assembling_machine.graphics_set = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"].graphics_set)
assembling_machine.graphics_set.animation.layers[1].filename =
gfx .. "steam-assembling-machine.png"
assembling_machine.crafting_categories = {
    "crafting",
    "basic-crafting",
    "organic-or-assembling",
    "wood-processing-or-assembling",
    "crafting-with-fluid"
}
assembling_machine.crafting_speed = 0.5
assembling_machine.energy_usage = "25kW"
assembling_machine.energy_source = {
    type = "fluid",
    fuel_categories = { "steam" },
    effectivity = 1,
    emissions_per_minute = { noise = 50 },
    scale_fluid_usage = true,
    fluid_box = {
        production_type = "input",
        pipe_picture = machinepipes(),
        pipe_covers = pipecovers(),
        volume = 50,
        pipe_connections = {
            { flow_direction = "input-output", direction = defines.direction.west, position = { -1, 0 } },
            { flow_direction = "input-output", direction = defines.direction.east, position = { 1, 0 } }
        },
        secondary_draw_orders = { north = -1 }
    }
}
assembling_machine.fluid_boxes[1].pipe_picture = machinepipes()
assembling_machine.fluid_boxes[1].pipe_covers = pipecovers()
assembling_machine.fluid_boxes[2].pipe_picture = machinepipes()
assembling_machine.fluid_boxes[2].pipe_covers = pipecovers()

local remnants = table.deepcopy(data.raw["corpse"]["assembling-machine-1-remnants"])
remnants.name = "steam-assembling-machine-remnants"
remnants.icon = "__lignumis__/graphics/icons/steam-assembling-machine.png"
remnants.animation[1].filename = gfx .. "steam-assembling-machine-remnants.png"
remnants.animation[2].filename = gfx .. "steam-assembling-machine-remnants.png"
remnants.animation[3].filename = gfx .. "steam-assembling-machine-remnants.png"
remnants.order = "1[steam-assembling-machine]"

data:extend({
    assembling_machine,
    remnants,
    {
        type = "item",
        name = "steam-assembling-machine",
        icon = "__lignumis__/graphics/icons/steam-assembling-machine.png",
        subgroup = "production-machine",
        order = "1[steam-assembling-machine]",
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        place_result = "steam-assembling-machine",
        stack_size = 50
    },
    {
        type = "recipe",
        name = "steam-assembling-machine",
        enabled = false,
        ingredients = {
            { type = "item", name = "burner-assembling-machine", amount = 1 },
            { type = "item", name = "gold-pipe",                 amount = 5 }
        },
        results = { { type = "item", name = "steam-assembling-machine", amount = 1 } },
        energy_required = 8
    },
    {
        type = "technology",
        name = "steam-automation",
        icon = "__lignumis__/graphics/technology/steam-automation.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "steam-assembling-machine"
            }
        },
        prerequisites = { "gold-fluid-handling" },
        unit = {
            count = 20,
            ingredients = { { "wood-science-pack", 1 } },
            time = 15
        },
        ignore_tech_cost_multiplier = true
    }
})
