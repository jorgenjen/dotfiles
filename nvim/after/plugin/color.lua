-- After every :PackerSync, you need to run :lua ColorMyPencils() to get transparent background

function ColorMyPencils(colour)
    color = color or "onedark"
    vim.cmd.colorscheme(color)
 
    
    -- remove all background colors
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "none"})
end

ColorMyPencils()
