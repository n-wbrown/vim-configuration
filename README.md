# External requirements
COC.nvim requires nodejs. I recommend installing nvm for managing node installations.

# Specific settings for specific machines
Create a `local_settings.vim` (or similarly named symlink) to use a different colorscheme or settings on a specific machine. This filename is recognized in the .gitignore.

# Recommended Coc.Nvim extensions:
- coc-rls
- coc-python
- coc-json
- coc-go
- coc-clangd

# Notes:
- `nvim-treesitter` requires tightly matched versions of nvim, nvim-treesitter, and each language parser. Updating to the latest build is recommended.
- Place a link to the nvim directory in `~/.config/nvim` to get proper nvim support
