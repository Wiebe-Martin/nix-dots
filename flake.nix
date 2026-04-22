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
        nixvim = {
            url = "github:nix-community/nixvim";
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
                            backupFileExtension = "bakup";
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
