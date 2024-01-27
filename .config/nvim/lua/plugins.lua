local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

function get_setup(name)
    return string.format('require("setup/%s")', name)
end

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use({ 'goolord/alpha-nvim', config = get_setup("alpha") }) -- greeter
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        config = get_setup("tree")
    }
    use "nvim-telescope/telescope.nvim"
    use { "ellisonleao/gruvbox.nvim" } -- Gruvbox theme
    use { "folke/tokyonight.nvim", config = function()
        require("tokyonight").setup({
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            }
        })
    end } -- another theme i like themes i change themes alot i love themes
    use { "noib3/nvim-cokeline", requires = "kyazdani42/nvim-web-devicons", config = get_setup('cokeline') }
    use 'voldikss/vim-floaterm'
    use 'feline-nvim/feline.nvim'
    use 'lewis6991/gitsigns.nvim'
    use { "windwp/nvim-autopairs", config = get_setup("autopairs") }
    use 'andweeb/presence.nvim'
    -- use { 'github/copilot.vim' }
    -- use { 'linux-cultist/venv-selector.nvim' }
    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = get_setup('nvim-treesitter') }

    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                -- optional configuration
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })


    -- cmp plugins
    use { "hrsh7th/nvim-cmp", config = get_setup("cmp") } -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Debugger
    use 'mfussenegger/nvim-dap'

    -- Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'slint-ui/vim-slint'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
