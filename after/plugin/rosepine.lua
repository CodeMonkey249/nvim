require("rose-pine").setup({
	dark_variant = moon,
	color = color or "rose-pine",
	vim.cmd.colorscheme(color),
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" }),
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }),
	styles = {
		--bold = true,
		italic = false,
		--transparency = false,
	}
})

vim.cmd("colorscheme rose-pine")
vim.cmd("lua ColorMyPencils()")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
