return {
	"huggingface/llm.nvim",
	enabled = false,
	opts = {
		api_token = nil,
		backend = "ollama",
		model = "starcoder2:3b",
		url = "http://localhost:11434/api/generate",
		tokens_to_clear = { "<|endoftext|>" },
		fim = {
			enabled = true,
			prefix = "<fim_prefix>",
			middle = "<fim_middle>",
			suffix = "<fim_suffix>",
		},
		debounce_ms = 1000,
		accept_keymap = "<C-y>",
		dismiss_keymap = "<C-x>",
		tls_skip_verify_insecure = false,
		tokenizer = nil, -- cf Tokenizer paragraph
		context_window = 8192, -- max number of tokens for the context window
		enable_suggestions_on_startup = true,
		enable_suggestions_on_files = "*",
	},
}
