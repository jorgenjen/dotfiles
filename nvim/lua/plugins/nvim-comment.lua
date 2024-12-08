return {
    "terrortylor/nvim-comment",
    event = "VeryLazy",
    config = function ()
        require("nvim_comment").setup()
        -- silent = true to avoid cmd line to pop up
        vim.keymap.set("v", "<leader>l", ":CommentToggle<CR>", {silent = true, desc="Toggle commment"})
        vim.keymap.set("n", "<leader>l", "<cmd>CommentToggle<CR>", {silent = true, desc="Toggle commment"}) -- not needed for this one as it uses <cmd>

        -- add commentstring for openscad
        vim.cmd("autocmd FileType openscad setlocal commentstring=//\\ %s")

        -- add commentstring for cuda .cu files
        vim.cmd("autocmd FileType cuda setlocal commentstring=//\\ %s")

        -- change comment string for c
        vim.cmd("autocmd FileType c setlocal commentstring=//\\ %s")

        -- change comment string for c++
        vim.cmd("autocmd FileType cpp setlocal commentstring=//\\ %s")
    end
}
