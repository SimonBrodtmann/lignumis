local RocketSilo = {
    events = {}
}


-- Logic for provisional rocket silo with fake silo with inventory and custom launch GUI

local function build_gui(player, rocket_silo)
    local anchor = {
        gui = defines.relative_gui_type.container_gui,
        names = { "provisional-rocket-silo-ready" },
        position = defines.relative_gui_position.right
    }

    local launch_button = { type = "button", name = "provisional-rocket-silo-launch-button", caption = { "lignumis.provisional-rocket-silo-button" } }

    local inventory = player.get_main_inventory()
    launch_button.enabled = inventory.is_empty()
    if not launch_button.enabled then
        launch_button.tooltip = { "lignumis.provisional-rocket-silo-button-tooltip" }
    end

    storage.rocket_silo_guis = storage.rocket_silo_guis or {}
    storage.rocket_silo_guis[player.index] = {
        fake_silo = rocket_silo,
        gui = gui.add(player.gui.relative, {
            {
                type = "frame",
                name = "provisional-rocket-silo-relative-frame",
                direction = "vertical",
                anchor = anchor,
                children = {
                    { type = "label", style = "frame_title", caption = { "lignumis.provisional-rocket-silo-button" }, ignored_by_interaction = true },
                    {
                        type = "frame",
                        direction = "vertical",
                        style = "inside_shallow_frame_with_padding",
                        children = {
                            {
                                type = "flow",
                                direction = "vertical",
                                style = "inset_frame_container_vertical_flow",
                                children = {
                                    { type = "label", caption = { "lignumis.provisional-rocket-silo-description" } },
                                    launch_button
                                }
                            }
                        }
                    }
                }
            }
        })
    }
end


local function on_gui_opened(event)
    local entity = event.entity
    if not entity or not entity.valid then return end
    if entity.name ~= "provisional-rocket-silo-ready" then return end
    local player = game.get_player(event.player_index)

    if player.gui.relative["provisional-rocket-silo-relative-frame"] then
        player.gui.relative["provisional-rocket-silo-relative-frame"].destroy()
    end

    build_gui(player, entity)
end


local function on_gui_closed(event)
    local entity = event.entity
    if not entity or not entity.valid then return end
    if entity.name ~= "provisional-rocket-silo-ready" then return end
end


local function launch(event)
    if event.element.name ~= "provisional-rocket-silo-launch-button" then return end
    local player = game.get_player(event.player_index)
    local fake_silo = storage.rocket_silo_guis[player.index].fake_silo
    rocket_content = fake_silo.get_inventory(defines.inventory.chest).get_contents()
    for _, entry in pairs(storage.rocket_silos) do
        if entry.fake_silo == fake_silo then
            entry.player = event.player_index
            entry.rocket_content = rocket_content
            fake_silo.destroy()
            entry.real_silo.launch_rocket()
            break
        end
    end
end


local function on_silo_mined(event)
    if event.entity.name ~= "provisional-rocket-silo-ready" then return end
    local fake_silo = event.entity
    local player = game.get_player(event.player_index)
    for i, entry in pairs(storage.rocket_silos) do
        if entry.fake_silo == fake_silo then
            player.mine_entity(entry.real_silo, true)
            table.remove(storage.rocket_silos, i)
            break
        end
    end
end


RocketSilo.on_init = function()
    storage.rocket_silos = {}
    storage.rocket_silo_guis = {}
end


RocketSilo.events[defines.events.on_script_trigger_effect] = function(event)
    if event.effect_id ~= "provisional-rocket-ready" then return end

    local lignumis = game.planets["lignumis"].surface

    if event.surface_index ~= lignumis.index then return end

    local real_silo = event.cause_entity
    local fake_silo = real_silo.surface.create_entity({
        name = "provisional-rocket-silo-ready",
        position = real_silo.position,
        force = real_silo.force,
        create_build_effect_smoke = false,
    })
    storage.rocket_silos = storage.rocket_silos or {}
    table.insert(storage.rocket_silos, {
        real_silo = real_silo,
        fake_silo = fake_silo
    })
    for _, player in pairs(real_silo.force.players) do
        if player.selected == real_silo then
            player.selected = fake_silo
        end
    end
end

RocketSilo.events[defines.events.on_gui_opened] = on_gui_opened
RocketSilo.events[defines.events.on_gui_closed] = on_gui_closed
RocketSilo.events[defines.events.on_gui_click] = launch
RocketSilo.events[defines.events.on_player_mined_entity] = on_silo_mined


return RocketSilo
