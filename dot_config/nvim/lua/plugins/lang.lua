local astro_ts_plugin = vim.fn.stdpath("data")
	.. "/mason/packages/astro-language-server/node_modules/@astrojs/ts-plugin"

return {
	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			config = {
				vtsls = {
					settings = {
						vtsls = {
							tsserver = {
								globalPlugins = {
									{
										name = "@astrojs/ts-plugin",
										location = astro_ts_plugin,
										enableForWorkspaceTypeScriptVersions = true,
									},
								},
							},
						},
					},
				},
				tailwindcss = {
					settings = {
						tailwindCSS = {
							experimental = {
								classRegex = {
									{ "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
								},
							},
						},
					},
				},
				cssls = {
					settings = {
						css = {
							lint = {
								unknownAtRules = "ignore",
							},
						},
					},
				},
			},
		},
	},
}
