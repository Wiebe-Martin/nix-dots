{
    description = "NixOS configurations of martin";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
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
            url = "github:noctalia-dev/noctalia";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        lanzaboote = {
            url = "github:nix-community/lanzaboote/v1.1.0";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs =
        inputs@{
            self,
            nixpkgs,
            home-manager,
            ...
        }:
        {
            nixosConfigurations."thinkpadt14" = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit inputs;
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
            nixosConfigurations."eva02" = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {
                    inherit inputs;
                };
                modules = [
                    ./hosts/eva02/configuration.nix

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
                                    ./hosts/eva02/home.nix
                                    ./home/options.nix
                                    ./hosts/eva02/options.nix
                                ];
                            };
                        };
                    }
                ];
            };
        };
}
