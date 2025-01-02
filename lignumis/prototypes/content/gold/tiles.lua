local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__base__.prototypes.tile.tile-trigger-effects")
local semi_wet_sound = sound_variations("__space-age__/sound/walking/semi-wet-rock", 10, 0.7)
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

data:extend({
    {
        type = "item-subgroup",
        name = "lignumis-tiles",
        group = "tiles",
        order = "h"
    },
    {
        type = "tile",
        name = "natural-gold-soil",
        order = "d[gold]-c[natural-gold-soil]",
        subgroup = "lignumis-tiles",
        collision_mask = tile_collision_masks.ground(),
        layer_group = "ground-natural",
        layer = 85,
        searchable = true,
        transitions = lava_stone_transitions,
        transitions_between_transitions = data.raw["tile"]["landfill"].transitions_between_transitions,
        trigger_effect = tile_trigger_effects.landfill_trigger_effect(),
        sprite_usage_surface = "any",
        variants = tile_variations_template_with_transitions(
            "__lignumis__/graphics/terrain/natural-gold-soil.png",
            {
                max_size = 4,
                [1] = { weights = { 0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                [2] = { probability = 1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
                [4] = { probability = 0.1, weights = { 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
            }
        ),
        walking_sound = semi_wet_sound,
        landing_steps_sound = tile_sounds.landing.semi_wet,
        build_sound = data.raw["tile"]["landfill"].build_sound,
        map_color = { 185, 166, 5 },
        scorch_mark_color = { r = 0.329, g = 0.242 * 2, b = 0.177, a = 1.000 },
        autoplace = {
            probability_expression =
            "multioctave_noise{x = x, y = y, persistence = 1, seed0 = map_seed, seed1 = 2000000, octaves = 3, input_scale = 1/32, output_scale = 0.6 * sqrt(2)} * 20 - 18"
        },
    }
})
