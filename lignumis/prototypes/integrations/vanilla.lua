-- Burner mining drill

local drill = data.raw["mining-drill"]["burner-mining-drill"]
local drill_animation = drill.graphics_set.animation
drill.resource_searching_radius = 1.99
drill.icon = "__lignumis__/graphics/icons/burner-mining-drill.png"
drill.impact_category = "wood"
drill_animation.north.layers[1].filename = "__lignumis__/graphics/entity/burner-mining-drill-N.png"
drill_animation.east.layers[1].filename = "__lignumis__/graphics/entity/burner-mining-drill-E.png"
drill_animation.south.layers[1].filename = "__lignumis__/graphics/entity/burner-mining-drill-S.png"
drill_animation.west.layers[1].filename = "__lignumis__/graphics/entity/burner-mining-drill-W.png"

local drill_item = data.raw["item"]["burner-mining-drill"]
drill_item.icon = "__lignumis__/graphics/icons/burner-mining-drill.png"

local drill_recipe = data.raw["recipe"]["burner-mining-drill"]
drill_recipe.ingredients = {
    { type = "item", name = "wooden-gear-wheel", amount = 3 },
    { type = "item", name = "stone-furnace",     amount = 1 },
    { type = "item", name = "lumber",            amount = 3 }
}


-- Burner inserter

local burner_inserter = data.raw["inserter"]["burner-inserter"]
burner_inserter.icon = "__lignumis__/graphics/icons/burner-inserter.png"
burner_inserter.hand_base_picture.filename = "__lignumis__/graphics/entity/burner-inserter-hand-base.png"
burner_inserter.hand_closed_picture.filename = "__lignumis__/graphics/entity/burner-inserter-hand-closed.png"
burner_inserter.hand_open_picture.filename = "__lignumis__/graphics/entity/burner-inserter-hand-open.png"
burner_inserter.platform_picture.sheet.filename = "__lignumis__/graphics/entity/burner-inserter-platform.png"
burner_inserter.energy_source.initial_fuel = "coal"
burner_inserter.energy_source.initial_fuel_percent = 0.15

data.raw.item["burner-inserter"].icon = "__lignumis__/graphics/icons/burner-inserter.png"

data.raw.recipe["burner-inserter"].ingredients = {
    { type = "item", name = "wooden-gear-wheel", amount = 1 },
    { type = "item", name = "lumber",            amount = 1 }
}


-- Lab

local lab = data.raw["lab"]["lab"]
lab.inputs = table.assign({
    "wood-science-pack",
    "steam-science-pack"
}, lab.inputs)

local biolab = data.raw["lab"]["biolab"]
biolab.inputs = table.assign({
    "wood-science-pack",
    "steam-science-pack"
}, biolab.inputs)


-- Wood processing

local wood_processing = data.raw.recipe["wood-processing"]
wood_processing.ingredients[1].amount = 1
wood_processing.icon = data.raw.item["tree-seed"].icon

for _, tree in pairs(data.raw.tree) do
    tree.minable.result = nil
    tree.minable.count = nil
    tree.minable.results = { { type = "item", name = "wood", amount_min = 2, amount_max = 10 } }
end

local tree_plant = data.raw.plant["tree-plant"]
tree_plant.growth_ticks = 5 * minute
tree_plant.minable.results = { { type = "item", name = "wood", amount_min = 4, amount_max = 6 } }
tree_plant.minable.count = nil

table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "wood-processing-or-assembling")
table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "wood-processing-or-assembling")
table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "wood-processing-or-assembling")


-- Disable vanilla early game recipes

data.raw.recipe["iron-plate"].enabled = false
data.raw.recipe["iron-gear-wheel"].enabled = false
data.raw.recipe["iron-chest"].enabled = false
data.raw.recipe["copper-plate"].enabled = false
data.raw.recipe["copper-cable"].enabled = false
data.raw.recipe["transport-belt"].enabled = false


-- Progressive recipes

