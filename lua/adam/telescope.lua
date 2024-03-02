
require("telescope").setup({
   defaults = {
    -- Your regular Telescope's options.
  },
  extensions = {
    recent_files = {
      only_cwd = true,
    }
  }
})

require("telescope").load_extension("recent_files")
