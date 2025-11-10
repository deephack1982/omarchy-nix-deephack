{
  description = "Omarchy - Base configuration flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland/v0.52.1";
    nix-colors.url = "github:misterio77/nix-colors";
    pyprland.url = "github:hyprland-community/pyprland";
    wiremix.url = "github:tsowell/wiremix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    pyprland,
    wiremix,
    hyprland,
    nix-colors,
    home-manager,
  }: {
    nixosModules = {
      default = {
        lib,
        ...
      }: {
        imports = [
          (import ./modules/nixos/default.nix inputs)
        ];

        options.omarchy = (import ./config.nix lib).omarchyOptions;
        config = {
          nixpkgs.config.allowUnfree = true;

          nixpkgs.overlays = [
            (final: prev: {
              pyprland = pyprland.packages.${final.system}.default;
              wiremix = wiremix.packages.${final.system}.default;
            })
          ];
        };
      };
    };

    homeManagerModules = {
      default = {
        lib,
        osConfig ? {},
        ...
      }: {
        imports = [
          nix-colors.homeManagerModules.default
          (import ./modules/home-manager/default.nix inputs)
        ];
        options.omarchy = (import ./config.nix lib).omarchyOptions;
        config = lib.mkIf (osConfig ? omarchy) {
          omarchy = osConfig.omarchy;
        };
      };
    };
  };
}
