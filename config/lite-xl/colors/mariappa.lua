local style = require "core.style"
local common = require "core.common"

style.background = { common.color "#1d2228" }  -- Docview
style.background2 = { common.color "#1d2228" } -- Treeview
style.background3 = { common.color "#1d2228" } -- Command view
style.text = { common.color "#b8ddf5" } -- default text color
style.caret = { common.color "#b8ddf5" }
style.accent = { common.color "#ebf6ff" } -- Treeview hovered item
-- style.dim - text color for nonactive tabs, tabs divider, prefix in log and
-- search result, hotkeys for context menu and command view
style.dim = { common.color "#2f3741" }
style.divider = { common.color "#1d2228" } -- Line between nodes
style.selection = { common.color "#2f3741" }
style.line_number = { common.color "#2f3741" }
style.line_number2 = { common.color "#2f3741" } -- With cursor
style.line_highlight = { common.color "#1d2228" }
style.scrollbar = { common.color "#2f3741" }
style.scrollbar2 = { common.color "#2f3741" } -- Hovered
style.scrollbar_track = { common.color "#1d2228" }
style.nagbar = { common.color "#a66663" }
style.nagbar_text = { common.color "#ebf6ff" }
style.nagbar_dim = { common.color "#a66663c0" }
style.drag_overlay = { common.color "#ebf6ff10" }
style.drag_overlay_tab = { common.color "#5cb9cc" }
style.good = { common.color "#699669" }
style.warn = { common.color "#bfbf75" }
style.error = { common.color "#a66663" }
style.modified = { common.color "#6991bf" }

style.syntax["normal"] = { common.color "#b8ddf5" }
style.syntax["symbol"] = { common.color "#b8ddf5" } -- object's property, class name
style.syntax["comment"] = { common.color "#67788e" }
style.syntax["keyword"] = { common.color "#6991bf" }  -- local function end if case namespace use const
style.syntax["keyword2"] = { common.color "#a66663" } --  self int float, function parameter, function variable, class property
style.syntax["number"] = { common.color "#699669" } -- numeric value, const name, null
style.syntax["literal"] = { common.color "#a177a1" }  -- true false nil
style.syntax["string"] = { common.color "#bfbf75" }
style.syntax["operator"] = { common.color "#cce8ff" } -- = + - / < >
style.syntax["function"] = { common.color "#5cb9cc" }

style.log["INFO"]  = { icon = "i", color = style.text }
style.log["WARN"]  = { icon = "!", color = style.warn }
style.log["ERROR"] = { icon = "!", color = style.error }
