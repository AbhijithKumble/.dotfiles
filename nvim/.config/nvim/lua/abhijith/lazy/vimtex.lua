return {
  "lervag/vimtex",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    -- VimTeX Settings
    vim.g.vimtex_view_method = "zathura"     -- Use Zathura as the PDF viewer
    vim.g.vimtex_compiler_method = "latexmk" -- Use latexmk for compilation
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",                   -- Store output files in a build directory
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-outdir=build", -- Ensure latexmk outputs to the 'build' directory
      },
    }

    -- Keybindings for VimTeX
    vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX document" })

    -- Open PDF using zathura from the build directory
    vim.keymap.set("n", "<leader>lv", function()
      local filename = vim.fn.expand('%:t:r') -- Get the base name of the current file (without extension)
      vim.cmd("!zathura build/" .. filename .. ".pdf &")
    end, { desc = "Open PDF viewer" })

    -- Clean the build directory
    vim.keymap.set("n", "<leader>lc", function()
      vim.cmd("!rm -rf build/*") -- Clean all files in the build directory
      vim.cmd("VimtexClean")     -- Clean any remaining auxiliary files
    end, { desc = "Clean build files" })

    -- Auto commands for VimTeX-specific settings
    local abhijith_vimtex = vim.api.nvim_create_augroup("abhijith_vimtex", {})
    local autocmd = vim.api.nvim_create_autocmd
    autocmd("FileType", {
      group = abhijith_vimtex,
      pattern = "tex",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        -- Quick build
        vim.keymap.set("n", "<leader>lb", function()
          vim.cmd.VimtexCompile()
        end, opts)

        -- Forward search
        vim.keymap.set("n", "<leader>lf", function()
          vim.cmd.VimtexView()
        end, opts)

        -- Clean auxiliary files and build directory
        vim.keymap.set("n", "<leader>lx", function()
          vim.cmd("!rm -rf build/*") -- Clean all files in the build directory
          vim.cmd("VimtexClean")     -- Clean any remaining auxiliary files
        end, opts)
      end,
    })
  end,
}

