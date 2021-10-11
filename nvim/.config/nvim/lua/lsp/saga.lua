local saga = require 'lspsaga'
-- saga.init_lsp_saga()
saga.init_lsp_saga {
    use_saga_diagnostic_sign = false,
    error_sign = 'E',
    warn_sign = 'W',
    hint_sign = 'H',
    infor_sign = 'I',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
    },
    max_preview_lines = 15,
    finder_action_keys = {
      open = 'o', vsplit = 's',split = 'i',quit = '<esc>', scroll_down = '<leader><rj>', scroll_up = '<leader><rk>' -- quit can be a table
    },
    code_action_keys = {
      quit = 'q',exec = '<CR>'
    },
    rename_action_keys = {
      quit = 'q',exec = '<CR>'  -- quit can be a table
    },
    border_style = "round",
}
