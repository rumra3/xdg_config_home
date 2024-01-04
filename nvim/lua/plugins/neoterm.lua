return {
{
	"itmecho/neoterm.nvim",
	opts = {
		clear_on_run = true,
		mode = "horizontal",
		noinsert = false
	},
	config = function(_, opts)
		require("neoterm").setup(opts)
	end
}
}
