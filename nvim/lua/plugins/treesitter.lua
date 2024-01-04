return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"html",
				"css",
				"python",
				"rust",
				"json",
				"markdown",
				"go",
			},
		}
	},
}
