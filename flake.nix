{

  description = "iansyd's kde based flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # blocklist used in blocklist.nix
    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nvf.url = "github:notashelf/nvf";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs@{ self, ... }:
    let
      # Small tool to iterate over each systems
      eachSystem =
        f:
        inputs.nixpkgs.lib.genAttrs (import inputs.systems) (
          system: f inputs.nixpkgs.legacyPackages.${system}
        );

      # Eval the treefmt modules from ./treefmt.nix
      treefmtEval = eachSystem (pkgs: inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in
    {

      # for `nix fmt`
      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
      # for `nix flake check`
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });

      nixosConfigurations = {

        hpMiniG9 = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/hpMiniG9
            inputs.nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit inputs;
            inherit (import ./hosts/hpMiniG9/variables.nix)
              host
              username
              email
              dotfilesDir
              ;
          };
        };

        dellLaptop = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/dellLaptop
            inputs.nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit inputs;
            inherit (import ./hosts/dellLaptop/variables.nix)
              host
              username
              email
              dotfilesDir
              ;
          };
        };

        dellE7440 = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
          ././hosts/dellE7440
          inputs.nix-index-database.nixosModules.nix-index
          # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            #inherit userSettings;
            inherit inputs;
          };
        };

        /*
                dellMiniLaptop = lib.nixosSystem {
                  system = "x86_64-linux";
                  modules = [
                    ././hosts/dellMiniLaptop
                    nix-index-database.nixosModules.nix-index
                    # optional to also wrap and install comma
                    { programs.nix-index-database.comma.enable = true; }
                  ];
                  specialArgs = {
                    #inherit userSettings;
                    inherit inputs;
                  };
                };

                jupiterH470-nvme = lib.nixosSystem {
                  system = "x86_64-linux";
                  modules = [
                    ././hosts/jupiterH470-nvme
                    nix-index-database.nixosModules.nix-index
                    # optional to also wrap and install comma
                    { programs.nix-index-database.comma.enable = true; }
                  ];
                  specialArgs = {
                    #inherit userSettings;
                    inherit inputs;
                  };
                };

                jupiterH470-sda = lib.nixosSystem {
                  system = "x86_64-linux";
                  modules = [
                    ././hosts/jupiterH470-sda
                    nix-index-database.nixosModules.nix-index
                    # optional to also wrap and install comma
                    { programs.nix-index-database.comma.enable = true; }

                  ];
                  specialArgs = {
                    #inherit userSettings;
                    inherit inputs;
                  };
                };
        */
      };
      /*
            homeConfigurations = {
              # The next line should start with the value in userSettings.name
              ian = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [
                      plasma-manager.homeManagerModules.plasma-manager
                      ././home/ian/home.nix
                      nix-index-database.hmModules.nix-index
                      # optional to also wrap and install comma
                      { programs.nix-index-database.comma.enable = true; }
                    ];
                    extraSpecialArgs = {
                      #inherit systemSettings;
                      #inherit userSettings;
                      inherit inputs;
                    };
                  };
            };
          };
      */
    };
}
