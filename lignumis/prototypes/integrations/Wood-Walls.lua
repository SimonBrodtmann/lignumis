local recipe = data.raw.recipe["wooden-wall"]
recipe.ingredients = { { type = "item", name = "lumber", amount = 4 } }
recipe.results = { { type = "item", name = "wooden-wall", amount = 1 } }

-- https://mods.factorio.com/mod/Wood-Walls/discussion/679915cbb8bf3c84c65db404
data.raw.corpse["woodenwall-remnants"].icon = "__Wood-Walls__/graphics/wooden-wall/wooden-wall.png"