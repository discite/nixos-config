{ pkgs, ... }:

{
  home-manager.users.imurillus = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      # KDE-device-tool-requirements
      pciutils
      clinfo
      glxinfo
      vulkan-tools
      # CLI
      neofetch
      tree
      doas-sudo-shim
      # Software Defined Radio
      gnuradio
      # Browsers
      brave
      #  Chat
      armcord
      signal-desktop
      whatsapp-for-linux
      # Ofimatic
      libreoffice-qt
      hunspell
      hunspellDicts.es_PE
      hunspellDicts.en-us-large
      #  Development tasks
      kate
      nixpkgs-fmt
      rust-analyzer
      rustfmt
      clippy
      cargo
      rustc
      # Encriptacion en REST
      veracrypt
      libsForQt5.kio-gdrive # Google drive mediante FUSE en plasma
      cryptomator
      ocamlPackages.google-drive-ocamlfuse # workaround
      ## Remote tasks
      rustdesk
      ## shitcoin
      # monero-cli
      # monero-gui
      # p2pool
      # xmrig
      ## Virtualization
      virt-manager
    ];
    programs = {
      htop.enable = true;
      tmux.enable = true;
      neovim = {
        enable = true;
        defaultEditor = true;
      };
      chromium.enable = true;
      librewolf.enable = true;
      git = {
        enable = true;
        userName  = "imurillus";
        userEmail = "4948877+discite@users.noreply.github.com";
      };
      vscode = {
        enable = true;
        extensions = with pkgs; [
          vscode-extensions.ms-python.python
          vscode-extensions.svelte.svelte-vscode
          vscode-extensions.rust-lang.rust-analyzer
          vscode-extensions.arrterian.nix-env-selector
          vscode-extensions.jnoortheen.nix-ide
        ];
        userSettings = {};
      };
    };
    home.stateVersion = "22.11";
  };
}
