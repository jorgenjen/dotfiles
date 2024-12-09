-- TODO make it work with the smooth scrolling currnetly it has visual bug but is sorted after animation scroll is done
-- just a minor annoyance
return{
  'petertriho/nvim-scrollbar',
  config = function ()
    require("scrollbar").setup({
      handlers = {
        cursor = false,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
      },
    })
  end
}
