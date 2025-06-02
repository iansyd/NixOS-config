{

  description = "iansyd's flake";

  outputs = inputs@{ self, ... }:

    let

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        # username also needs to be be explicity stated in the definition of homeConfigurations
        #username = "ian";                 # username.
        name = "Ian";                     # name/identifier
        email = "iansyd@gmail.com";       # email (used for certain configurations)
        dotfilesDir = "/home/ian/dotfiles"; # absolute path of the local repo
        theme = "io";                     # selcted theme from my themes directory (./themes/)
        # Selected window manager or desktop environment;
        # must select one in both ./user/wm/ and ./system/wm/
        wm = "kde";
        font = "Intel One Mono"; # Selected font
        fontPkg = pkgs.intel-one-mono; # Font package
        #editor = "nvim"; #"neovide"; # Default editor;
      };

      # ----- THE REST ----- #
      pkgs = import inputs.nixpkgs-unstable {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };
      lib = inputs.nixpkgs-unstable.lib;
      home-manager = inputs.home-manager-unstable;
      nix-index-database = inputs.nix-index-database-unstable;
      plasma-manager = inputs.plasma-manager-unstable;

    in

    {

       nixosConfigurations = {

         dellLaptop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ././hosts/dellLaptop
            nix-index-database.nixosModules.nix-index
            # optional to also wrap and install comma
            { programs.nix-index-database.comma.enable = true; }
          ];
          specialArgs = {
            inherit userSettings;
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
            inherit userSettings;
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
            inherit userSettings;
            inherit inputs;
          };
        };
      };

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
                inherit userSettings;
                inherit inputs;
              };
            };
      };
    };


  inputs = {

    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-index-database-unstable = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # blocklist used in blocklist.nix
    blocklist-hosts = {
      url = "github:StevenBlack/hosts";
      flake = false;
    };
    plasma-manager-unstable = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.home-manager.follows = "home-manager-unstable";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
  };
}
