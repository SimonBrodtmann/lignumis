data:extend({
    {
        type = "bool-setting",
        name = "lignumis-belt-progression",
        setting_type = "startup",
        default_value = true,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "lignumis-inserter-progression",
        setting_type = "startup",
        default_value = true,
        order = "b"
    },
})

if not mods["wood-military"] then
    data:extend({
        {
            type = "bool-setting",
            name = "lignumis-ammo-progression",
            setting_type = "startup",
            default_value = true,
            order = "c"
        }
    })
end
