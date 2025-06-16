-- This file can be used to add new plugins to lazy.nvim
-- or to configure existing plugins that are part of kickstart.nvim

return {
  -- 1. Add a new plugin
  -- {
  --   'mbbill/undotree',
  --   config = function()
  --     vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle UndoTree' })
  --   end,
  -- },

  -- 2. Modify an existing plugin
  -- To configure a plugin, you can simply return a table with the plugin's name
  -- and the options you want to override.
  -- In this case, we are changing the signs for gitsigns.nvim.
  -- {
  --   'lewis6991/gitsigns.nvim',
  --   opts = {
  --     signs = {
  --       add = { text = '┃' }, -- Change the add sign
  --       -- Note: We don't need to specify the other signs (change, delete, etc.)
  --       -- lazy.nvim will merge this 'opts' table with the one in the main init.lua
  --     },
  --   },
  -- },

  -- Example: Changing your colorscheme's configuration
  -- Let's say you want to enable italic comments for monokai, which is disabled by default in kickstart
  -- {
  --   'tanvirtin/monokai.nvim',
  --   -- The 'opts' function is a special feature of lazy.nvim that allows you to
  --   -- easily modify the options of a plugin. It's often simpler than writing a full 'config' function.
  --   opts = {
  --     styles = {
  --       comments = { italic = true }, -- This will be merged with the original opts
  --     },
  --   },
  -- },
  {
    'tanvirtin/monokai.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('monokai').setup {
        styles = {
          comments = { italic = false },
        },
      }

      vim.cmd.colorscheme 'monokai'
    end,
  },

  -- Example: Add a new LSP server
  {
    'neovim/nvim-lspconfig',
    -- The 'opts' function here will be merged with the 'opts' from the main init.lua
    opts = {
      servers = {
        -- Add a new server to the list
        ts_ls = {},
        -- You can also override settings for an existing server
        -- For example, to disable a diagnostic for lua_ls that you find noisy:
        -- lua_ls = {
        --   settings = {
        --     Lua = {
        --       diagnostics = {
        --         disable = { 'lowercase-global' },
        --       },
        --     },
        --   },
        -- },
	css_lsp = {},
        groovyls = {
          settings = {
            groovy = {
              classpath = {
                '~\\AppData\\Local\\nvim-data\\mason\\packages\\groovy-language-server\\build\\libs\\groovy-language-server-all.jar',
                -- You'll need to adjust the Maven path if it's different on your system
                'C:\\Users\\adan.moses\\.m2\\repository\\org\\codehaus\\groovy\\groovy-all\\2.4.21\\groovy-all-2.4.21.jar',
              },
            },
          },
        },
      },
      -- You might also want to ensure the new language server tools are installed by mason
      ensure_installed = {
        -- Make sure to include existing tools from init.lua if you override this table completely
        -- A better approach is to extend it, which lazy.nvim often does automatically.
        -- Let's add the tailwindcss-language-server
        'prettier',
        'superhtml',
        'sql-formatter',
        'xmlformatter',
        'groovy-language-server',
      },
    },
  },
  { 
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        scss = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        jsx = { 'prettier' },
        sql = { 'sql_formatter' },
        xml = { 'xmlformatter' },
      }
    }
 }
}
