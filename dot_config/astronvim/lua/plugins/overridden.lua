return {
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			-- autocmds = {
			-- 	tmux = {
			-- 		{
			-- 			event = { "BufNewFile", "BufRead" },
			-- 			pattern = "*.tmux",
			-- 			callback = function()
			-- 				vim.bo.filetype = "tmux"
			-- 			end,
			-- 			once = false,
			-- 		},
			-- 	},
			-- },
			options = {
				opt = {
					winborder = "single",
				},
			},
		},
	},
	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			features = {
				codelens = false,
			},
			formatting = {
				-- control auto formatting on save
				format_on_save = {
					enabled = false, -- enable or disable format on save globally
				},
			},
		},
	},
}
