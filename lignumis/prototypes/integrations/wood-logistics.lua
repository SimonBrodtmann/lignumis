-- Copied from base game
function make_rotated_animation_variations_from_sheet(variation_count, sheet)
    --makes remnants work with more than 1 variation
    local result = {}

    local function set_y_offset(variation, i)
        local frame_count = variation.frame_count or 1
        local line_length = variation.line_length or frame_count
        if (line_length < 1) then
            line_length = frame_count
        end

        local height_in_frames = math.floor((frame_count * variation.direction_count + line_length - 1) / line_length)
        -- if (height_in_frames ~= 1) then
        --   log("maybe broken sheet: h=" .. height_in_frames .. ", vc=" .. variation_count .. ", " .. variation.filename)
        -- end
        variation.y = variation.height * (i - 1) * height_in_frames
    end

    for i = 1, variation_count do
        local variation = util.table.deepcopy(sheet)

        if variation.layers then
            for _, layer in pairs(variation.layers) do
                set_y_offset(layer, i)
            end
        else
            set_y_offset(variation, i)
        end

        table.insert(result, variation)
    end
    return result
end

data:extend({
    {
        type = "corpse",
        name = "wood-transport-belt-remnants",
        icon = "__lignumis__/graphics/icons/wood-transport-belt.png",
        hidden_in_factoriopedia = true,
        flags = { "placeable-neutral", "not-on-map" },
        subgroup = "belt-remnants",
        order = "a-a-a",
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_width = 1,
        tile_height = 1,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        animation = make_rotated_animation_variations_from_sheet(2,
                {
                    filename = "__lignumis__/graphics/entity/wood-transport-belt-remnants.png",
                    line_length = 1,
                    width = 106,
                    height = 102,
                    direction_count = 4,
                    shift = util.by_pixel(1, -0.5),
                    scale = 0.5
                })
    },
    {
        type = "corpse",
        name = "wood-splitter-remnants",
        icon = "__lignumis__/graphics/icons/wood-splitter.png",
        hidden_in_factoriopedia = true,
        flags = { "placeable-neutral", "not-on-map" },
        subgroup = "belt-remnants",
        order = "a-g-a",
        selection_box = { { -0.9, -0.5 }, { 0.9, 0.5 } },
        tile_width = 2,
        tile_height = 1,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        animation = {
            filename = "__lignumis__/graphics/entity/wood-splitter-remnants.png",
            line_length = 1,
            width = 190,
            height = 190,
            direction_count = 4,
            shift = util.by_pixel(3.5, 1.5),
            scale = 0.5
        }
    },
    {
        type = "corpse",
        name = "wood-underground-belt-remnants",
        icon = "__lignumis__/graphics/icons/wood-underground-belt.png",
        hidden_in_factoriopedia = true,
        flags = { "placeable-neutral", "not-on-map", "building-direction-8-way" },
        subgroup = "belt-remnants",
        order = "a-d-a",
        selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
        tile_width = 1,
        tile_height = 1,
        selectable_in_game = false,
        time_before_removed = 60 * 60 * 15, -- 15 minutes
        expires = false,
        final_render_layer = "remnants",
        remove_on_tile_placement = false,
        animation = {
            filename = "__lignumis__/graphics/entity/wood-underground-belt-remnants.png",
            line_length = 1,
            width = 156,
            height = 144,
            direction_count = 8,
            shift = util.by_pixel(10.5, 3),
            scale = 0.5
        }
    }
})

local transport_belt = data.raw["transport-belt"]["wood-transport-belt"]
transport_belt.icon = "__lignumis__/graphics/icons/wood-transport-belt.png"
transport_belt.corpse = "wood-transport-belt-remnants"
transport_belt.belt_animation_set.animation_set.filename = "__lignumis__/graphics/entity/wood-transport-belt.png"
transport_belt.emissions_per_second = { noise = 0.01 }

local splitter = data.raw["splitter"]["wood-splitter"]
splitter.icon = "__lignumis__/graphics/icons/wood-splitter.png"
splitter.structure.north.filename = "__lignumis__/graphics/entity/wood-splitter-north.png"
splitter.structure.east.filename = "__lignumis__/graphics/entity/wood-splitter-east.png"
splitter.structure.south.filename = "__lignumis__/graphics/entity/wood-splitter-south.png"
splitter.structure.west.filename = "__lignumis__/graphics/entity/wood-splitter-west.png"
splitter.structure_patch.east.filename = "__lignumis__/graphics/entity/wood-splitter-east-top_patch.png"
splitter.structure_patch.west.filename = "__lignumis__/graphics/entity/wood-splitter-west-top_patch.png"
splitter.emissions_per_second = { noise = 1 }

local underground_belt = data.raw["underground-belt"]["wood-underground-belt"]
underground_belt.icon = "__lignumis__/graphics/icons/wood-underground-belt.png"
underground_belt.corpse = "wood-underground-belt-remnants"
underground_belt.structure.direction_in.sheet.filename = "__lignumis__/graphics/entity/wood-underground-belt-structure.png"
underground_belt.structure.direction_out.sheet.filename = "__lignumis__/graphics/entity/wood-underground-belt-structure.png"
underground_belt.structure.direction_in_side_loading.sheet.filename = "__lignumis__/graphics/entity/wood-underground-belt-structure.png"
underground_belt.structure.direction_out_side_loading.sheet.filename = "__lignumis__/graphics/entity/wood-underground-belt-structure.png"
underground_belt.emissions_per_second = { noise = 0.1 }

data.raw.item["wood-transport-belt"].icon = "__lignumis__/graphics/icons/wood-transport-belt.png"
data.raw.item["wood-splitter"].icon = "__lignumis__/graphics/icons/wood-splitter.png"
data.raw.item["wood-underground-belt"].icon = "__lignumis__/graphics/icons/wood-underground-belt.png"

local logistics_technology = data.raw.technology["wood-logistics"]
logistics_technology.icon = "__lignumis__/graphics/technology/wood-logistics.png"
logistics_technology.prerequisites = { "wood-science-pack" }
logistics_technology.unit.ingredients = { { "wood-science-pack", 1 } }

data.raw.recipe["wood-transport-belt"].ingredients = {
    { type = "item", name = "wooden-gear-wheel", amount = 1 },
    { type = "item", name = "lumber", amount = 1 }
}

data.raw.recipe["wood-splitter"].ingredients = {
    { type = "item", name = "wood-transport-belt", amount = 2 },
    { type = "item", name = "lumber", amount = 2 },
    { type = "item", name = "gold-cable", amount = 10 }
}

local lumber = data.raw.item["lumber"]
lumber.fuel_category = "chemical"
lumber.fuel_value = "4MJ"

local lumber_recipe = data.raw.recipe["lumber"]
lumber_recipe.category = "wood-processing-or-assembling"
lumber_recipe.energy_required = 2
lumber_recipe.allow_as_intermediate = true