
require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
            icon_preset = "diamond"
            }
        }, -- Adds pretty icons to your documents
        ["core.pivot"] = {}, -- Toggle list types with <LLeader>lt or <LLeader>li
        ["core.export"] = {}, -- Export to other formats
        ["core.summary"] = {}, -- Generates a summary of a Workspace
        ["core.itero"] = {}, -- When you press alt+enter it repeats the type on this line
        ["core.promo"] = {}, -- Indent and Detent with <C-t> <C-d>
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    proj = "/Users/kmcbride/notes/proj",
                    area = "/Users/kmcbride/notes/area",
                    arch = "/Users/kmcbride/notes/arch",
                    res = "/Users/kmcbride/notes/res",
                },
                default_workspace = "proj",
            },
        },
    },
}
