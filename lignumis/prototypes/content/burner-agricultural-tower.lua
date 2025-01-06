local item_sounds = require("__base__.prototypes.item_sounds")

local agricultural_tower = table.deepcopy(data.raw["agricultural-tower"]["agricultural-tower"])
agricultural_tower.name = "burner-agricultural-tower"
agricultural_tower.minable.result = "burner-agricultural-tower"
agricultural_tower.next_upgrade = "agricultural-tower"
agricultural_tower.corpses = "burner-agricultural-tower-remnants"
agricultural_tower.icon = "__lignumis__/graphics/icons/burner-agricultural-tower.png"
agricultural_tower.graphics_set.animation.layers[1].filename = "__lignumis__/graphics/entity/burner-agricultural-tower-base.png"
agricultural_tower.graphics_set.working_visualisations[1].animation.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-base.png"
agricultural_tower.energy_source = {
    type = "burner",
    fuel_categories = { "chemical" },
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions_per_minute = { noise = 4 }
}
agricultural_tower.resistances = nil
agricultural_tower.input_inventory_size = 1
agricultural_tower.output_inventory_size = 4
agricultural_tower.radius = 2

local crane = agricultural_tower.crane
crane.parts[1].rotated_sprite.filenames = { "__lignumis__/graphics/entity/burner-agricultural-tower-crane-1-1.png", "__lignumis__/graphics/entity/burner-agricultural-tower-crane-1-2.png" }
crane.parts[2].rotated_sprite.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-crane-3.png"
crane.parts[3].rotated_sprite.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-crane-4.png"
crane.parts[4].rotated_sprite.filenames = { "__lignumis__/graphics/entity/burner-agricultural-tower-crane-5-1.png", "__lignumis__/graphics/entity/burner-agricultural-tower-crane-5-2.png" }
crane.parts[5].rotated_sprite.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-crane-6.png"
crane.parts[6].rotated_sprite.filenames = { "__lignumis__/graphics/entity/burner-agricultural-tower-crane-7-1.png", "__lignumis__/graphics/entity/burner-agricultural-tower-crane-7-2.png" }
crane.parts[7].rotated_sprite.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-crane-8.png"
crane.parts[8].sprite.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-crane-9.png"
crane.parts[9].sprite.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-crane-10.png"
crane.speed = {
    arm = {
        turn_rate = 0.001,
        extension_speed = 0.0025
    },
    grappler = {
        vertical_turn_rate = 0.001,
        horizontal_turn_rate = 0.005,
        extension_speed = 0.005,
        allow_transpolar_movement = true
    }
}

local remnants = table.deepcopy(data.raw["corpse"]["agricultural-tower-remnants"])
remnants.name = "burner-agricultural-tower-remnants"
remnants.icon = "__lignumis__/graphics/icons/burner-agricultural-tower.png"
remnants.animation.filename = "__lignumis__/graphics/entity/burner-agricultural-tower-remnants.png"
remnants.order = "a[0-burner-agricultural-tower]"

data:extend({
    agricultural_tower,
    remnants,
    {
        type = "item",
        name = "burner-agricultural-tower",
        icon = "__lignumis__/graphics/icons/burner-agricultural-tower.png",
        subgroup = "agriculture",
        order = "a[0-burner-agricultural-tower]",
        inventory_move_sound = item_sounds.mechanical_large_inventory_move,
        pick_sound = item_sounds.mechanical_large_inventory_pickup,
        drop_sound = item_sounds.mechanical_large_inventory_move,
        place_result = "burner-agricultural-tower",
        stack_size = 20,
        default_import_location = "lignumis"
    },
    {
        type = "recipe",
        name = "burner-agricultural-tower",
        energy_required = 10,
        ingredients = {
            { type = "item", name = "stone-brick", amount = 5 },
            { type = "item", name = "wooden-gear-wheel", amount = 20 },
            { type = "item", name = "lumber", amount = 20 }
        },
        results = { { type = "item", name = "burner-agricultural-tower", amount = 1 } },
        enabled = false
    }
})

local tech = data.raw.technology["tree-seeding"]
table.insert(tech.effects, { type = "unlock-recipe", recipe = "burner-agricultural-tower" })
tech.prerequisites = { "wood-science-pack" }
tech.unit = {
    count = 10,
    ingredients = {
        { "wood-science-pack", 1 }
    },
    time = 10
}

data.raw.technology["fish-breeding"].prerequisites = { "agricultural-science-pack" }