{
  description = "theoryclub.github.io";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      systems = lib.systems.flakeExposed;
      eachDefaultSystem = f: builtins.foldl' lib.attrsets.recursiveUpdate { }
        (map f systems);
    in
    eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        site = self.packages.${system}.default;
        formatters = with pkgs; [ nodePackages.prettier nixpkgs-fmt ];
        linters = with pkgs; [ statix ];
      in
      {
        packages.${system} = let inherit (pkgs) callPackage; in {
          default = callPackage ./pkgs/theoryclub { };
        };

        formatter.${system} = pkgs.writeShellApplication {
          name = "formatter";
          runtimeInputs = formatters;
          text = ''
            prettier --write "$@"
            nixpkgs-fmt "$@"
          '';
        };

        checks.${system}.lint = pkgs.stdenvNoCC.mkDerivation {
          name = "lint";
          src = ./.;
          doCheck = true;
          nativeCheckInputs = site.nativeBuildInputs ++ formatters ++ linters;
          checkPhase = ''
            prettier --check .
            statix check
            vnu --Werror --skip-non-css --filterfile .vnurc css
          '';
          installPhase = "touch $out";
        };

        apps.${system} = {
          serve = {
            type = "app";
            program = "${lib.getExe (pkgs.writeShellApplication {
              name = "serve";
              runtimeInputs = site.nativeBuildInputs;
              text = ''
                jekyll serve
              '';
            })}";
          };
          update = {
            type = "app";
            program = "${lib.getExe (pkgs.writeShellApplication {
              name = "update";
              runtimeInputs = [ pkgs.bundix ];
              text = ''
                bundix --lock
              '';
            })}";
          };
        };

        devShells.${system}.default = (pkgs.mkShellNoCC.override {
          stdenv = pkgs.stdenvNoCC.override {
            initialPath = [ pkgs.coreutils ];
          };
        }) {
          packages = [
            pkgs.bundix
            site.nativeBuildInputs
          ];
        };
      }
    );
}
