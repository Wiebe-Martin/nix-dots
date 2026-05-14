{ inputs, system, ... }:

{
    home.packages = [
        inputs.splashboard.packages.${system}.default
    ];
}
