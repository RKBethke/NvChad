-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
    use { 
      "machakann/vim-sandwich",
      event = "InsertEnter",
      config = function()
        -- Use vim surround-like keybindings
        vim.api.nvim_command('runtime macros/sandwich/keymap/surround.vim')
        -- '{' will insert space, '}' will not
        vim.g['sandwich#recipes'] = vim.list_extend(vim.g['sandwich#recipes'], {
          { buns = { '{ ', ' }' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '{' } },
          { buns = { '[ ', ' ]' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '[' } },
          { buns = { '( ', ' )' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '(' } },
          { buns = { '{\\s*', '\\s*}' },     nesting = 1, regex = 1, match_syntax = 1, kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '{' } },
          { buns = { '\\[\\s*', '\\s*\\]' }, nesting = 1, regex = 1, match_syntax = 1, kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '[' } },
          { buns = { '(\\s*', '\\s*)' },     nesting = 1, regex = 1, match_syntax = 1, kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '(' } }
        })
      end
    }
  end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
