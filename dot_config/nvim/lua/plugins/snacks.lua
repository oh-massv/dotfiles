return {
	{ "nvim-neo-tree/neo-tree.nvim", optional = true, enabled = false },
	{
		"folke/snacks.nvim",
		dependencies = {
			"nvim-mini/mini.icons",
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					local maps = opts.mappings or {}
					maps.n["<Leader>e"] = {
						function()
							require("snacks").explorer()
						end,
						desc = "Open Floating Explorer",
					}
					maps.n["<Leader>E"] = {
						function()
							require("snacks").explorer()
						end,
						desc = "Open Sidebar Explorer",
					}
					maps.n["<Leader>gg"] = {
						function()
							require("snacks").lazygit()
						end,
						desc = "Open lazygit",
					}
				end,
			},
		},
		opts = function(_, opts)
			vim.list_extend(opts.dashboard.preset.keys, {
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			})

			opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
				sources = {
					explorer = {
						layout = { preset = "vertical", layout = { height = 0.9 } },
						auto_close = true,
						hidden = true,
						ignored = true,
					},
				},
				toggles = {
					hidden = false,
					ignored = false,
				},
			})
		end,
	},
}
