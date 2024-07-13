return {
    settings = {
        texlab = {
            latexFormatter = "latexindent",
            latexindent = {
                modifyLineBreaks = true,
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false,
            },
            diagnosticsDelay = 300,
            build = {
                onSave = false,
                args = {
                    "-pdf",
                    "-interaction=nonstopmode",
                    "-synctex=1",
                    "%f"
                },
                executable = "pdflatex",
                forwardSearchAfter = false,
            },
            formatterLineLength = 80,
            bibtexFormatter = "texlab",
        },
    },
}
