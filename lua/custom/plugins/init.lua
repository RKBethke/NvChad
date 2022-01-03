local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
   -- Faster than the built-in filetype.vim
   use "nathom/filetype.nvim"

   -- Used for formatter and linter integration
   use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   }

   -- Helpful plugin dealing with surrounding symbols
   use {
      "machakann/vim-sandwich",
      event = "InsertEnter",
      config = function()
         require("custom.plugins.vim-sandwich").setup()
      end,
   }
end)
