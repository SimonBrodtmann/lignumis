local item_sounds = require("__base__.prototypes.item_sounds")

local gfx = "__lignumis__/graphics/entity/burner-long-handed-inserter/"

local long_handed_inserter = table.deepcopy(data.raw["inserter"]["long-handed-inserter"])
long_handed_inserter.name = "burner-long-handed-inserter"
long_handed_inserter.icon = "__lignumis__/graphics/icons/burner-long-handed-inserter.png"
long_handed_inserter.minable.result = "burner-long-handed-inserter"
long_handed_inserter.next_upgrade = "long-handed-inserter"
long_handed_inserter.corpse = "burner-long-handed-inserter-remnants"
long_handed_inserter.resistances = nil
long_handed_inserter.hand_base_picture.filename = gfx .. "burner-long-handed-inserter-hand-base.png"
long_handed_inserter.hand_closed_picture.filename = gfx .. "burner-long-handed-inserter-hand-closed.png"
long_handed_inserter.hand_open_picture.filename = gfx .. "burner-long-handed-inserter-hand-open.png"
long_handed_inserter.platform_picture.sheet.filename = gfx .. "burner-long-handed-inserter-platform.png"
long_handed_inserter.energy_per_movement = "100kJ"
long_handed_inserter.energy_per_rotation = "100kJ"
long_handed_inserter.energy_source = {
    type = "burner",
    fuel_categories = { "chemical" },
    effectivity = 1,
    fuel_inventory_size = 1,
    initial_fuel = "coal",
    initial_fuel_percent = 0.25,
    light_flicker = { color = { 0, 0, 0 } },
    smoke = {
        {
            name = "smoke",
            deviation = { 0.1, 0.1 },
            frequency = 9
        }
    }
}
long_handed_inserter.extension_speed = 0.035
long_handed_inserter.rotation_speed = 0.014

local remnants = table.deepcopy(data.raw["corpse"]["long-handed-inserter-remnants"])
remnants.name = "burner-long-handed-inserter-remnants"
remnants.icon = "__lignumis__/graphics/icons/burner-long-handed-inserter.png"
remnants.animation[1].filename = gfx .. "burner-long-handed-inserter-remnants.png"
remnants.animation[2].filename = gfx .. "burner-long-handed-inserter-remnants.png"
remnants.animation[3].filename = gfx .. "burner-long-handed-inserter-remnants.png"
remnants.animation[4].filename = gfx .. "burner-long-handed-inserter-remnants.png"
remnants.order = "a-c-0"

data:extend({
    long_handed_inserter,
    remnants,
    {
        type = "item",
        name = "burner-long-handed-inserter",
        icon = "__lignumis__/graphics/icons/burner-long-handed-inserter.png",
        subgroup = "inserter",
        color_hint = { text = "L" },
        order = "b0[burner-long-handed-inserter]",
        inventory_move_sound = item_sounds.inserter_inventory_move,
        pick_sound = item_sounds.inserter_inventory_pickup,
        drop_sound = item_sounds.inserter_inventory_move,
        place_result = "burner-long-handed-inserter",
        stack_size = 50
    },
    {
        type = "recipe",
        name = "burner-long-handed-inserter",
        enabled = false,
        ingredients = {
            { type = "item", name = "wooden-gear-wheel", amount = 1 },
            { type = "item", name = "burner-inserter", amount = 1 },
            { type = "item", name = "gold-cable", amount = 4 }
        },
        results = { { type = "item", name = "burner-long-handed-inserter", amount = 1 } }
    }
})