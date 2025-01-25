Lignumis = {
    -- A technology having any of these science packs as ingredient will get wood and steam science packs added
    science_pack_whitelist = { "utility-science-pack", "production-science-pack", "space-science-pack" },

    -- A technology is skipped if it has any of these as ingredient
    science_pack_blacklist = {
        "wood-science-pack", "steam-science-pack", -- Lignumis
        "nanite-science-pack", "quantum-science-pack", "ring-science-pack", -- Metal and Stars
        "cerys-science-pack" -- Cerys
    },

    -- These technologies are skipped even if they are matches according to above lists
    science_blacklist = {
        "deep-miner",
        "logistic-system",
        "space-platform-thruster",
        "kovarex-enrichment-process",
        "astroponics"
    },

    -- Add wood and steam science packs to all labs' inputs except these
    lab_blacklist = {
        "wood-lab", -- Lignumis
        "cerys-lab" -- Cerys
    }
}

require("__cf-lib__/util")

require("prototypes/content/data")
require("prototypes/integrations/data")
require("prototypes/compatibility/data")