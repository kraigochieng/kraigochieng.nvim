require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'typescript', 'javascript', 'lua', 'python', 'xml', 'html', 'java', 'yaml' },
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
