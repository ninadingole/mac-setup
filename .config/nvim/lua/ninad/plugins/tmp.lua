return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = { "neotest-plenary", "neotest-go" },
		},
	},
	{
		"folke/flash.nvim",
		enabled = true,
		init = function()
			-- vim.keymap.set("n", "x", "<cmd>lua require('flash').jump()<cr>")
			-- vim.opt.keymap = "emoji"
		end,
		---@type Flash.Config
		opts = {
			-- labels = "#abcdef",
			modes = {
				-- char = { jump_labels = false },
				-- treesitter = {
				--   label = {
				--     rainbow = { enabled = true },
				--   },
				-- },
				treesitter_search = {
					label = {
						rainbow = { enabled = true },
						-- format = function(opts)
						--   local label = opts.match.label
						--   if opts.after then
						--     label = label .. ">"
						--   else
						--     label = "<" .. label
						--   end
						--   return { { label, opts.hl_group } }
						-- end,
					},
				},
			},
			-- search = { mode = "fuzzy" },
			-- labels = "😅😀🏇🐎🐴🐵🐒",
		},
	},
}
