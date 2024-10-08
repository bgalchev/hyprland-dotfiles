return {

	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-m>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<C-x>", function()
			harpoon:list():select(5)
		end)
		vim.keymap.set("n", "<C-z>", function()
			harpoon:list():select(6)
		end)
	end,
}
