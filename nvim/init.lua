vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins")
require("options")
require("keymaps")
require("lsp_config")
require("nvim_tree")
vim.cmd("colorscheme gotham256")
