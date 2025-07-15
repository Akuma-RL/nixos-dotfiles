{
 description = "My Modular NixOS Setup";

 inputs = {
  nixpkgs.url = "nixpkgs/nixos-unstable";
  home-manager.url = "github:nix-community/home-manager/master";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";
 };
 outputs = { self, nixpkgs, home-manager, ...}:
  let
   lib = nixpkgs.lib;
   system = "x86_64-linux";
   pkgs = nixpkgs.legacyPackages.${system};
#  overlay = [
#   (final: prev: {
#     brasero = null;
#     dvdauthor = null;
#    })
#   ];
  in {
   nixosConfigurations = {
    roshar = nixpkgs.lib.nixosSystem {
     inherit system;
     modules = [
     ./hosts/roshar.nix 
#     {
#      nixpkgs.overlays = overlay;
#     }
     ];
    };
   };
   homeConfigurations = {
    kaladin = home-manager.lib.homeManagerConfiguration {
     inherit pkgs;
     modules = [
      ./home/kaladin.nix
     ];
    };
   };
  };
}
