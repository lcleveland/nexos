{ config, lib, pkgs, ... }:
let
  desktop_environment = config.system.settings.desktop_environment;
in
{
  options.system.settings.desktop_environment.gnome = {
    triple_buffering = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Use triple buffering";
    };
  };
  config = lib.mkIf (desktop_environment.enable && desktop_environment.enabled_environment == "gnome") {
    nixpkgs.overlays = [
      # GNOME 46: triple-buffering-v4-46
      (final: prev: {
        gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
          mutter = gnomePrev.mutter.overrideAttrs (old: {
            src = pkgs.fetchFromGitLab {
              domain = "gitlab.gnome.org";
              owner = "vanvugt";
              repo = "mutter";
              rev = "triple-buffering-v4-46";
              hash = "sha256-fkPjB/5DPBX06t7yj0Rb3UEuu5b9mu3aS+jhH18+lpI=";
            };
          });
        });
      })
    ];
  };
}
