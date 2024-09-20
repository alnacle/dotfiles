-- Silent keymap option
local opts = { silent = true, noremap = true }

vim.keymap.set('n', '<leader>e', '<esc>:qall!<cr>', {desc = 'Quit'})
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
vim.keymap.set('n', '<leader>i', ':set list!<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>v', ':vsp<cr>')
vim.keymap.set('n', '<leader>h', ':sp<cr>')
vim.keymap.set('n', '<leader>c', ':<esc><c-w>q<cr>')
vim.keymap.set('n', '<leader>x', ':enew<bar>bd #<cr>')
vim.keymap.set('n', '<leader>r', '<C-W>w')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

vim.keymap.set('n', '<tab>', ':bn<cr>')
vim.keymap.set('n', '<s-tab>', ':bp<cr>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Neotree
vim.keymap.set('n', '<leader>t', '<cmd>Neotree toggle position=float reveal<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>Neotree source=git_status position=float<cr>')

-- Telescope
vim.keymap.set('n', "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set('n', "<leader>ft", "<cmd>Telescope live_grep<CR>", { desc = "Find a string" })
vim.keymap.set('n', "<leader>fg", "<cmd>Telescope git_branches<CR>", { desc = "Checkout branch" })
vim.keymap.set('n', "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffer" })

-- Gitsigns
vim.keymap.set('n', "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
