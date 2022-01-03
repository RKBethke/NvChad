local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.options = {
   relativenumber = true,
   shiftwidth = 4,

   nvChad = {
      copy_del = false,
      update_url = "https://github.com/RKBethke/NvChad",
      update_branch = "rkbethke",
   },
}

M.ui = {
   theme = "gruvbox",
}

M.plugins = {
   status = {
      colorizer = true,
   },
   options = {
      nvimtree = {
         enable_git = 1,
         ui = {
            hide_root_folder = false,
         },
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

return M
