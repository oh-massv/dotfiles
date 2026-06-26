return {
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			options = {
				opt = {
					winborder = "single",
				},
			},
			-- autocmds = {
			-- 	markdown_settings = {
			-- 		{
			-- 			event = "BufRead",
			-- 			pattern = { "*.md", "*.mdx" },
			-- 			command = "set wrap",
			-- 		},
			-- 	},
			-- },
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
