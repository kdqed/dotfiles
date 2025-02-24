-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"
local lsp = require "plugins.lsp"
local lspconfig = require "plugins.lsp.config"

------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.mariappa")

--------------------------- Key bindings -------------------------------------

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }

-- pass 'true' for second parameter to overwrite an existing binding
-- keymap.add({ ["ctrl+pageup"] = "root:switch-to-previous-tab" }, true)
-- keymap.add({ ["ctrl+pagedown"] = "root:switch-to-next-tab" }, true)

------------------------------- Fonts ----------------------------------------

-- customize fonts:
style.font = renderer.font.load(USERDIR .. "/fonts/FiraCodeNerdFontMono-Retina.ttf", 14 * SCALE)
-- style.icon_font = renderer.font.load(USERDIR .. "/fonts/FiraCodeNerdFontMono-Retina.ttf", 14 * SCALE)
style.code_font = renderer.font.load(USERDIR .. "/fonts/FiraCodeNerdFontMono-Retina.ttf", 15 * SCALE)
config.line_height = 1.9
--
-- DATADIR is the location of the installed Lite XL Lua code, default color
-- schemes and fonts.
-- USERDIR is the location of the Lite XL configuration directory.
--
-- font names used by lite:
-- style.font          : "Jost"
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
--
-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full", bold=true, italic=true, underline=true, smoothing=true, strikethrough=true}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full
-- bold: true, false
-- italic: true, false
-- underline: true, false
-- smoothing: true, false
-- strikethrough: true, false

------------------------------ Plugins ----------------------------------------

-- disable plugin loading setting config entries:

-- disable plugin detectindent, otherwise it is enabled by default:
-- config.plugins.detectindent = false

---------------------------- Miscellaneous -------------------------------------

-- hide status bar:
core.status_view:hide()
core.status_view:display_messages(false)

-- custom keybindings:
keymap.add({["alt+down"] = "doc:move-lines-down"})
keymap.add({["alt+up"] = "doc:move-lines-up"})

-- LSPs:
lsp.add_server {
  name = "pylsp",
  language = "python",
  file_patterns = { "%.py$" },
  command = { '/home/kd/.venv/bin/pylsp' },
  verbose = false
}
-- lspconfig.sumneko_lua.setup()

-- modify list of files to ignore when indexing the project:
-- config.ignore_files = {
--   -- folders
--   "^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
--   "^node_modules/", "^%.cache/", "^__pycache__/",
--   -- files
--   "%.pyc$",         "%.pyo$",       "%.exe$",        "%.dll$",   "%.obj$", "%.o$",
--   "%.a$",           "%.lib$",       "%.so$",         "%.dylib$", "%.ncb$", "%.sdf$",
--   "%.suo$",         "%.pdb$",       "%.idb$",        "%.class$", "%.psd$", "%.db$",
--   "^desktop%.ini$", "^%.DS_Store$", "^%.directory$",
-- }

