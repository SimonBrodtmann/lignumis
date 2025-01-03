local DeepMinerFactory = require(MF.buildings .. "CoreExtractor")
local DeepMiner = DeepMinerFactory("deep-miner")

local entity = DeepMiner.EntityBuilder:new():build({
    resource_searching_radius = 0.49,
    energy_usage = "25MW",
    mining_speed = 30,
    energySource = {
        emissions_per_minute = { noise = 100 }
    }
})
entity.resource_categories = { "deep-mining" }
data:extend({ entity })

DeepMiner.ItemBuilder:new():apply()

DeepMiner.RecipeBuilder:new()
    :ingredients({
        { type = "item", name = "iron-plate", amount = 100 }
    })
    :apply()

DeepMiner.TechnologyBuilder:new()
    :prerequisites({ "space-science-pack" })
    :count(500)
    :ingredients({
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "production-science-pack", 1 },
        { "space-science-pack", 1 }
    })
    :time(60)
    :apply()
