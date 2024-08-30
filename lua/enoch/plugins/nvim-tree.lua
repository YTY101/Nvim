return {
 
  

  "nvim-tree/nvim-tree.lua",

 
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    api = require("nvim-tree.api")
    
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    local function my_on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- copy default mappings here from defaults in next section
      vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
      vim.keymap.set('n', 'l', api.node.open.preview,     opts('Open: In Place'))
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Parent Folder'))
      ---
      -- -- OR use all default mappings
      api.config.mappings.default_on_attach(bufnr)
      --
      -- -- remove a default
      -- vim.keymap.del('n', '<C-]>', { buffer = bufnr })
      --
      -- -- override a default
      -- vim.keymap.set('n', '<C-e>', api.tree.reload,                       opts('Refresh'))
      --
      -- -- add your mappings
      -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      ---
    end

    local function print_node_path()
      local api = require('nvim-tree.api')
      local node = api.tree.get_node_under_cursor()
      print(node.absolute_path)
    end

    -- on_attach
    vim.keymap.set('n', '<C-P>', print_node_path, opts('Print Path'))

    nvimtree.setup({
      ---
      on_attach = my_on_attach,
      ---
      view = {
        width = 35,
        relativenumber = true,
        cursorline = true,
        -- mappings = {
        --   list = {
        --     { key = { 'l', '<CR>', '<2-LeftMouse>' }, action = "edit" },
        --     { key = { 'L' }, action = "cd" },
        --     { key = { '<C-s>' }, action = "split" },
        --     { key = { '<C-v>' }, action = "vsplit" },
        --     { key = { '<C-t>' }, action = "tabnew" },
        --     { key = { 'h' }, action = "close_node" },
        --     { key = { 'i' }, action = "preview" },
        --   },
        -- },
      },
      
      -- tab settings
      tab = {
        sync = {
          open = true,
        },
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          eject = false,
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      hijack_cursor = true,
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end
}
