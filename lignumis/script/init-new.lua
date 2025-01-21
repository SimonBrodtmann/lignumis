local InitNew = {}

-- Initialization for new games
-- Send all players to Lignumis and clear Nauvis


-- Initialize the freeplay intro
local function init_intro()
    if not remote.interfaces.freeplay then
        return
    end

    -- Disable Nauvis intro
    remote.call("freeplay", "set_disable_crashsite", true)
    remote.call("freeplay", "set_skip_intro", true)

    -- Replace yellow ammo with wood ammo
    -- Wooden military does the same already
    if not script.active_mods["wood-military"] then
        local respawn_items = remote.call("freeplay", "get_respawn_items")
        respawn_items["wood-darts-magazine"] = respawn_items["firearm-magazine"]
        respawn_items["firearm-magazine"] = nil
        remote.call("freeplay", "set_respawn_items", respawn_items)

        local created_items = remote.call("freeplay", "get_created_items")
        created_items["wood-darts-magazine"] = created_items["firearm-magazine"]
        created_items["firearm-magazine"] = nil
        remote.call("freeplay", "set_created_items", created_items)
    end
end


-- Initialize space locations
-- Lock Nauvis, unlock Lignumis
local function init_space_locations()
    local force = game.forces.player
    force.technologies["planet-discovery-lignumis"].researched = true
    if not force.technologies["planet-discovery-nauvis"].researched then
        force.lock_space_location("nauvis")
    end
end


-- Initialize Lignumis
local function init_lignumis()
    storage.surface = game.planets["lignumis"].create_surface()
    storage.surface.request_to_generate_chunks({ 0, 0 }, 3)
    storage.surface.force_generate_chunk_requests()
    storage.surface.daytime = 0.7

    -- Chart starting area
    local r = 200
    local force = game.forces.player
    local origin = force.get_spawn_position(storage.surface)
    force.chart(storage.surface, { { origin.x - r, origin.y - r }, { origin.x + r, origin.y + r } })
end


-- Clear Nauvis surface as we start on Lignumis
local function clear_nauvis()
    game.get_surface("nauvis").clear()
end


InitNew.on_init = function()
    if game.tick > 0 then
        return
    end

    init_intro()
    init_space_locations()
    init_lignumis()
    clear_nauvis()
end

return InitNew
