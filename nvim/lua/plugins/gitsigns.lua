return {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
        -- See `:help gitsigns.txt`
        signs = {
            add          = { text = "▎" },
            change       = { text = "▎" },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl` -- color lines according to git status
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            follow_files = true
        },
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 0,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
        -- field is now invalid for somereason
        -- yadm = {
        --     enable = false
        -- },
  },

  config = function (_, opts)
    require('gitsigns').setup{opts,
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts_inner)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts_inner)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)



        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, {desc = "Stage hunk"})
        map('n', '<leader>hr', gitsigns.reset_hunk, {desc = "Reset hunk"})
        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Stage hunk"})
        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Reset hunk"})
        map('n', '<leader>hS', gitsigns.stage_buffer, {desc = "Stage buffer"})
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, {desc = "Undo stage hunk"})
        map('n', '<leader>hR', gitsigns.reset_buffer, {desc = "Reset buffer"})
        map('n', '<leader>hp', gitsigns.preview_hunk, {desc = "Preview hunk"})
        map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, {desc = "Turn on git blame for line"})
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, {desc = "Toggle git blame for current line"})
        map('n', '<leader>hd', gitsigns.diffthis, {desc = "Show hunk diff"})
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end, {desc = "Show hunk diff (Not sure how it's different)"})
        map('n', '<leader>td', gitsigns.toggle_deleted, {desc = "Toggle deleted (IDK what that does)"})
      end
    }


    -- require("scrollbar.handlers.gitsigns")
  end
}
