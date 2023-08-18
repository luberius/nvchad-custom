# nvchad custom folder

My personal custom config.

Customization:
- add [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
- enable git on [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- map `<leader>o` to switch focus from `buffer` to `nvim-tree`

## setup
1. Clone this repo into nvchad custom folder in `~/.config/nvim/lua/custom`
2. make symlink for ftplugin folder:
   ```
   ln -s ~/.config/nvim/lua/custom/ftplugin $NVIM_CONFIG_HOME/ftplugin
   ```
3. done
