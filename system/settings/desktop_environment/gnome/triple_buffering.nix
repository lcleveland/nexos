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
    nixpkgs.config.allowAliases = false;
    nixpkgs.overlays = [
      (final: prev: {
        mutter = prev.mutter.overrideAttrs (old: {
          src = pkgs.fetchFromGitLab {
            domain = "gitlab.gnome.org";
            owner = "vanvugt";
            repo = "mutter";
            rev = "triple-buffering-v4-46";
            hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
          };
        });
      })
    ];
  };
}
