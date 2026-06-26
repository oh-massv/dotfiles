return {
	"AstroNvim/astrocore",
	init = function()
		vim.filetype.add({
			pattern = {
				[".*/tmux/conf/.*%.conf"] = "tmux",
			},
		})
	end,
}
