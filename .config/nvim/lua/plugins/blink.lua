return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        opts = {
            enabled = function()
                return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
            end,

            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'hack'
            },

            signature = { enabled = true }
        }
    },
}
