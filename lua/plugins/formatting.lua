-- lua/plugins/formatting.lua
vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- Si quieres que se formatee automáticamente al guardar, descoméntalos aquí:
    local enabled_filetypes = {
      -- c = true,
      cpp = true,
      -- cs = true,
      rust = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then return { timeout_ms = 500 } else return nil end
  end,
  default_format_opts = { lsp_format = 'fallback' },
  -- Añadimos los formateadores correspondientes
  formatters_by_ft = {
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    cs = { 'csharpier' }, -- Csharpier es el estándar moderno de formateo para C#
    rust = { 'rustfmt' },
  },
}
vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
