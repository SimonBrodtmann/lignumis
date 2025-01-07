-- Add wood and steam science packs as ingredients to technologies that require Nauvis science packs.
-- It skips technologies that are available before coming back to Lignumis.

for _, technology in pairs(data.raw.technology) do
    if technology.unit and technology.unit.ingredients and not table.contains(Lignumis.science_blacklist, technology.name) then
        local ingredients = technology.unit.ingredients
        local noMatches = table.filter(ingredients, function(ingredient)
            return table.contains({ "wood-science-pack", "steam-science-pack" }, ingredient[1])
        end)
        local yesMatches = table.filter(ingredients, function(ingredient)
            return table.contains({ "utility-science-pack", "production-science-pack", "space-science-pack" }, ingredient[1])
        end)
        if #noMatches == 0 and #yesMatches > 0 then
            table.insert(technology.unit.ingredients, { "wood-science-pack", 1 })
            table.insert(technology.unit.ingredients, { "steam-science-pack", 1 })
        end
    end
end