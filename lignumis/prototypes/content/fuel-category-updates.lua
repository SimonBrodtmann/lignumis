local blacklist = {
    --"burner-assembling-machine",
    --"stone-furnace",
    --"desiccation-furnace",
    --"lumber-mill"
}

function update_fuel_categories(t)
    for _, entity in pairs(t) do
        if entity.energy_source
            and entity.energy_source.type == "burner"
            and not table.contains(blacklist, entity.name)
            and entity.energy_source.fuel_categories
            and table.contains(entity.energy_source.fuel_categories, "chemical")
        then
            table.insert(entity.energy_source.fuel_categories, "wood")
        end
    end
end

data.raw.item["wood"].fuel_category = "wood"
data.raw.item["lumber"].fuel_category = "wood"
data.raw.item["tree-seed"].fuel_category = "wood"
data.raw.item["wooden-wall"].fuel_category = "wood"

-- Add more if incompatibilities arise
update_fuel_categories(data.raw["boiler"])