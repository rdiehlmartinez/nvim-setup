local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup-plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    -- Additional Plugins
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }

    -- tmux and window split 
    use("christoomey/vim-tmux-navigator") -- navigate windows with vim style keys
    use("szw/vim-maximizer")

    -- for commenting with gc 
    use("numToStr/Comment.nvim")

    -- file explorer 
    use("nvim-tree/nvim-tree.lua")

    -- icons 
    use("kyazdani42/nvim-web-devicons")

    -- status line 
    use("nvim-lualine/lualine.nvim")
   
    -- fuzzy finding
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { {'nvim-lua/plenary.nvim'} } })

    -- autocompletion
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets


    -- lsp server setup 
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    use("neovim/nvim-lspconfig")

    use("hrsh7th/cmp-nvim-lsp")
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    }) -- enhanced lsp uis
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")

    -- formatting and linting 
    use("jose-elias-alvarez/null-ls.nvim")
    use("jayp0521/mason-null-ls.nvim")

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    })

    -- auto closing
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

    -- git integration
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    -- setting up copilot 
    use("github/copilot.vim")
    
    -- End of additional plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)


