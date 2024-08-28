return {
    {
        "tpope/vim-dadbod",
        commit = "7888cb7164d69783d3dce4e0283decd26b82538b",
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        commit = "880f7e9f2959e567c718d52550f9fae1aa07aa81",
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        commit = "0f51d8de368c8c6220973e8acd156d17da746f4c",
        config = function()
            vim.g.db_ui_tmp_query_location = os.getenv("HOME") .. "/.dadbod/queries"
            vim.g.db_ui_execute_on_save = 0
        end
    },
}
