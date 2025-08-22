vim.api.nvim_create_user_command('Json', function() vim.cmd(":%!jq") end, {})
vim.api.nvim_create_user_command('Yaml', function() vim.cmd(":%!yq") end, {})
