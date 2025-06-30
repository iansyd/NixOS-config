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
  };

  outputs = inputs@{ self,  ... }: let

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        # username also needs to be be explicity stated in the definition of homeConfigurations
        username = "ian";                             # username.
        name = "Ian";                                     # name/identifier
        email = "iansyd@gmail.com";         # email (used for certain configurations)
        dotfilesDir = "/home/ian/dotfiles"; # absolute path of the local repo
        #font = "Intel One Mono";                  # Selected font
        #fontPkg = pkgs.intel-one-mono;     # Font package
      };

      # ----- THE REST ----- #
      pkgs = import inputs.nixpkgs {
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };
      lib = inputs.nixpkgs.lib;
      #home-manager = inputs.home-manager;
      #nix-index-database = inputs.nix-index-database;
      #plasma-manager = inputs.plasma-manager;

    in    {

    nixosConfigurations = {

         hpMiniG9 = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/hpMiniG9
            inputs.nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit userSettings;
            inherit inputs;
            inherit (import ./variables.nix)
               host
               username;
          };
        };

        dellLaptop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/dellLaptop
            inputs.nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit userSettings;
            inherit inputs;
            inherit (import ./variables.nix)
               host
               username;
          };
        };

        dellE7440 = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/dellE7440
            inputs.nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit userSettings;
            inherit inputs;
            inherit (import ./variables.nix)
               host
               username;
          };
        };

/*
        jupiterH470-nvme = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/jupiterH470-nvme
            inputs.nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit userSettings;
            inherit inputs;
          };
        };

        jupiterH470-sda = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/jupiterH470-sda
            inputs.nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }

          ];
          specialArgs = {
            inherit userSettings;
            inherit inputs;
          };
        };
      };
*/

/*
      homeConfigurations = {
        # The next line should start with the value in userSettings.name
        ian = inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              modules = [
                inputs.plasma-manager.homeManagerModules.plasma-manager
                ././home
                inputs.nix-index-database.hmModules.nix-index
                # optional to also wrap and install comma
                { programs.nix-index-database.comma.enable = true; }
              ];
              extraSpecialArgs = {
                #inherit systemSettings;
                inherit userSettings;
                inherit inputs;
              };
            };
      };
*/
    };
  };
}
