local BeltFactory = require(MF.logistics .. "Belts")
local Belt = BeltFactory("wood", "brown", "slow")

Belt.EntityBuilder:new()
    :itemsPerSecond(7.5)
    :nextTier("")
    :undergroundDistance(4)
    :animationSpeedMultiplier(1.01)
    :apply({
        transportBelt = {
            emissions_per_second = { noise = 0.05 }
        },
        undergroundBelt = {
            emissions_per_second = { noise = 0.5 }
        },
        splitter = {
            emissions_per_second = { noise = 1 }
        }
    })

local splitter_item = Belt.ItemBuilder:new()
    :order("0")
    :apply()
    .splitter

Belt.RecipeBuilder:new()
    :beltAmount(2)
    :ingredients("transportBelt", {
        { type = "item", name = "lumber",            amount = 1 },
        { type = "item", name = "wooden-gear-wheel", amount = 1 }
    })
    :ingredients("undergroundBelt", {
        { type = "item", name = "lumber",              amount = 1 },
        { type = "item", name = "wood-transport-belt", amount = 4 },
    })
    :ingredients("splitter", {
        { type = "item", name = "wood-transport-belt", amount = 2 },
        { type = "item", name = "lumber",              amount = 2 },
        { type = "item", name = "gold-cable",          amount = 10 }
    })
    :apply()

Belt.TechnologyBuilder:new()
    :prerequisites({ "wood-science-pack" })
    :ingredients({ { "wood-science-pack", 1 } })
    :count(10)
    :time(10)
    :apply()

data:extend({
    Belt.RecipeBuilder:new()
        :ingredients("splitter", {
            { type = "item", name = "wood-transport-belt", amount = 2 },
            { type = "item", name = "lumber",              amount = 2 },
            { type = "item", name = "electronic-circuit",  amount = 2 }
        })
        :build({
            splitter = {
                name = "wood-splitter-electronic-circuit",
                icons = {
                    { icon = splitter_item.icon },
                    { icon = "__base__/graphics/icons/electronic-circuit.png", scale = 0.25, shift = { 8, 8 } }
                }
            }
        })
        .splitter
})

table.insert(data.raw.technology["electronics"].effects, {
    type = "unlock-recipe",
    recipe = "wood-splitter-electronic-circuit"
})
