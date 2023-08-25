-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
    return
end

saga.setup({
    -- keybinds for navigation in lspsaga window
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    -- use enter to open file with definition preview
    finder = { 
        keys = { 
            shuttle = "<leader>n",
            toggle_or_open = "<CR>"
        }
    },
    definition = {
        edit = "<CR>",
    },
    ui = {
        colors = {
            normal_bg = "#022746",
        },
    },
})
