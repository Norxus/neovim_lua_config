function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
    vim.cmd.highlight({"Visual","guibg=darkBlue"})

    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})

end 

ColorMyPencils()
