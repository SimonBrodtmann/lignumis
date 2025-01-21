local crash_site = require("crash-site")
local util = require("util")

-- General initialization

local Init = {
    events = {}
}


-- Migrate storage init as it was just a boolean before not supporting multiple players
local function migrate_0_9_6(event)
    if storage.init and type(storage.init) == "boolean" then
        storage.init = {
            [event.player_index] = true
        }
    end
end


-- Initialize the player
-- Teleport to Lignumis and give some starting items
local function init_player(event)
    local player = game.get_player(event.player_index)

    if not player.character then
        return
    end

    local surface = storage.surface or game.planets["lignumis"].surface
    player.teleport(surface.find_non_colliding_position("character", { 0, 0 }, 0, 1), "lignumis")
    player.character.destructible = false
    local main_inventory = player.character.get_main_inventory()

    -- Add some starting items to player inventory
    main_inventory.insert({ name = "lumber", count = 8 })
end


-- Initialize the freeplay scenario
local function init_freeplay(event)
    local player = game.get_player(event.player_index)

    if not player or not remote.interfaces.freeplay then
        return
    end

    local surface = storage.surface or game.planets["lignumis"].surface
    storage.crashed_ship_items = remote.call("freeplay", "get_ship_items")
    storage.crashed_debris_items = remote.call("freeplay", "get_debris_items")
    storage.crashed_ship_parts = remote.call("freeplay", "get_ship_parts")
    storage.starting_message = remote.call("freeplay", "get_custom_intro_message")

    local ship_items = {
        ["burner-mining-drill"] = 1,
        ["burner-agricultural-tower"] = 2
    }
    local debris_items = {
        ["lumber"] = 8,
        ["wood-darts-magazine"] = 2
    }

    crash_site.create_crash_site(surface, { -5, -6 }, ship_items, debris_items,
        table.deepcopy(storage.crashed_ship_parts))
    util.remove_safe(player, storage.crashed_ship_items)
    util.remove_safe(player, storage.crashed_debris_items)
    player.character.get_main_inventory().sort_and_merge()

    storage.crash_site_cutscene_active = true
    crash_site.create_cutscene(player, { -5, -4 })
end


Init.events[defines.events.on_player_created] = function(event)
    migrate_0_9_6(event)
    storage.init = storage.init or {}

    if storage.init[event.player_index] then
        return
    end

    storage.init[event.player_index] = true
    init_player(event)
    init_freeplay(event)
end


-- Watch Nauvis being visited for the first time
Init.events[defines.events.on_player_changed_surface] = function(event)
    local player = game.get_player(event.player_index)
    if player and player.surface.name == "nauvis" then
        storage.nauvis_visited = true
    end
end


-- End intro and show starting message
Init.events[defines.events.on_cutscene_waypoint_reached] = function(event)
    if not storage.crash_site_cutscene_active then
        return
    end
    if not crash_site.is_crash_site_cutscene(event) then
        return
    end

    local player = game.get_player(event.player_index)
    player.exit_cutscene()

    if storage.skip_intro then
        return
    end

    local intro_message = storage.custom_intro_message or { "msg-intro-space-age" }

    if game.is_multiplayer() then
        player.print(intro_message)
    else
        game.show_message_dialog { text = intro_message }
    end
end


-- Cancel intro
Init.events["crash-site-skip-cutscene"] = function(event)
    if not storage.crash_site_cutscene_active then
        return
    end
    if event.player_index ~= 1 then
        return
    end
    local player = game.get_player(event.player_index)
    if player.controller_type == defines.controllers.cutscene then
        player.exit_cutscene()
    end
end

Init.events[defines.events.on_cutscene_cancelled] = function(event)
    if not storage.crash_site_cutscene_active then
        return
    end
    if event.player_index ~= 1 then
        return
    end
    storage.crash_site_cutscene_active = nil
    local player = game.get_player(event.player_index)
    if player.gui.screen.skip_cutscene_label then
        player.gui.screen.skip_cutscene_label.destroy()
    end
    if player.character then
        player.character.destructible = true
    end
    player.zoom = 1.5
end

return Init
