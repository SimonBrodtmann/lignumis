data.raw.item["wood"].fuel_category = "wood"
data.raw.item["lumber"].fuel_category = "wood"
data.raw.item["tree-seed"].fuel_category = "wood"
data.raw.item["wooden-wall"].fuel_category = "wood"

-- Update burner inserters initial fuel
for _, inserter in pairs(data.raw["inserter"]) do
    if inserter.energy_source and inserter.energy_source.initial_fuel == "wood" then
        inserter.energy_source.initial_fuel = "coal"
    end
end

-- Update energy source fuel categories for buildings that should still use wood as fuel

local blacklist = {}

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

-- Add more if incompatibilities arise
update_fuel_categories(data.raw["boiler"])
