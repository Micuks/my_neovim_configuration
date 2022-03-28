return {
  setup = function()
    local map = vim.keymap.set
    local cmd = vim.api.nvim_create_autocmd
    local augroup = vim.api.nvim_create_augroup
    local del_augroup = vim.api.nvim_del_augroup_by_name

    del_augroup "TermMappings"

    augroup("autocomp", {})
    cmd("VimLeave", {
      desc = "Stop running auto compiler",
      group = "autocomp",
      pattern = "*",
      command = "!autocomp %:p stop",
    })

    augroup("mutt", {})
    cmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
      desc = "Treat mutt emails as markdown",
      group = "mutt",
      pattern = "/tmp/neomutt*",
      callback = function()
        vim.bo.filetype = "markdown"
      end,
    })

    augroup("rmd", {})
    cmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
      desc = "Treat rmd as markdown",
      group = "rmd",
      pattern = "*.rmd",
      callback = function()
        vim.bo.filetype = "markdown"
      end,
    })

    augroup("dapui", {})
    cmd("FileType", {
      desc = "Make q close dap floating windows",
      group = "dapui",
      pattern = "dap-float",
      callback = function()
        map("n", "q", "<cmd>close!<cr>")
      end,
    })
  end,
}
