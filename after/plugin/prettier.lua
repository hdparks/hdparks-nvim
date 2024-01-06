local prettier = require("prettier")
prettier.setup{
	bin="prettierd",
	filetypes={
		"css",
		"javascript",
		"javascriptvue",
		"typescript",
		"typescriptvue",
		"json",
		"scss",
		"html"
	}
}
