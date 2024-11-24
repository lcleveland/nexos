{ username, plugin_name }:
{ ... }: {
  imports = [
    (import ./enable.nix { username = username; plugin_name = plugin_name; })
    (import ./show_keys.nix { username = username; plugin_name = plugin_name; })
  ];
}
