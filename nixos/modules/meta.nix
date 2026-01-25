{ lib, ... }:

{
  options = {
    userName = lib.mkOption {
      type = lib.types.singleLineStr;
      default = "nat";
      readOnly = true;
    };

    hostName = lib.mkOption {
      type = lib.types.singleLineStr;
      default = "nat-os";
      readOnly = true;
    };

    timezone = lib.mkOption {
      type = lib.types.singleLineStr;
      default = "America/Los_Angeles";
      readOnly = true;
    };
  };

  config = {
    homeUsers.nat = "/home/nat";
  };
}
