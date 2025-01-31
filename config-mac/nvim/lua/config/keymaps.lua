vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "<C-x>", "<cmd>bd!<CR>", opts)

-- These must use ':' instead of "<cmd>" because it uses the "move" Ex command
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Keep selection active after indenting in visual mode
vim.api.nvim_set_keymap("v", ">", ">gv", opts)
vim.api.nvim_set_keymap("v", "<", "<gv", opts)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete to void register
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Split movement
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Tab management
vim.keymap.set("n", "_", "<cmd>tabprev<CR>", opts)
vim.keymap.set("n", "+", "<cmd>tabnext<CR>", opts)
vim.keymap.set("n", "<C-x>", "<cmd>tabclose<CR>", opts)
vim.keymap.set("n", "<C-\\>", "<cmd>tabnew<CR>", opts)

-- Quickfix List
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>", opts)
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", opts)
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>", opts)
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>", opts)

-- Change directory
vim.keymap.set('n', '`', function()
    local parent_dir = vim.fn.expand('%:h')
    if parent_dir ~= '' then
        vim.cmd('cd ' .. parent_dir)
        print('Changed directory to: ' .. parent_dir)
    else
        print('No file path found')
    end
end, opts)


-- fzf-lua
vim.keymap.set("n", "<leader>pf", "<CMD>FzfLua files<CR>", opts) -- "project fzf"
vim.keymap.set("n", "<leader>pg", "<CMD>FzfLua live_grep<CR>", opts) -- "project grep"

-- vimgrep in current working directory with short PWD in prompt
vim.keymap.set('n', '<leader>re', function()
    local cwd = vim.fn.getcwd()
    local short_cwd = vim.fn.fnamemodify(cwd, ":~")
    local search_term = vim.fn.input("grep in " .. short_cwd .. ": ")
    if search_term ~= "" then
        local cmd = string.format('vimgrep /%s/g %s/**/*', search_term, cwd)
        vim.cmd(cmd)
        vim.cmd('copen')
    end
end, opts)

-- grep word under cursor in pwd
vim.keymap.set('n', '<leader>vg', ":lua vim.cmd('vimgrep /' .. vim.fn.expand('<cword>') .. '/g **/*')<CR>:copen<CR>", opts)

-- grep selection in pwd
vim.keymap.set('v', '<leader>vg', function()
    vim.cmd('noau normal! "vy')
    local selected_text = vim.fn.escape(vim.fn.getreg('v'), '/\\')  -- Get and escape the text
    vim.cmd('vimgrep /' .. selected_text .. '/g **/*')
    vim.cmd('copen')
end, opts)
