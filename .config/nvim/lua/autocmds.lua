-- This file sets various autocmds


-- Render R Markdown on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.Rmd",
  callback = function()
    local file = vim.fn.expand("%:p")
    local cmd = "Rscript -e \"rmarkdown::render('" .. file .. "')\""
    local result = vim.fn.system(cmd)
    if vim.v.shell_error ~= 0 then
      print("Error: Failed to render " .. file)
    end
  end,
})
