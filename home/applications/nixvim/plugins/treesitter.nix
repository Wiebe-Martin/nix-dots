{ pkgs, config, ... }:

{
    plugins.treesitter = {
        enable = true;

        grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
            lua
            python
            javascript
            typescript
            vimdoc
            vim
            regex
            sql
            dockerfile
            toml
            json
            java
            groovy
            go
            gitignore
            yaml
            make
            cmake
            markdown
            markdown_inline
            bash
            tsx
            css
            html
            nix
            diff
        ];

        settings = {
            highlight.enable = true;
            indent.enable = true;
        };
    };
}
