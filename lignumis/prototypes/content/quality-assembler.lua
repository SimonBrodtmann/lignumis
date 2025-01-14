local item_sounds = require("__base__.prototypes.item_sounds")

local QualityAssemblerFactory = require(MF.buildings .. "GravityAssembler")
local QualityAssembler = QualityAssemblerFactory("quality-assembler")

data:extend({
    {
        type = "burner-usage",
        name = "quality-catalyst",
        empty_slot_sprite = {
            filename = "__lignumis__/graphics/empty-quality-catalyst-slot.png",
            priority = "extra-high-no-scale",
            size = 64,
            flags = { "gui-icon" },
        },
        empty_slot_caption = { "gui.quality-catalyst" },
        empty_slot_description = { "gui.quality-catalyst-description" },
        icon = {
            filename = "__lignumis__/graphics/quality-catalyst-icon-red.png",
            priority = "extra-high-no-scale",
            width = 64,
            height = 64,
            flags = { "icon" }
        },
        no_fuel_status = { "entity-status.no-quality-catalyst" },
        accepted_fuel_key = "description.accepted-catalysts",
        burned_in_key = "used-in", -- factoriopedia
    },
    {
        type = "fuel-category",
        name = "quality-catalyst",
        fuel_value_type = { "description.quality-catalyst-energy-value" }
    },
    {
        type = "item",
        name = "gold-quality-catalyst",
        icon = "__lignumis__/graphics/icons/quality-gold-catalyst.png",
        subgroup = "raw-material",
        color_hint = { text = "C" },
        order = "a[smelting]-0[gold-plate]",
        inventory_move_sound = item_sounds.metal_small_inventory_move,
        pick_sound = item_sounds.metal_small_inventory_pickup,
        drop_sound = item_sounds.metal_small_inventory_move,
        stack_size = 50,
        fuel_category = "quality-catalyst",
        fuel_value = "1MJ",
        weight = 1000 / 50 * kg,
    },
    {
        type = "recipe",
        name = "gold-quality-catalyst",
        category = "electromagnetics",
        energy_required = 60,
        ingredients = {
            { type = "item", name = "gold-plate",       amount = 10 },
            { type = "item", name = "tungsten-carbide", amount = 2 },
            { type = "item", name = "supercapacitor",   amount = 2 }
        },
        results = { { type = "item", name = "gold-quality-catalyst", amount = 2 } },
        allow_productivity = false,
        allow_quality = false,
        enabled = false
    }
})

QualityAssembler.EntityBuilder:new()
    :allowProductivity(false)
    :burnerEnergySource({
        burner_usage = "quality-catalyst",
        fuel_categories = { "quality-catalyst" },
        fuel_inventory_size = 1,
        emissions_per_minute = { noise = 100, pollution = 6 }
    })
    :pipes()
    :apply({
        energy_usage = "1MW",
        crafting_speed = 4,
        module_slots = 6,
        allowed_effects = { "pollution", "quality" },
        effect_receiver = { base_effect = { quality = 10 } }
    })

QualityAssembler.ItemBuilder:new():apply()

QualityAssembler.RecipeBuilder:new()
    :ingredients({
        { type = "item", name = "gold-plate",        amount = 60 },
        { type = "item", name = "tungsten-plate",    amount = 40 },
        { type = "item", name = "superconductor",    amount = 50 },
        { type = "item", name = "carbon-fiber",      amount = 100 },
        { type = "item", name = "quantum-processor", amount = 10 }
    })
    :apply({
        category = "electromagnetics-or-quality-assembling",
    })

QualityAssembler.TechnologyBuilder:new()
    :prerequisites({ "legendary-quality", "quantum-processor" })
    :count(5000)
    :ingredients({
        { "wood-science-pack",            1 },
        { "steam-science-pack",           1 },
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "space-science-pack",           1 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "metallurgic-science-pack",     1 },
        { "agricultural-science-pack",    1 },
        { "electromagnetic-science-pack", 1 },
        { "cryogenic-science-pack",       1 }
    })
    :time(60)
    :additionalRecipes({ "gold-quality-catalyst" })
    :apply()

local function convert_category(name)
    local quality_name = name .. "-or-quality-assembling"
    data:extend({
        {
            type = "recipe-category",
            name = quality_name
        }
    })
    for _, assembler in pairs(data.raw["assembling-machine"]) do
        if assembler.crafting_categories and table.contains(assembler.crafting_categories, name) then
            table.insert(assembler.crafting_categories, quality_name)
        end
    end
    table.insert(data.raw["assembling-machine"]["quality-assembler"].crafting_categories, quality_name)
end

convert_category("wood-processing-or-assembling")
convert_category("metallurgy-or-assembling")
convert_category("metallurgy")
convert_category("electronics")
convert_category("electronics-or-assembling")
convert_category("electromagnetics")
convert_category("organic-or-assembling")
convert_category("crafting")
convert_category("cryogenics-or-assembling")

-- Lignumis
data.raw.recipe["lumber-mill"].category = "wood-processing-or-assembling-or-quality-assembling"

-- Nauvis
data.raw.recipe["logistic-robot"].category = "crafting-or-quality-assembling"
data.raw.recipe["construction-robot"].category = "crafting-or-quality-assembling"
data.raw.recipe["roboport"].category = "crafting-or-quality-assembling"
data.raw.recipe["speed-module-3"].category = "crafting-or-quality-assembling"
data.raw.recipe["productivity-module-3"].category = "electronics-or-quality-assembling"
data.raw.recipe["efficiency-module-3"].category = "electronics-or-quality-assembling"
data.raw.recipe["rocket-silo"].category = "crafting-or-quality-assembling"
data.raw.recipe["cargo-bay"].category = "crafting-or-quality-assembling"
data.raw.recipe["asteroid-collector"].category = "crafting-or-quality-assembling"
data.raw.recipe["thruster"].category = "crafting-or-quality-assembling"

-- Vulcanus
data.raw.recipe["foundry"].category = "metallurgy-or-assembling-or-quality-assembling"
data.raw.recipe["big-mining-drill"].category = "metallurgy-or-quality-assembling"

-- Fulgora
data.raw.recipe["electromagnetic-plant"].category = "electronics-or-assembling-or-quality-assembling"
data.raw.recipe["lightning-collector"].category = "electromagnetics-or-quality-assembling"
data.raw.recipe["mech-armor"].category = "crafting-or-quality-assembling"
data.raw.recipe["quality-module-3"].category = "electronics-or-quality-assembling"
data.raw.recipe["recycler"].category = "crafting-or-quality-assembling"

-- Gleba
data.raw.recipe["biochamber"].category = "organic-or-assembling-or-quality-assembling"
data.raw.recipe["stack-inserter"].category = "crafting-or-quality-assembling"
data.raw.recipe["spidertron"].category = "crafting-or-quality-assembling"

-- Aquilo
data.raw.recipe["cryogenic-plant"].category = "cryogenics-or-assembling-or-quality-assembling"