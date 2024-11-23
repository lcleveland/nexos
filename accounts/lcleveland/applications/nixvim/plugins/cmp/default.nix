{ username, plugin_name }:
{ ... }: {
  imports = [
    (import ./enable.nix { username = username; plugin_name = plugin_name; })
    (import ./mappings.nix { username = username; plugin_name = plugin_name; })
    (import ./sources.nix { username = username; plugin_name = plugin_name; })
  ];
}
