require("jorgen.set") -- set file
require("jorgen.remap") -- remap file


--require("mason").setup() -- requires mason which is needed to install and update LSP servers

--require('onedark').setup { -- color theme
  --  style = 'darker'
--}
--require('onedark').load()

-- print fish twice


vim.api.nvim_create_augroup("rainbow", {
  clear = true,
})
vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "rainbowcol1", {
      bold = true,
      fg = "#c678dd",
    })
  end,
  group = "rainbow",
})


-- set commentstring to // for c and c++ files
vim.cmd [[autocmd FileType c,cpp setlocal commentstring=//\ %s]]
