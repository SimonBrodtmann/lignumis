local landfill_tech = data.raw.technology["wood_to_landfill"]
landfill_tech.prerequisites = { "burner-automation" }
landfill_tech.unit = {
    count = 50,
    ingredients = { { "wood-science-pack", 1 } },
    time = 15
}
