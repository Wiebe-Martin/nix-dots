{ config, pkgs, ... }:

let
    gruvbox-tmux = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "gruvbox";
        version = "1.0";
        src = pkgs.fetchFromGitLab {
            owner = "motaz-shokry";
            repo = "gruvbox-tmux";
            rev = "da6b7556937476ec93ac059f46d483139f9cf233";
            sha256 = "KSDf7UBzByPIbjyEdGdnbKmlqYwmur3bwcKM2nqgcpE=";
        };
    };
in
{
    programs.tmux = {
        enable = true;
        terminal = "tmux-256color";

        baseIndex = 1;
        prefix = "C-Space";

        mouse = true;

        plugins = with pkgs; [
            tmuxPlugins.sensible
            {
                plugin = tmuxPlugins.vim-tmux-navigator;
                extraConfig = ''
                    is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
                        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
                    bind-key -n 'M-h' if-shell "$is_vim" 'send-keys M-h'  'select-pane -L'
                    bind-key -n 'M-j' if-shell "$is_vim" 'send-keys M-j'  'select-pane -D'
                    bind-key -n 'M-k' if-shell "$is_vim" 'send-keys M-k'  'select-pane -U'
                    bind-key -n 'M-l' if-shell "$is_vim" 'send-keys M-l'  'select-pane -R'

                    tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
                    if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
                        "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\'  'select-pane -l'"
                    if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
                        "bind-key -n 'M-\\' if-shell \"$is_vim\" 'send-keys M-\\\\'  'select-pane -l'"

                    set -g @vim_navigator_mapping_left "M-h"  # use M-h and M-Left
                    set -g @vim_navigator_mapping_right "M-l"
                    set -g @vim_navigator_mapping_up "M-k"
                    set -g @vim_navigator_mapping_down "M-j"
                    set -g @vim_navigator_mapping_prev ""  # removes the M-\ binding
                '';
            }
            tmuxPlugins.yank
            tmuxPlugins.resurrect
            {
                plugin = gruvbox-tmux;
                extraConfig = ''
                    set -g @gruvbox-tmux_transparent 1
                '';
            }
        ];

        extraConfig = ''
            set -g detach-on-destroy off

            # source-file "~/.config/tmux/omarchy_theme.conf"

            # Keybindings
            setw -g mode-keys vi

            bind -n M-H previous-window
            bind -n M-L next-window

            bind -n M-Right switch-client -n
            bind -n M-Left switch-client -p

            bind-key -r f run-shell "tmux neww ~/.local/bin/tmux-sessionizer"

            bind-key -T copy-mode-vi v send-keys -X begin-selection
            bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
            bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

            # Pane Controls
            bind h split-window -v -c "#{pane_current_path}"
            bind v split-window -h -c "#{pane_current_path}"
            bind x kill-pane

            # Window navigation
            bind r command-prompt -I "#W" "rename-window -- '%%'"
            bind c new-window -c "#{pane_current_path}"
            bind k kill-window
        '';
    };
}
