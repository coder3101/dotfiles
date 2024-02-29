local llm = require('llm')

llm.setup({
    api_token = nil,                             -- cf Install paragraph
    model = "starcoder",                         -- the model ID, behavior depends on backend
    backend = "ollama",                          -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
    url = "http://localhost:11434/api/generate", -- the http url of the backend
    tokens_to_clear = { "<|endoftext|>" },       -- tokens to remove from the model's output
    -- parameters that are added to the request body, values are arbitrary, you can set any field:value pair here it will be passed as is to the backend
    request_body = {
        parameters = {
            temperature = 0.2,
            top_p = 0.95,
        },
    },
    -- set this if the model supports fill in the middle
    fim = {
        enabled = true,
        prefix = "<fim_prefix>",
        middle = "<fim_middle>",
        suffix = "<fim_suffix>",
    },
    debounce_ms = 1000,
    tls_skip_verify_insecure = false,
    -- llm-ls configuration, cf llm-ls section
    tokenizer = nil,                   -- cf Tokenizer paragraph
    context_window = 8192,             -- max number of tokens for the context window
    enable_suggestions_on_startup = true,
    enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
})
