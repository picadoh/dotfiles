return {
    {
        "tpope/vim-dadbod",
    },
    {
        "kristijanhusak/vim-dadbod-completion",
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        config = function()
            vim.g.db_ui_tmp_query_location = os.getenv("HOME") .. "/.dadbod/queries"
            vim.g.db_ui_execute_on_save = 0
        end
    },
}
