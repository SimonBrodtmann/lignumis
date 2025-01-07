local BeltFactory = require(MF.logistics .. "Belts")
local Belt = BeltFactory("wood", "brown", "slow")

Belt.EntityBuilder:new()
    :itemsPerSecond(7.5)
    :nextTier("")
    :undergroundDistance(4)
    :animationSpeedMultiplier(1.01)
    :apply({
        transportBelt = {
            emissions_per_second = { noise = 0.01 }
        },
        undergroundBelt = {
            emissions_per_second = { noise = 0.1 }
        },
        splitter = {
            emissions_per_second = { noise = 1 }
        }
    })

Belt.ItemBuilder:new()
    :order("0")
    :apply()

Belt.RecipeBuilder:new()
    :beltAmount(2)
    :ingredients("transportBelt", {
        { type = "item", name = "lumber", amount = 1 },
        { type = "item", name = "wooden-gear-wheel", amount = 1 }
    })
    :ingredients("undergroundBelt", {
        { type = "item", name = "lumber", amount = 1 },
        { type = "item", name = "wood-transport-belt", amount = 4 },
    })
    :ingredients("splitter", {
        { type = "item", name = "lumber", amount = 2 },
        { type = "item", name = "wooden-gear-wheel", amount = 5 },
        { type = "item", name = "wood-transport-belt", amount = 2 },
    })
    :apply()

Belt.TechnologyBuilder:new()
    :prerequisites({ "wood-science-pack" })
    :ingredients({ { "wood-science-pack", 1 } })
    :count(10)
    :time(10)
    :apply()