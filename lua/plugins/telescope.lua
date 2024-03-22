return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",

	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "smartpde/telescope-recent-files" },
	},

	config = function()
		local builtin = require("telescope.builtin")
		require("telescope").load_extension("live_grep_args")
		require("telescope").load_extension("recent_files")

		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	end,
}
