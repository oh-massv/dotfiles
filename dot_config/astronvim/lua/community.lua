-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	{ import = "astrocommunity.bars-and-lines.dropbar-nvim" },

	{ import = "astrocommunity.color.nvim-highlight-colors" },

	{ import = "astrocommunity.completion.supermaven-nvim" },

	{ import = "astrocommunity.icon.mini-icons" },

	{ import = "astrocommunity.pack.astro" },
	{ import = "astrocommunity.pack.chezmoi" },
	{ import = "astrocommunity.pack.docker" },
	{ import = "astrocommunity.pack.eslint" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.mdx" },
	{ import = "astrocommunity.pack.php" },
	{ import = "astrocommunity.pack.prettier" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.svelte" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.wgsl" },
	{ import = "astrocommunity.pack.xml" },
	{ import = "astrocommunity.pack.yaml" },

	{ import = "astrocommunity.recipes.ai" },
	{ import = "astrocommunity.recipes.disable-tabline" },
	{ import = "astrocommunity.recipes.vscode-icons" },

	{ import = "astrocommunity.utility.noice-nvim" },
}
