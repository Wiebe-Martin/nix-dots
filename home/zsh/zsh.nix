{ config, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;

        plugins = with pkgs; [
            {
                name = "zsh-users/zsh-syntax-highlighting";
                src = fetchFromGitHub {
                    owner = "zsh-users";
                    repo = "zsh-syntax-highlighting";
                    tag = "0.8.0";
                    sha256 = "iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
                };
                file = "zsh-syntax-highlighting.zsh";
            }
            {
                name = "zsh-users/zsh-completions";
                src = fetchFromGitHub {
                    owner = "zsh-users";
                    repo = "zsh-completions";
                    tag = "0.36.0";
                    sha256 = "XCSC7DyhfnxzKjtbdsu7/pyw8eoVLPdthEoFZ8rBAyo=";
                };
                file = "zsh-completions.plugin.zsh";
            }
            {
                name = "zsh-users/zsh-autosuggestions";
                src = fetchFromGitHub {
                    owner = "zsh-users";
                    repo = "zsh-autosuggestions";
                    tag = "v0.7.1";
                    sha256 = "vpTyYq9ZgfgdDsWzjxVAE7FZH4MALMNZIFyEOBLm5Qo=";
                };
                file = "zsh-autosuggestions.zsh";
            }
            {
                name = "Aloxaf/fzf-tab";
                src = fetchFromGitHub {
                    owner = "Aloxaf";
                    repo = "fzf-tab";
                    tag = "v1.3.0";
                    sha256 = "8atbysoOyCBW2OYKmdc91x9V/Mk3eyg3hvzvhJpQ32w=";
                };
                file = "fzf-tab.zsh";
            }
        ];

        oh-my-zsh = {
            enable = true;

            plugins = [
                "command-not-found"
                "git"
            ];
        };

        history = {
            size = 5000;
            save = 5000;
            append = true;
            share = true;
            findNoDups = true;
            saveNoDups = true;
            ignoreDups = true;
            ignoreAllDups = true;
            ignoreSpace = true;
        };

        initContent = ''
            zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
            zstyle ':completion:*' menu no

            zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
            zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

            bindkey -e
            bindkey '^p' history-search-backward
            bindkey '^n' history-search-forward
            bindkey '^[w' kill-region
            bindkey '^Y' forward-char
            bindkey -r '^F'
            bindkey -s '^f' 'tmux-sessionizer\n'

            eval "$(zoxide init --cmd cd zsh)"

            export PATH=$HOME/.local/bin:$PATH
        '';
    };

    home.file.".local/bin".source = ../scripts;

    programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        colors = {
            "bg" = "#32302f";
            "bg+" = "#3c3836";
            "fg" = "#bdae93";
            "fg+" = "#ebdbb2";
            "prompt" = "#fabd2f";
            "info" = "#fabd2f";
            "spinner" = "#8ec07c";
            "pointer" = "#8ec07c";
            "marker" = "#8ec07c";
            "hl" = "#83a598";
            "header" = "#83a598";
            "hl+" = "#83a598";
        };
    };

    programs.starship = {
        enable = true;
        enableZshIntegration = true;
    };

    programs.zoxide.enable = true;
}
