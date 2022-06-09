local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        events = {"InsertLeave"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 155
    }
)

autosave.hook_before_saving = function ()
    if vim.bo.filetype ~= "rust" then
        vim.g.auto_save_abort = true -- abort saving non rust files
    end
end
