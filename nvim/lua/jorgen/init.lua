require("jorgen.set")
require("jorgen.remap")

-- loads and installs lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--require("lazy").setup("plugins")

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
--  install = {
--    colorscheme = { "nightfly" },
--  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
--require("lazy").setup("plugins", "plugins.lsp")
--require("lazy").setup({{import = "plugins", import = "plugins.lsp"}})