if settings.startup["lignumis-belt-progression"].value then
    table.insert(
        data.raw.recipe["transport-belt"].ingredients,
        { type = "item", name = "wood-transport-belt", amount = 2 }
    )
    table.insert(
        data.raw.recipe["underground-belt"].ingredients,
        { type = "item", name = "wood-underground-belt", amount = 2 }
    )
    table.insert(
        data.raw.recipe["splitter"].ingredients,
        { type = "item", name = "wood-splitter", amount = 1 }
    )
end

if settings.startup["lignumis-inserter-progression"].value then
    table.insert(
        data.raw.recipe["inserter"].ingredients,
        { type = "item", name = "burner-inserter", amount = 1 }
    )
end


-- Adjust vanilla technologies

local automation_science_pack_technology = data.raw.technology["automation-science-pack"]
automation_science_pack_technology.prerequisites = { "planet-discovery-nauvis" }
automation_science_pack_technology.research_trigger = nil
automation_science_pack_technology.unit = {
    count = 100,
    ingredients = {
        { "wood-science-pack",  1 },
        { "steam-science-pack", 1 }
    },
    time = 30
}

local electronics_technology = data.raw.technology["electronics"]
electronics_technology.prerequisites = { "copper-processing" }
electronics_technology.research_trigger = nil
electronics_technology.unit = {
    count = 50,
    ingredients = {
        { "wood-science-pack",  1 },
        { "steam-science-pack", 1 }
    },
    time = 15
}

local steam_power_technology = data.raw.technology["steam-power"]
steam_power_technology.prerequisites = { "iron-processing" }
steam_power_technology.research_trigger = nil
steam_power_technology.unit = {
    count = 50,
    ingredients = {
        { "wood-science-pack",  1 },
        { "steam-science-pack", 1 }
    },
    time = 15
}

local automation_technology = data.raw.technology["automation"]
automation_technology.ignore_tech_cost_multiplier = false

local logistics_technology = data.raw.technology["logistics"]
table.insert(logistics_technology.effects, {
    type = "unlock-recipe",
    recipe = "transport-belt"
})

local landfill_technology = data.raw.technology["landfill"]
landfill_technology.prerequisites = { "burner-automation" }
landfill_technology.unit = {
    count = 50,
    ingredients = { { "wood-science-pack", 1 } },
    time = 15
}

local robots_speed_technology_1 = data.raw.technology["worker-robots-speed-1"]
robots_speed_technology_1.prerequisites = { "provisional-rocketry", "basic-construction-robotics-gold" }
robots_speed_technology_1.unit = {
    count = 100,
    ingredients = { { "wood-science-pack", 1 }, { "steam-science-pack", 1 } },
    time = 15
}

local robots_speed_technology_2 = data.raw.technology["worker-robots-speed-2"]
robots_speed_technology_2.prerequisites = {
    "worker-robots-speed-1",
    "logistic-science-pack"
}
robots_speed_technology_2.unit = {
    count = 100,
    ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } },
    time = 30
}

local robots_speed_technology_3 = data.raw.technology["worker-robots-speed-3"]
robots_speed_technology_3.prerequisites = { "worker-robots-speed-2", "chemical-science-pack" }
robots_speed_technology_3.unit = {
    count = 150,
    ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } },
    time = 30
}

local robots_speed_technology_4 = data.raw.technology["worker-robots-speed-4"]
robots_speed_technology_4.prerequisites = { "worker-robots-speed-3", "utility-science-pack" }
robots_speed_technology_4.unit.ingredients = {
    { "automation-science-pack", 1 },
    { "logistic-science-pack",   1 },
    { "chemical-science-pack",   1 },
    { "utility-science-pack",    1 }
}


-- Equipment

data.raw.armor["light-armor"].equipment_grid = "tiny-equipment-grid"
data.raw.armor["heavy-armor"].equipment_grid = "very-small-equipment-grid"
data.raw["equipment-grid"]["small-equipment-grid"].width = 6
data.raw["equipment-grid"]["small-equipment-grid"].height = 6
data.raw["equipment-grid"]["medium-equipment-grid"].width = 8
data.raw["equipment-grid"]["medium-equipment-grid"].height = 8
