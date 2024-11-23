{ username, plugin_name }:
{ ... }: {
  imports = [
    (import ./auto_enable_sources.nix { username = username; plugin_name = plugin_name; })
    (import ./enable.nix { username = username; plugin_name = plugin_name; })
    (import ./mappings.nix { username = username; plugin_name = plugin_name; })
    (import ./sources.nix { username = username; plugin_name = plugin_name; })
  ];
}
