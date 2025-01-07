local recipe = data.raw.recipe["wooden-wall"]
recipe.ingredients = { { type = "item", name = "lumber", amount = 4 } }
recipe.results = { { type = "item", name = "wooden-wall", amount = 1 } }

local entity = data.raw.wall["wooden-wall"]
entity.emissions_per_second = { noise = -1 }