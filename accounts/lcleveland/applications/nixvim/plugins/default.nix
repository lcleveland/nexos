{ ... }: {
  imports = [
    (import ./codeium_nvim { username = "lcleveland"; plugin_name = "codeium-nvim"; })
  ];
}
