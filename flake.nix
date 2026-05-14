{
    description = "Home Manager configuration of martin";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        mangowm = {
            url = "github:mangowm/mango";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        dms = {
            url = "github:AvengeMedia/DankMaterialShell/stable";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        dms-plugin-registry = {
            url = "github:AvengeMedia/dms-plugin-registry";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        noctalia = {
            url = "github:noctalia-dev/noctalia-shell/v5";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        splashboard.url = "github:unhappychoice/splashboard";
    };
    outputs =
        inputs@{
            self,
            nixpkgs,
            home-manager,
            ...
        }:
        let
            system = "x86_64-linux";
        in
        {
            nixosConfigurations."thinkpadt14" = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit inputs;
                    inherit system;
                };
                modules = [
                    ./hosts/thinkpadT14/configuration.nix

                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = {
                                inherit inputs;
                            };
                            backupFileExtension = "backup";
                            users.martin = {
                                imports = [
                                    ./hosts/thinkpadT14/home.nix
                                    ./home/options.nix
                                    ./hosts/thinkpadT14/options.nix
                                ];
                            };
                        };
                    }
                ];
            };
        };
}
