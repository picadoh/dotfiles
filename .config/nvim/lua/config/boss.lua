local boss_mode_enabled = false

function ToggleBossMode()
    if boss_mode_enabled then
        vim.keymap.set({"v","i","n"},"<Left>", "<Left>")
        vim.keymap.set({"v","i","n"},"<Down>", "<Down>")
        vim.keymap.set({"v","i","n"},"<Up>", "<Up>")
        vim.keymap.set({"v","i","n"},"<Right>", "<Right>")
        boss_mode_enabled = false
    else
        vim.keymap.set({"v","i","n"},"<Left>", "<nop>")
        vim.keymap.set({"v","i","n"},"<Down>", "<nop>")
        vim.keymap.set({"v","i","n"},"<Up>", "<nop>")
        vim.keymap.set({"v","i","n"},"<Right>", "<nop>")
        boss_mode_enabled = true
    end
end

vim.api.nvim_create_user_command('ToggleBossMode', ToggleBossMode, {})

