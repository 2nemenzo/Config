{ lib, config, inputs, ... }:

{
  options.homeUsers = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
    default = {};
    description = "Mapping of username to home directory";
  };
}
