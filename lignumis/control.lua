require("script/to-nauvis")

local crash_site = require("crash-site")
local util = require("util")
local e = defines.events

local function chart_starting_area()
    local r = 200
    local force = game.forces.player
    local surface = storage.surface
    local origin = force.get_spawn_position(surface)
    force.chart(surface, { { origin.x - r, origin.y - r }, { origin.x + r, origin.y + r } })
end

local function correct_space_locations()
    local force = game.forces.player
    force.technologies["planet-discovery-lignumis"].researched = true
    if not force.technologies["planet-discovery-nauvis"].researched then
        force.lock_space_location("nauvis")
    end
end

script.on_init(function()
    if game.tick > 0 then
        storage.init = true
        game.print { "", { "lignumis.start-new-game" } }
        return
    end

    if remote.interfaces.freeplay then
        storage.disable_crashsite = remote.call("freeplay", "get_disable_crashsite")
        remote.call("freeplay", "set_disable_crashsite", true)
        remote.call("freeplay", "set_skip_intro", true)
    end

    correct_space_locations()

    storage.surface = game.planets["lignumis"].create_surface()
    storage.surface.request_to_generate_chunks({ 0, 0 }, 3)
    storage.surface.force_generate_chunk_requests()
end)

script.on_event(e.on_player_created, function(event)
    if not storage.nauvis_visited then
        local nauvis = game.get_surface("nauvis") --[[@as LuaSurface]]
        nauvis.clear()
    end

    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    local surface = storage.surface

    if not storage.init then
        storage.init = true

        surface.daytime = 0.7

        if player then
            player.teleport(surface.find_non_colliding_position("character", { 0, 0 }, 0, 1), "lignumis")

            if player.character then
                player.character.destructible = false
                local main_inventory = player.character.get_main_inventory()
                main_inventory.insert({ name = "burner-mining-drill", count = 1 })
                main_inventory.insert({ name = "burner-agricultural-tower", count = 2 })
            end

            if remote.interfaces.freeplay then
                storage.crashed_ship_items = remote.call("freeplay", "get_ship_items")
                storage.crashed_debris_items = remote.call("freeplay", "get_debris_items")
                storage.crashed_ship_parts = remote.call("freeplay", "get_ship_parts")
                storage.starting_message = remote.call("freeplay", "get_custom_intro_message")

                if not mods["wood-military"] then
                    local respawn_items = remote.call("freeplay", "get_respawn_items")
                    respawn_items["wood-darts-magazine"] = respawn_items["firearm-magazine"]
                    respawn_items["firearm-magazine"] = nil
                    remote.call("freeplay", "set_respawn_items", respawn_items)

                    local created_items = remote.call("freeplay", "get_created_items")
                    created_items["wood-darts-magazine"] = created_items["firearm-magazine"]
                    created_items["firearm-magazine"] = nil
                    remote.call("freeplay", "set_created_items", created_items)
                end

                local ship_items = { ["wood-darts-magazine"] = 2 }
                local debris_items = { ["lumber"] = 8 }

                crash_site.create_crash_site(surface, { -5, -6 }, ship_items, debris_items,
                    table.deepcopy(storage.crashed_ship_parts))
                util.remove_safe(player, storage.crashed_ship_items)
                util.remove_safe(player, storage.crashed_debris_items)

                player.get_main_inventory().sort_and_merge()

                storage.crash_site_cutscene_active = true
                crash_site.create_cutscene(player, { -5, -4 })
            end
        end

        chart_starting_area()
    end
end)

script.on_event(e.on_player_changed_surface, function(event)
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if player.surface.name == "nauvis" then
        storage.nauvis_visited = true
    end
end)

local get_starting_message = function()
    if storage.custom_intro_message then
        return storage.custom_intro_message
    end
    return { "msg-intro-space-age" }
end

local function show_intro_message(player)
    if storage.skip_intro then
        return
    end

    if game.is_multiplayer() then
        player.print(get_starting_message())
    else
        game.show_message_dialog { text = get_starting_message() }
    end
end

script.on_event(e.on_cutscene_waypoint_reached, function(event)
    if not storage.crash_site_cutscene_active then
        return
    end
    if not crash_site.is_crash_site_cutscene(event) then
        return
    end

    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]

    player.exit_cutscene()
    show_intro_message(player)
end)

script.on_event("crash-site-skip-cutscene", function(event)
    if not storage.crash_site_cutscene_active then
        return
    end
    if event.player_index ~= 1 then
        return
    end
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if player.controller_type == defines.controllers.cutscene then
        player.exit_cutscene()
    end
end)

script.on_event(e.on_cutscene_cancelled, function(event)
    if not storage.crash_site_cutscene_active then
        return
    end
    if event.player_index ~= 1 then
        return
    end
    storage.crash_site_cutscene_active = nil
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if player.gui.screen.skip_cutscene_label then
        player.gui.screen.skip_cutscene_label.destroy()
    end
    if player.character then
        player.character.destructible = true
    end
    player.zoom = 1.5
end)
