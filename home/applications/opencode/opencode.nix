{ config, ... }:

{
  programs.opencode = {
    enable = true;
    tui = {
      theme = "stylix";
      keybinds = {
        leader = "space";
      };
      plugin = [ "vimcode@git+https://github.com/oribarilan/vimcode.git#v0.15.3" ];
    };
  };
}
