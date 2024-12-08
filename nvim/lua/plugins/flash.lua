return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        jump_labels = true
        }
    }
  },
  -- stylua: ignore
  keys = {
--    { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      {"s", mode = { "n", "o", "x" }, function() require("flash").jump({
            search = {
                mode = function(str)
                    return "\\<" .. str
                end,
            },
        })
        end, desc = "Flash -- only for beginning of words"},
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter -- visual select blocks" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
