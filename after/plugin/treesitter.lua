require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'typescript', 'javascript', 'lua', 'python', 'xml', 'html', 'java', 'yaml' },
    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false
    },
    indent = {
        enable = true,
    },
    sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
    context_commentstring = {
        enable = true
    }
}
