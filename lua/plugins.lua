local plugins = {
  -- Load LSP and none-ls first
  require("plugins.lsp-config"),
  require("plugins.none-ls"),
  
  -- Then load the rest of the plugins
  require("plugins.completions"),
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.neo-tree"),
  require("plugins.lua-line"),
  require("plugins.alpha"),
  require("plugins.autoclose"),
  require("plugins.avante"),
  require("plugins.catppuccin"),
}

return plugins
