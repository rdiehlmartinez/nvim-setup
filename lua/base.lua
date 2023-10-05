vim.cmd("autocmd!") 
vim.cmd('autocmd BufWritePost * echo "File Saved"')

vim.scriptencoding = "utf-8" 
vim.opt.encoding = "utf-8" 
vim.opt.fileencoding = "utf-8" 

vim.opt.title = true 

-- search related options 
vim.opt.smarttab = true 
vim.opt.breakindent = true 
vim.opt.tabstop = 2
vim.opt.autoindent = true 
vim.opt.hlsearch = true 
vim.opt.ignorecase = true 
vim.opt.smartcase = true 

vim.opt.path:append { '**' } -- Find files; search down into subfolder 
vim.opt.wildignore:append { '*/node_modules/*' }

-- indentation related options
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.ai = true 
vim.opt.si = true 
vim.opt.wrap = false 

vim.opt.backspace = "indent,eol,start"
vim.opt.iskeyword:append ("-")

vim.wo.number = true

-- clipboard 
vim.opt.clipboard:append ("unnamedplus")

-- formats comments nicely 
vim.opt.formatoptions:append { 'r'}

-- keymaps
vim.g.mapleader = " " -- space is the leader
local keymap = vim.keymap
keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })
keymap.set('n', 'x', '"_x', { noremap = true, silent = true })

keymap.set('n', '<leader>sv', '<C-w>v')
keymap.set('n', '<leader>sh', '<C-w>s')
keymap.set('n', '<leader>se', '<C-w>=')
keymap.set('n', '<leader>sx', ':close<CR>')

keymap.set('n', '<leader>to', ':tabnew<CR>')
keymap.set('n', '<leader>tx', ':tabclose<CR>')
keymap.set('n', '<leader>tn', ':tabn<CR>')
keymap.set('n', '<leader>tp', ':tabp<CR>')

-- plugin keymaps 

keymap.set("n", '<leader>sm', ':MaximizerToggle<CR>')

keymap.set("n", '<leader>e', ':NvimTreeToggle<CR>')

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")-- list available help tags
