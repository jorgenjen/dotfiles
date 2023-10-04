return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-emoji",  -- might not need this one trying to get supertab to work 
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")


    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    --
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
--        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
--        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        -- use the arrow up and down to go between options
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll down
        ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll up
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "copilot", group_index = 2}, -- copilot suggestions
        { name = "nvim_lsp", group_index = 2}, -- recomendations from language servers
        { name = "luasnip", group_index = 2}, -- snippets
        { name = "buffer", group_index = 2}, -- text within current buffer
        { name = "path", group_index = 2}, -- file system paths
      }),


            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    -- max_width = 50,
                    symbol_map = { Copilot = "" }
                })
            },

            -- sorts the order of suggestions
            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,

                    -- Below is the default comparitor list and order for nvim-cmp
                    cmp.config.compare.offset,
                    -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

      -- configure lspkind for vs-code like pictograms in completion menu
    })
  end,
}
