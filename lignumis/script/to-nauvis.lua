local crash_site = require("crash-site")
local util = require("util")
local e = defines.events

local function chart_starting_area(surface, player)
    local r = 200
    local force = player.force
    local origin = force.get_spawn_position(surface)
    force.chart(surface, { { origin.x - r, origin.y - r }, { origin.x + r, origin.y + r } })
end

local function travel_to_nauvis()
    local nauvis = game.planets["nauvis"].create_surface()
    nauvis.request_to_generate_chunks({ 0, 0 }, 3)
    nauvis.force_generate_chunk_requests()

    for _, player in pairs(game.players) do
        if player.surface.name == "lignumis" then
            player.teleport(nauvis.find_non_colliding_position("character", { 0, 0 }, 0, 1) --[[@as MapPosition]],
                "nauvis")
            chart_starting_area(nauvis, player)
            player.print("Oh no, not again. But... Welcome to Nauvis!")
        end
    end

    nauvis.daytime = 0.7

    if remote.interfaces.freeplay then
        local ship_items = { ["burner-mining-drill"] = 5, ["stone-furnace"] = 5, ["burner-assembling-machine"] = 2, ["burner-agricultural-tower"] = 4, ["wood-lab"] = 4 }
        local debris_items = { ["wood-darts-magazine"] = 20, ["wood"] = 20, ["lumber"] = 20 }
        local crashed_ship_parts = remote.call("freeplay", "get_ship_parts")

        crash_site.create_crash_site(nauvis, { -5, -6 }, ship_items, debris_items, table.deepcopy(crashed_ship_parts))
    end
end

script.on_event(e.on_rocket_launched, function(event)
    local rocket_silo = event.rocket_silo
    if rocket_silo.name == "provisional-rocket-silo" then
        --rocket_silo.destroy()
        travel_to_nauvis()
    end
end)
