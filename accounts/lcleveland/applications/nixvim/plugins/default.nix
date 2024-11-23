{ ... }: {
  imports = [
    (import ./cmp { username = "lcleveland"; plugin_name = "cmp"; })
    (import ./codeium-nvim { username = "lcleveland"; plugin_name = "codeium-nvim"; })
  ];
}
