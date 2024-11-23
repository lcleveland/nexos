{ username, plugin_name }:
{ ... }: {
  imports = [
    (import ./auto_install.nix { username = username; plugin_name = plugin_name; })
    (import ./enable.nix { username = username; plugin_name = plugin_name; })
    (import ./parser_dir.nix { username = username; plugin_name = plugin_name; })
  ];
}
