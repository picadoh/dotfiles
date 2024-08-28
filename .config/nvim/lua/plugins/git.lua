return {
    {
        "lewis6991/gitsigns.nvim",
        commit = "562dc47189ad3c8696dbf460d38603a74d544849",
        config = function()
            require("gitsigns").setup {
                on_attach = function(bufnr)
                    local gitsigns = require("gitsigns")

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map("n", "<leader>hs", gitsigns.stage_hunk)
                    map("n", "<leader>hr", gitsigns.reset_hunk)
                    map("v", "<leader>hs", function()
                        gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
                    end)
                    map("v", "<leader>hr", function()
                        gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
                    end)
                    map("n", "<leader>hS", gitsigns.stage_buffer)
                    map("n", "<leader>hu", gitsigns.undo_stage_hunk)
                    map("n", "<leader>hR", gitsigns.reset_buffer)
                    map("n", "<leader>hp", gitsigns.preview_hunk)
                    map("n", "<leader>hb", function() gitsigns.blame_line { full = true } end)
                    map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
                    map("n", "<leader>hd", gitsigns.diffthis)
                    map("n", "<leader>hD", function() gitsigns.diffthis("~") end)
                    map("n", "<leader>td", gitsigns.toggle_deleted)

                    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
                end
            }
        end
    },
    {
        "tpope/vim-fugitive",
        commit = "0444df68cd1cdabc7453d6bd84099458327e5513",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiff)
            vim.keymap.set("n", "<leader>go", function()
                local branch = vim.fn.systemlist("git symbolic-ref --short HEAD")[1]

                if branch == "" then
                    branch = "master"
                end

                vim.cmd("Gvdiff origin/" .. branch)
            end)
            vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
        end
    }
}
