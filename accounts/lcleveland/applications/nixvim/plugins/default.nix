{ ... }: {
  imports = [
    (import ./cmp { username = "lcleveland"; plugin_name = "cmp"; })
    (import ./cmp-nvim-lsp { username = "lcleveland"; plugin_name = "cmp-nvim-lsp"; })
    (import ./codeium-nvim { username = "lcleveland"; plugin_name = "codeium-nvim"; })
    (import ./lsp { username = "lcleveland"; plugin_name = "lsp"; })
    (import ./lsp-format { username = "lcleveland"; plugin_name = "lsp-format"; })
    (import ./none-ls { username = "lcleveland"; plugin_name = "none-ls"; })
    (import ./nvim-tree { username = "lcleveland"; plugin_name = "nvim-tree"; })
    (import ./treesitter { username = "lcleveland"; plugin_name = "treesitter"; })
    (import ./web-devicons { username = "lcleveland"; plugin_name = "web-devicons"; })
    (import ./which-key { username = "lcleveland"; plugin_name = "which-key"; })
  ];
}
