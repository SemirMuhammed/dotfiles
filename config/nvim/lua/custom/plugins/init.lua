-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local startify = require("alpha.themes.startify")
			-- available: devicons, mini, default is mini
			-- if provider not loaded and enabled is true, it will try to use another provider
			startify.file_icons.provider = "devicons"
			require("alpha").setup(startify.config)
		end,
	},
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {
			-- your config goes here
			-- or just leave it empty :)
			condition = function(buf)
				local filetype = vim.fn.getbufvar(buf, "&filetype")

				-- don't save for `sql` file types
				if vim.list_contains({ "lua", "css" }, filetype) then
					return false
				end
				return true
			end,
		},
		keys = {
			{ "<leader>n", ":ASToggle<CR>", desc = "Toggle auto-save" },
			{ "<leader>a", ":Alpha<CR>", desc = "Open D[a]shboard" },
		},
	},
	-- {
	-- 	"epwalsh/obsidian.nvim",
	-- 	version = "*", -- recommended, use latest release instead of latest commit
	-- 	lazy = true,
	-- 	ft = "markdown",
	-- 	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- 	-- event = {
	-- 	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	-- 	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	-- 	--   -- refer to `:h file-pattern` for more examples
	-- 	--   "BufReadPre path/to/my-vault/*.md",
	-- 	--   "BufNewFile path/to/my-vault/*.md",
	-- 	-- },
	-- 	dependencies = {
	-- 		-- Required.
	-- 		"nvim-lua/plenary.nvim",
	--
	-- 		-- see below for full list of optional dependencies 👇
	-- 	},
	-- 	opts = {
	-- 		workspaces = {
	-- 			{
	-- 				name = "personal",
	-- 				path = "~/vaults/personal",
	-- 			},
	-- 			{
	-- 				name = "work",
	-- 				path = "~/vaults/work",
	-- 			},
	-- 		},
	--
	-- 		-- see below for full list of options 👇
	-- 	},
	-- },
	-- {
	-- 	"brianhuster/live-preview.nvim",
	-- 	dependencies = {
	-- 		"brianhuster/autosave.nvim", -- Not required, but recomended for autosaving and sync scrolling
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- 	opts = {
	-- 		cmd = "Live",
	-- 		port = 5500,
	-- 		autokill = true,
	-- 		browser = "google-chrome-stable",
	-- 		dynamic_root = false,
	-- 		sync_scroll = true,
	-- 		picker = "telescope", --default nil
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>l", ":Live start<CR>", desc = "Toggle live-server" },
	-- 	},
	-- },
	{
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
		end,
	},
	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = {
			args = { "--browser=google-chrome-stable" },
		},
		keys = {
			{ "<leader>l", ":LiveServerToggle<CR>", desc = "Toggle Live-server" },
			-- { "<leader>ll", ":LiveServerStart", desc = "Start the live server" },
			-- { "<leader>ls", ":LiveServerStop", desc = "Stop the live server" },
		},
	},
}
