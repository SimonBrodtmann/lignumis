local handler = require("event_handler")
gui = require("__flib__/gui")

handler.add_libraries({
    require("scripts/init-existing"),
    require("scripts/init-new"),
    require("scripts/init"),
    require("scripts/to-nauvis"),
    require("scripts/wooden-rocket-silo")
})


