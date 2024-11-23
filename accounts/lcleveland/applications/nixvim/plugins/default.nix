{ ... }: {
  imports = [
    (import ./codeium-nvim { username = "lcleveland"; plugin_name = "codeium-nvim"; })
  ];
}
