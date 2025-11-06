return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = { ".git", "requirements.txt", "pyproject.toml" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
}
