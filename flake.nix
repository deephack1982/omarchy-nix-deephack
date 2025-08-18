{
  description = "Omarchy - Base configuration flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    pyprland.url = "github:hyprland-community/pyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    pyprland,
    hyprland,
    nix-colors,
    home-manager,
  }: {
    nixosModules = {
      default = {
        config,
        lib,
        pkgs,
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
            })
          ];
        };
      };
    };

    homeManagerModules = {
      default = {
        config,
        lib,
        pkgs,
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
