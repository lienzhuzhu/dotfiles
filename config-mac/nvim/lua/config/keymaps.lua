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
vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("n", "<C-t>", "<cmd>terminal<CR>", opts)
vim.keymap.set('t', "<Esc>", [[<C-\><C-n>]], opts)

-- Split movement
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Quickfix List
vim.keymap.set("n", "<leader>co", "<cmd>copen<CR>", opts)
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<CR>", opts)
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>", opts)
vim.keymap.set("n", "<leader>cp", "<cmd>cprev<CR>", opts)


-- Fuzzy find files
vim.keymap.set("n", "<leader>f", "<CMD>FzfLua files<CR>", opts)

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


-- TODO: Experiment with this.
--
-- Notaker fuzzy grep using ripgrep and fzf
-- vim.keymap.set('n', '<leader>ng', function()
--     local notaker_dir = os.getenv("NOTAKER_CORTEX_DIR")
--     if not notaker_dir or notaker_dir == "" then
--         vim.notify("NOTAKER_CORTEX_DIR is not set!", vim.log.levels.ERROR)
--         return
--     end
--
--     local search_term = vim.fn.input("Fuzzy GREP in NOTAKER: ")
--     if search_term ~= "" then
--         local cmd = string.format(
--             'rg --hidden --glob "!*.a" --line-number --column --no-heading "%s" "%s" | fzf',
--             search_term, notaker_dir
--         )
--         vim.cmd(string.format("cexpr system('%s')", cmd))
--         vim.cmd('copen')
--     end
-- end, opts)

-- Notaker grep using ripgrep
vim.keymap.set('n', '<leader>ng', function()
    local search_term = vim.fn.input("NOTAKER grep: ")
    if search_term ~= "" then
        local cmd = string.format('silent grep! -r --vimgrep --hidden --glob "!*.a" "%s" $NOTAKER_CORTEX_DIR/**/*.md', search_term)
        vim.cmd(cmd)
        vim.cmd('copen')  -- Open the quickfix window
    end
end, opts)

-- Grep in current working directory with short PWD in prompt using ripgrep
vim.keymap.set('n', 're', function()
    local cwd = vim.fn.getcwd()  -- Get the current working directory
    local short_cwd = vim.fn.fnamemodify(cwd, ":~")  -- Shorten the path (e.g., ~/projects/notaker)
    local search_term = vim.fn.input("GREP in " .. short_cwd .. ": ")
    if search_term ~= "" then
        local cmd = string.format('silent grep! -r --vimgrep --hidden --glob "!*.a" "%s" %s', search_term, cwd)
        vim.cmd(cmd)
        vim.cmd('copen')  -- Open the quickfix window
    end
end, opts)

-- TODO: Experiment with this one
--
-- vim.keymap.set('n', 're', function()
--     local cwd = vim.fn.getcwd()
--     local short_cwd = vim.fn.fnamemodify(cwd, ":~")
--     local search_term = vim.fn.input("Fuzzy GREP in " .. short_cwd .. ": ")
--     if search_term ~= "" then
--         local cmd = string.format(
--             'rg --hidden --glob "!*.a" --line-number --column --no-heading "%s" %s | fzf',
--             search_term, cwd
--         )
--         vim.cmd(string.format("cexpr system('%s')", cmd))
--         vim.cmd('copen')
--     end
-- end, opts)
