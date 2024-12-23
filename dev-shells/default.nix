inputs:
inputs.nixpkgs.lib.mapAttrs (system: pkgs: {
  default = pkgs.mkShell {
    packages =
      with pkgs;
      [
        poetry
      ]
      ++ inputs.self.checks.${system}.pre-commit-check.enabledPackages;

    inherit (inputs.self.checks.${system}.pre-commit-check) shellHook;
  };
}) inputs.self.legacyPackages
