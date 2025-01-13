local item_sounds = require("__base__.prototypes.item_sounds")

local QualityAssemblerFactory = require(MF.buildings .. "GravityAssembler")
local QualityAssembler = QualityAssemblerFactory("quality-assembler")

data:extend({
    {
        type = "recipe-category",
        name = "quality-assembling"
    },
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
    table.assign(table.deepcopy(data.raw.recipe["electromagnetic-plant"]), {
        name = "electromagnetic-plant-quality",
        category = "quality-assembling",
        hide_from_player_crafting = true,
        enabled = true
    })
})

QualityAssembler.EntityBuilder:new()
    :allowProductivity(false)
    :burnerEnergySource({
        burner_usage = "quality-catalyst",
        fuel_categories = { "quality-catalyst" },
        fuel_inventory_size = 1,
        emissions_per_minute = { noise = 100, pollution = 6 }
    })
    :apply({
        crafting_categories = { "quality-assembling" },
        energy_usage = "1MW",
        crafting_speed = 6,
        module_slots = 6,
        allowed_effects = { "pollution", "quality" },
        effect_receiver = { base_effect = { quality = 10 } }
    })

QualityAssembler.ItemBuilder:new():apply()

QualityAssembler.RecipeBuilder:new()
    :ingredients({
        { type = "item", name = "iron-plate", amount = 100 }
    })
    :apply()

QualityAssembler.TechnologyBuilder:new()
    :prerequisites({ "automation-science-pack" })
    :count(500)
    :ingredients({ { "automation-science-pack", 1 } })
    :time(60)
    :apply()
