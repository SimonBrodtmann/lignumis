local item_sounds = require("__base__.prototypes.item_sounds")

local turret = table.deepcopy(data.raw["ammo-turret"]["gun-turret"])
turret.name = "basic-gun-turret"
turret.icon = "__lignumis__/graphics/icons/basic-gun-turret.png"
turret.minable.result = "basic-gun-turret"
turret.max_health = 300
turret.rotation_speed = 0.01
turret.attacking_speed = 0.35
turret.folded_animation.layers[1].filename = "__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-raising.png"
turret.preparing_animation.layers[1].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-raising.png"
turret.prepared_animation.layers[1].stripes[1].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-1.png"
turret.prepared_animation.layers[1].stripes[2].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-2.png"
turret.prepared_animation.layers[1].stripes[3].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-3.png"
turret.prepared_animation.layers[1].stripes[4].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-4.png"
turret.attacking_animation.layers[1].stripes[1].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-1.png"
turret.attacking_animation.layers[1].stripes[2].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-2.png"
turret.attacking_animation.layers[1].stripes[3].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-3.png"
turret.attacking_animation.layers[1].stripes[4].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-shooting-4.png"
turret.folding_animation.layers[1].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-raising.png"
turret.graphics_set.base_visualisation.animation.layers[1].filename =
"__lignumis__/graphics/entity/basic-gun-turret/basic-gun-turret-base.png"
turret.attack_parameters.range = 16

local turret_item = {
    type = "item",
    name = "basic-gun-turret",
    icon = "__lignumis__/graphics/icons/basic-gun-turret.png",
    subgroup = "turret",
    order = "b[turret]-0[basic-gun-turret]",
    inventory_move_sound = item_sounds.turret_inventory_move,
    pick_sound = item_sounds.turret_inventory_pickup,
    drop_sound = item_sounds.turret_inventory_move,
    place_result = "basic-gun-turret",
    stack_size = 50
}

local turret_recipe = {
    type = "recipe",
    name = "basic-gun-turret",
    enabled = false,
    energy_required = 8,
    ingredients = {
        { type = "item", name = "wooden-gear-wheel", amount = 10 },
        { type = "item", name = "lumber",            amount = 10 },
        { type = "item", name = "gold-plate",        amount = 20 }
    },
    results = { { type = "item", name = "basic-gun-turret", amount = 1 } }
}

local turret_technology = {
    type = "technology",
    name = "basic-gun-turret",
    icon = "__lignumis__/graphics/technology/basic-gun-turret.png",
    icon_size = 256,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "basic-gun-turret"
        }
    },
    prerequisites = { "wood-science-pack" },
    unit = {
        count = 10,
        ingredients = { { "wood-science-pack", 1 } },
        time = 10
    }
}

data:extend({
    turret,
    turret_item,
    turret_recipe,
    turret_technology
})
