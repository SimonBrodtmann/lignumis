-- Add wood and steam science packs as ingredients to technologies that require Nauvis science packs.
for _, technology in pairs(data.raw.technology) do
    if technology.unit and technology.unit.ingredients and not table.contains(Lignumis.science_blacklist, technology.name) then
        local ingredients = technology.unit.ingredients
        local noMatches = table.filter(ingredients, function(ingredient)
            return table.contains(Lignumis.science_pack_blacklist, ingredient[1])
        end)
        local yesMatches = table.filter(ingredients, function(ingredient)
            return table.contains(Lignumis.science_pack_whitelist, ingredient[1])
        end)
        if #noMatches == 0 and #yesMatches > 0 then
            table.insert(technology.unit.ingredients, { "wood-science-pack", 1 })
            table.insert(technology.unit.ingredients, { "steam-science-pack", 1 })
        end
    end
end


-- Add wood and steam science packs to all labs' inputs
for _, lab in pairs(data.raw.lab) do
    if lab.inputs and not table.contains(Lignumis.lab_blacklist, lab.name) then
        lab.inputs = table.assign({
            "wood-science-pack",
            "steam-science-pack"
        }, lab.inputs)
    end
end