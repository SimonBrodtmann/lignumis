local planet_map_gen = require("mapgen")
local effects = require("__core__/lualib/surface-render-parameter-effects")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local asteroid_util = require("__space-age__/prototypes/planet/asteroid-spawn-definitions")

local lignumis_chunks = 0.025
local nauvis_lignumis = {
    probability_on_range_chunk = {
        { position = 0.1, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle },
        { position = 0.9, probability = lignumis_chunks, angle_when_stopped = asteroid_util.chunk_angle }
    },
    type_ratios = {
        { position = 0.1, ratios = asteroid_util.nauvis_ratio },
        { position = 0.9, ratios = asteroid_util.nauvis_ratio },
    }
}

data:extend({
    {
        type = "planet",
        name = "lignumis",
        icon = "__lignumis__/graphics/icons/lignumis.png",
        starmap_icon = "__lignumis__/graphics/icons/starmap-planet-lignumis.png",
        starmap_icon_size = 512,
        gravity_pull = 4,
        distance = 16.5,
        orientation = 0.2625,
        magnitude = 0.35,
        order = "0[lignumis]",
        subgroup = "planets",
        map_seed_offset = 100,
        map_gen_settings = planet_map_gen,
        pollutant_type = "noise",
        solar_power_in_space = 300,
        draw_orbit = false,
        planet_procession_set = {
            arrival = { "default-b" },
            departure = { "default-rocket-a" }
        },
        surface_properties = {
            ["day-night-cycle"] = 1 * minute
        },
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(nauvis_lignumis, 0.9),
        surface_render_parameters = {
            clouds = effects.default_clouds_effect_properties()
        },
        persistent_ambient_sounds = {
            base_ambience = { filename = "__base__/sound/world/world_base_wind.ogg", volume = 0.3 },
            wind = { filename = "__base__/sound/wind/wind.ogg", volume = 0.8 },
            crossfade = {
                order = { "wind", "base_ambience" },
                curve_type = "cosine",
                from = { control = 0.35, volume_percentage = 0.0 },
                to = { control = 2, volume_percentage = 100.0 }
            }
        },
        procession_graphic_catalogue = {
            {
                index = procession_graphic_catalogue_types.planet_hatch_emission_in_1,
                sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-A",
                        {
                            priority = "medium",
                            draw_as_glow = true,
                            blend_mode = "additive",
                            scale = 0.5,
                            shift = util.by_pixel(-16, 96) --32 x ({0.5, -3.5} + {0, 0.5})
                        })
            },
            {
                index = procession_graphic_catalogue_types.planet_hatch_emission_in_2,
                sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-B",
                        {
                            priority = "medium",
                            draw_as_glow = true,
                            blend_mode = "additive",
                            scale = 0.5,
                            shift = util.by_pixel(-64, 96) --32 x ({2, -3.5} + {0, 0.5})
                        })
            },
            {
                index = procession_graphic_catalogue_types.planet_hatch_emission_in_3,
                sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-C",
                        {
                            priority = "medium",
                            draw_as_glow = true,
                            blend_mode = "additive",
                            scale = 0.5,
                            shift = util.by_pixel(-40, 64) --32 x ({1.25, -2.5} + {0, 0.5})
                        })
            }
        }
    }
})

data:extend({
    {
        type = "space-connection",
        name = "nauvis-lignumis",
        subgroup = "planet-connections",
        from = "nauvis",
        to = "lignumis",
        order = "0",
        length = 2000,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(nauvis_lignumis)
    },
})