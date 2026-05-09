return {
	"folke/noice.nvim",
	opts = {
		---@type NoiceConfigViews
		views = {
			cmdline_popup = {
				position = {
					row = '50%',
					col = "50%",
				},
				border = {
					style = "single",
				},
			},
			hover = {
				border = {
					style = "single",
				},
			},
		},
	},
}
