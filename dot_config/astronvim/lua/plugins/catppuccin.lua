return {
	{
		"AstroNvim/astroui",
		---@type AstroUIOpts
		opts = {
			colorscheme = "catppuccin-nvim",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		---@type CatppuccinOptions
		---@diagnostic disable: missing-fields
		opts = {
			flavour = "mocha",
			transparent_background = true,
			float = {
				transparent = true,
				solid = true,
			},
			term_colors = true,
			styles = {
				-- ref: https://github.com/ayamir/nvimdots/blob/f6584ad6e148bebe47a8e66b30dbbee411d76fbc/lua/modules/configs/ui/catppuccin.lua
				comments = {},
				conditionals = { "bold" },
				loops = { "bold" },
				functions = { "bold" },
				keywords = { "italic" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = { "bold", "italic" },
				properties = {},
				types = {},
				operators = { "bold" },
			},
			auto_integrations = true,
      integrations = {
        snacks = {
          indent_scope_color = "mauve",
        },
      },
		},
	},
}
