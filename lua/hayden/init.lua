require("hayden.remap")
require("hayden.packer")
require("hayden.editorconfig")

vim.filetype.add({
	extension = {
		vert = "glsl",
		tesc = "glsl",
		tese = "glsl",
		frag = "glsl",
		geom = "glsl",
		comp = "glsl",
	}
})
