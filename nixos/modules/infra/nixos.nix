{ lib, config, inputs, ... }:

{
  options.configurations.nixos = lib.mkOption {
    type = lib.types.lazyAttrsOf (
      lib.types.submodule {
        options.module = lib.mkOption {
          type = lib.types.deferredModule;
        };
      }
    );

    default = {};
  };

  config.flake.nixosConfigurations = lib.mapAttrs (
    name: { module }:
    lib.nixosSystem {
      modules = [
        module
        inputs.home-manager.nixosModules.home-manager
      ];
    }
  ) config.configurations.nixos;
}
