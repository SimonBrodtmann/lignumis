local crash_site = require("crash-site")
local util = require("util")

-- Transition from Lignumis to Nauvis with the provisional rocket silo

local ToNauvis = {
    events = {}
}


-- Chart the starting area for the player
local function chart_starting_area(surface, player)
    local r = 200
    local force = player.force
    local origin = force.get_spawn_position(surface)
    force.chart(surface, { { origin.x - r, origin.y - r }, { origin.x + r, origin.y + r } })
end


-- Initialize Nauvis
local function init_nauvis()
    local nauvis = game.planets["nauvis"].create_surface()
    nauvis.request_to_generate_chunks({ 0, 0 }, 3)
    nauvis.force_generate_chunk_requests()
    nauvis.daytime = 0.7
end


-- Teleport all players to Nauvis and show welcoe message
local function teleport_players()
    local nauvis = game.planets["nauvis"].surface
    for _, player in pairs(game.players) do
        if player.surface.name == "lignumis" then
            player.teleport(nauvis.find_non_colliding_position("character", { 0, 0 }, 0, 1), "nauvis")
            chart_starting_area(nauvis, player)
            player.print("Oh no, not again. But... Welcome to Nauvis!")
        end
    end
end


-- Initialize the Nauvis freeplay scenario
local function init_freeplay()
    if not remote.interfaces.freeplay then
        return
    end

    local nauvis = game.planets["nauvis"].surface
    local ship_items = {
        ["burner-mining-drill"] = 5,
        ["stone-furnace"] = 5,
        ["burner-assembling-machine"] = 2,
        ["burner-agricultural-tower"] = 4,
        ["wood-lab"] = 4
    }
    local debris_items = { ["wood-darts-magazine"] = 20, ["wood"] = 20, ["lumber"] = 20 }
    local crashed_ship_parts = remote.call("freeplay", "get_ship_parts")

    crash_site.create_crash_site(nauvis, { -5, -6 }, ship_items, debris_items, table.deepcopy(crashed_ship_parts))
end


ToNauvis.events[defines.events.on_rocket_launched] = function(event)
    if not event.rocket_silo.name == "provisional-rocket-silo" then
        return
    end

    init_nauvis()
    teleport_players()
    init_freeplay()
end

return ToNauvis