require("config.remote_clipboard").setup()
-- Add local bin to PATH for fd symlink
vim.env.PATH = vim.fn.stdpath("config") .. "/bin:" .. vim.env.PATH

-- UI Settings
vim.opt.listchars = {
	tab = "  ",
	extends = "❯",
	precedes = "❮",
	nbsp = "␣",
}

-- useful for javascript and python, annoying otherwise
vim.lsp.inlay_hint.enable(false)

-- Clipboard integration for Omarchy (Wayland)
vim.opt.clipboard = "unnamedplus"
if vim.fn.executable("wl-copy") == 1 and vim.fn.executable("wl-paste") == 1 then
	vim.g.clipboard = {
		name = "wl-clipboard",
		copy = {
			["+"] = { "wl-copy", "--type", "text/plain" },
			["*"] = { "wl-copy", "--primary", "--type", "text/plain" },
		},
		paste = {
			["+"] = { "wl-paste", "--no-newline" },
			["*"] = { "wl-paste", "--primary", "--no-newline" },
		},
		cache_enabled = 1,
	}
end
