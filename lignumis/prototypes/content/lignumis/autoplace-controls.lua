local resource_autoplace = require("resource-autoplace")

resource_autoplace.initialize_patch_set("lignumis_gold", true)
resource_autoplace.initialize_patch_set("lignumis_peat", true)

data:extend({
    {
        type = "autoplace-control",
        name = "lignumis_gold",
        localised_name = {"", "[entity=gold-patch] ", {"entity-name.gold-patch"}},
        richness = true,
        order = "0-b",
        category = "resource"
    },
    {
        type = "autoplace-control",
        name = "lignumis_peat",
        localised_name = {"", "[entity=peat] ", {"entity-name.peat"}},
        richness = true,
        order = "0-c",
        category = "resource"
    }
})