-- Silent keymap option
--local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<leader>e", "<esc>:qall!<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<Enter>", "<C-o>")

vim.keymap.set("n", "<CR>", "gf")

-- Panes
vim.keymap.set("n", "<leader>v", ":vsp<cr>")
vim.keymap.set("n", "<leader>h", ":sp<cr>")
vim.keymap.set("n", "<leader>c", ":<esc><c-w>q<cr>")
vim.keymap.set("n", "<leader>r", "<C-W>w")

-- barbar
vim.keymap.set("n", "<tab>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<s-tab>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<leader>x", "<Cmd>BufferClose<CR>")

-- Neotree
vim.keymap.set("n", "<leader>t", "<cmd>Neotree toggle position=float reveal<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>Neotree source=git_status position=float<cr>")

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find a string" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffer" })

-- Gitsigns
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")


-- LSP
local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definition

   opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts) -- jump to previous diagnostic in buffer
    --
    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})

