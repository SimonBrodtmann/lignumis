local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
    {
        name = "gold-rock-cluster",
        type = "optimized-decorative",
        order = "a[lignumis]-a[decorative]-a[gold-rock-clusters]",
        collision_box = { { -1, -1 }, { 1, 1 } },
        collision_mask = { layers = { water_tile = true, doodad = true }, colliding_with_tiles_only = true },
        render_layer = "decorative",
        walking_sound = sounds.sand,
        autoplace = {
            order = "d[ground-surface]-b[sulfur-rock]-b[cluster]",
            placement_density = 1,
            probability_expression =
            "basis_noise{x = x, y = y, seed0 = map_seed, seed1 = 3000000, input_scale = 1/8, output_scale = 1/4}",
            tile_restriction = { "natural-gold-soil" }
        },
        pictures = get_decal_pictures(
            "__space-age__/graphics/decorative/tiny-volcanic-rock-cluster/tiny-volcanic-rock-cluster-", "", 128, 8,
            { 0.788, 0.627, 0.167 }, true)
    }
})
