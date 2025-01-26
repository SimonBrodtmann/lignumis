local crash_site = require("crash-site")

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
    if storage.nauvis_visited then return end
    local nauvis = game.planets["nauvis"].create_surface()
    nauvis.request_to_generate_chunks({ 0, 0 }, 3)
    nauvis.force_generate_chunk_requests()
    nauvis.daytime = 0.7
end


-- Teleport player to Nauvis and show welcome message
local function teleport_player(player)
    local nauvis = game.planets["nauvis"].surface
    if player.surface.name == "lignumis" then
        player.teleport(nauvis.find_non_colliding_position("character", { 0, 0 }, 0, 1), "nauvis")
        chart_starting_area(nauvis, player)
        player.print("Oh no, not again. But... Welcome to Nauvis!")
    end
end


-- Initialize the Nauvis freeplay scenario
local function init_freeplay()
    if not remote.interfaces.freeplay then return end

    local nauvis = game.planets["nauvis"].surface
    local ship_items = {
        ["burner-mining-drill"] = 2,
        ["stone-furnace"] = 2,
        ["burner-assembling-machine"] = 2,
        ["burner-agricultural-tower"] = 2,
        ["wood-lab"] = 2
    }
    local debris_items = { ["wood-darts-magazine"] = 20, ["wood"] = 20, ["lumber"] = 20 }
    local crashed_ship_parts = remote.call("freeplay", "get_ship_parts")

    crash_site.create_crash_site(nauvis, { -5, -6 }, ship_items, debris_items, table.deepcopy(crashed_ship_parts))
end


ToNauvis.events[defines.events.on_rocket_launched] = function(event)
    if not event.rocket_silo.name == "provisional-rocket-silo" then return end

    local rocket_entry
    local rocket_entry_index
    local player

    for i, entry in pairs(storage.rocket_silos) do
        if entry.real_silo == event.rocket_silo then
            rocket_entry = entry
            rocket_entry_index = i
            player = game.get_player(entry.player)
            break
        end
    end

    init_nauvis()
    teleport_player(player)
    init_freeplay()

    -- Give the player the content of the rocket
    local inventory = player.get_main_inventory()
    for _, item in pairs(rocket_entry.rocket_content) do
        inventory.insert(item)
    end
    inventory.sort_and_merge()
    table.remove(storage.rocket_silos, rocket_entry_index)
end

return ToNauvis
