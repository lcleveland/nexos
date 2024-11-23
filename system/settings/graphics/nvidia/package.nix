{ config, lib, ... }:
let
  graphics = config.system.settings.graphics;
in
{
  options.system.settings.graphics.nvidia = {
    package = lib.mkOption {
      type = lib.types.attrs;
      default = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "555.58.02";
        sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
        sha256_aarch64 = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
        openSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
        settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
        persistencedSha256 = lib.fakeSha256;
      };
      description = lib.mdDoc "Nvidia drivers package";
    };
  };
  config = lib.mkIf (graphics.enable && graphics.enabled_graphics == "nvidia") {
    hardware.nvidia.package = graphics.nvidia.package;
  };
}
