return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "clangd", -- C
--        "biome", -- JAvascript, json, typescript
        "tsserver", -- Typesc, Javascript
        "cssls", -- css

        -- does not attach to java files for some reason
--        "jdtls", -- java
--        "java_language_server",


--        "tsserver", -- typescript server
--        "html", -- html
--        "cssls", -- css
--        "tailwindcss", -- 
--        "svelte", -- Svelte
--        "lua_ls", -- lua
--        "emmet_ls", -- web dev snippets
--        "pyright", -- python
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

  end,
}
