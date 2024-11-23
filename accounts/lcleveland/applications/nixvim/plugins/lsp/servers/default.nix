{ username, plugin_name }:
{ ... }: {
  imports = [
    (import ./nil-ls.nix { username = username; plugin_name = plugin_name; })
    (import ./nixd.nix { username = username; plugin_name = plugin_name; })
  ];
}
