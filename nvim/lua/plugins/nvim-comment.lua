return {
    "terrortylor/nvim-comment",
    event = "VeryLazy",
    config = function ()
        require("nvim_comment").setup()
        vim.keymap.set("n", "<leader>l", ":CommentToggle<CR>")
        vim.keymap.set("v", "<leader>l", ":CommentToggle<CR>")

        -- add commentstring for openscad
        vim.cmd("autocmd FileType openscad setlocal commentstring=//\\ %s")
    end
}
