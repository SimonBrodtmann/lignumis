local item_sounds = require("__base__.prototypes.item_sounds")
local pipecovers = require("prototypes/content/gold/pipecovers")

local furnace = table.deepcopy(data.raw.furnace["stone-furnace"])
furnace.name = "desiccation-furnace"
furnace.fluid_boxes = {
    {
        volume = 50,
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecovers(),
        pipe_connections = {
            { flow_direction = "output", direction = defines.direction.east, position = { 0.5, 0.5 } }
        },
        production_type = "output"
    }
}
furnace.crafting_categories = { "desiccation" }

furnace.fluid_boxes[1].pipe_covers.north.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-north.png"
furnace.fluid_boxes[1].pipe_covers.east.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-east.png"
furnace.fluid_boxes[1].pipe_covers.south.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-south.png"
furnace.fluid_boxes[1].pipe_covers.west.layers[1].filename =
"__lignumis__/graphics/entity/gold-pipe/gold-pipe-cover-west.png"

local furnace_item = {
    type = "item",
    name = "desiccation-furnace",
    icons = {
        { icon = "__base__/graphics/icons/stone-furnace.png" },
        { icon = "__base__/graphics/icons/fluid/steam.png", scale = 0.25, shift = { 8, -8 } }
    },
    subgroup = "smelting-machine",
    order = "a[stone-furnace]-ab[desiccation]",
    inventory_move_sound = item_sounds.brick_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
    place_result = "desiccation-furnace",
    stack_size = 50
}

local furnace_recipe = {
    type = "recipe",
    name = "desiccation-furnace",
    ingredients = {
        { type = "item", name = "stone-furnace", amount = 1 },
        { type = "item", name = "gold-pipe",     amount = 2 }
    },
    results = { { type = "item", name = "desiccation-furnace", amount = 1 } },
    enabled = false
}

data:extend({
    {
        type = "recipe-category",
        name = "desiccation"
    },
    furnace,
    furnace_item,
    furnace_recipe
})