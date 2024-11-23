{ ... }: {
  imports = [
    ./alsa
    ./bluetooth
    ./enable.nix
    ./jack
    ./pulse_audio
  ];
}
