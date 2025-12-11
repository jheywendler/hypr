{
  description = "Não faço ideia pra que isso serve.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    # Configuração do Sistema NixOS
    nixosConfigurations = {
      kyu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Configuração base do sistema
          ./configuration.nix

          # Home Manager como módulo do NixOS
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kyu = import ./home.nix;
          }
        ];
      };
    };

    # Configuração standalone do Home Manager (alternativa)
    homeConfigurations = {
      "kyu" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          ./home.nix
        ];
      };
    };
  };
}
