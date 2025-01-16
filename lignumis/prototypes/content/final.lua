-- Override science packs in final fixes in the case other mods add their science packs to all labs in a generic way
data.raw.lab["wood-lab"].inputs = {
    "wood-science-pack",
    "steam-science-pack",
    "automation-science-pack",
    "logistic-science-pack"
}