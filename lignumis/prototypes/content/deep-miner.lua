local DeepMinerFactory = require(MF.buildings .. "CoreExtractor")
local DeepMiner = DeepMinerFactory("deep-miner")

local entity = DeepMiner.EntityBuilder:new():build({
    resource_searching_radius = 0.49,
    energy_usage = "25MW",
    mining_speed = 15,
    energySource = {
        emissions_per_minute = { noise = 500 }
    },
    resource_drain_rate_percent = 75
})
entity.resource_categories = { "deep-mining" }
data:extend({ entity })

DeepMiner.ItemBuilder:new()
    :itemsPerRocket(1)
    :apply({
        subgroup = "extraction-machine",
        order = "a[items]-d[deep-miner]"
    })

DeepMiner.RecipeBuilder:new()
    :ingredients({
        { type = "item", name = "processing-unit", amount = 100 },
        { type = "item", name = "electric-engine-unit", amount = 100 },
        { type = "item", name = "steel-plate", amount = 200 },
        { type = "item", name = "concrete", amount = 50 }
    })
    :apply({
        category = "metallurgy-or-assembling"
    })

DeepMiner.TechnologyBuilder:new()
    :prerequisites({ "space-science-pack" })
    :count(500)
    :ingredients({
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        { "production-science-pack", 1 },
        { "space-science-pack",      1 }
    })
    :time(60)
    :apply()
