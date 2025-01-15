local item_sounds = require("__base__.prototypes.item_sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

data:extend({
    {
        type = "explosion",
        name = "explosion-hit-splinters",
        localised_name = { "entity-name.explosion-hit" },
        flags = { "not-on-map" },
        subgroup = "explosions",
        animations = util.empty_sprite(),
        smoke = "smoke-fast",
        smoke_count = 1,
        smoke_slow_down_factor = 1,
        created_effect = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    type = "create-particle",
                    repeat_count = 2,
                    particle_name = "wooden-chest-wooden-splinter-particle-small",
                    offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                    initial_height = 0.5,
                    initial_height_deviation = 0.04,
                    initial_vertical_speed = 0.069,
                    initial_vertical_speed_deviation = 0.025,
                    speed_from_center = 0.01,
                    speed_from_center_deviation = 0.023
                }
            }
        }
    },
    {
        type = "ammo",
        name = "wood-darts-magazine",
        icon = "__lignumis__/graphics/icons/wood-darts-magazine.png",
        ammo_category = "bullet",
        ammo_type = {
            range_modifier = 0.85,
            cooldown_modifier = 1 / 0.85,
            action = {
                type = "direct",
                action_delivery = {
                    type = "instant",
                    source_effects = {
                        {
                            type = "create-explosion",
                            entity_name = "explosion-gunshot"
                        }
                    },
                    target_effects = {
                        {
                            type = "create-entity",
                            entity_name = "explosion-hit-splinters",
                            offsets = { { 0, 0.5 } },
                            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } }
                        },
                        {
                            type = "damage",
                            damage = { amount = 3, type = "physical" }
                        }
                    }
                }
            }
        },
        magazine_size = 10,
        reload_time = 15,
        subgroup = "ammo",
        order = "a[basic-clips]-0[wood-darts-magazine]",
        inventory_move_sound = item_sounds.wood_inventory_move,
        pick_sound = item_sounds.wood_inventory_pickup,
        drop_sound = item_sounds.wood_inventory_move,
        stack_size = 100,
        weight = 10 * kg
    },
    {
        type = "recipe",
        name = "wood-darts-magazine",
        energy_required = 1,
        ingredients = { { type = "item", name = "wood", amount = 2 } },
        results = { { type = "item", name = "wood-darts-magazine", amount = 1 } }
    },
    {
        type = "armor",
        name = "wood-armor",
        icon = "__lignumis__/graphics/icons/wood-armor.png",
        resistances = {
            {
                type = "physical",
                decrease = 2,
                percent = 10
            },
            {
                type = "acid",
                decrease = 0,
                percent = 10
            },
            {
                type = "explosion",
                decrease = 1,
                percent = 10
            },
            {
                type = "fire",
                decrease = 0,
                percent = -90
            }
        },
        subgroup = "armor",
        order = "0[light-armor]",
        factoriopedia_simulation = simulations.factoriopedia_light_armor,
        inventory_move_sound = item_sounds.armor_small_inventory_move,
        pick_sound = item_sounds.armor_small_inventory_pickup,
        drop_sound = item_sounds.armor_small_inventory_move,
        stack_size = 1,
        infinite = true,
        equipment_grid = "tiny-equipment-grid"
    },
    {
        type = "recipe",
        name = "wood-armor",
        energy_required = 4,
        ingredients = {
            { type = "item", name = "wood",       amount = 20 },
            { type = "item", name = "gold-plate", amount = 4 }
        },
        results = { { type = "item", name = "wood-armor", amount = 1 } }
    },
})

if settings.startup["lignumis-ammo-progression"].value then
    table.insert(
        data.raw.recipe["firearm-magazine"].ingredients,
        { type = "item", name = "wood-darts-magazine", amount = 1 }
    )
end

data.raw.recipe["firearm-magazine"].enabled = false
data.raw.recipe["light-armor"].enabled = false
table.assign(data.raw.technology["military"].effects, {
    { type = "unlock-recipe", recipe = "firearm-magazine" },
    { type = "unlock-recipe", recipe = "light-armor" }
})
