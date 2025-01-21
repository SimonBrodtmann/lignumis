local InitExisting = {}

-- Initialization for existing games
-- Don't send players to Lignumis but instead print a warning

InitExisting.on_init = function()
    if game.tick == 0 then
        return
    end

    storage.init = {}
    for _, player in pairs(game.players) do
        storage.init[player.index] = true
        if player.physical_surface.name == "nauvis" then
            storage.nauvis_visited = true
        end
    end
    game.print { "", { "lignumis.start-new-game" } }
end

return InitExisting
