{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix"; # Define your hostname here.

  # Set your locale to Brazilian Portuguese
  i18n.defaultLocale = "pt_BR.UTF-8";
  i18n.supportedLocales = [ "pt_BR.UTF-8" ];

  # Define your time zone to a Brazilian time zone
  time.timeZone = "America/Sao_Paulo"; # Adjust as needed.

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "br";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable KDE Plasma 5 desktop environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable Hyperland window manager.
  services.wayland.enable = true;
  services.wayland.windowManager.hyperland = {
    enable = true;
    extraPackages = with pkgs; [ waybar rofi ];
  };

  # Enable sound.
	  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.pulseaudio.package = pkgs.pipewire;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define user accounts
  users.users.yourusername = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
		shell = pkgs.zsh;
  };

  # Allow non-sudo users to use some important services.
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Networking
  networking.networkmanager.enable = true;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev"; # Install GRUB into the MBR.

  # Specify the packages you want to install system-wide.
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
		zsh
		neovim
		kitty
		obsidian
		libreoffice-qt6-fresh
		texliveFull
		texstudio
		librewolf
		chromium
		firefox
		kdePackages.okular
		zathura
		gimp
		inkscape
		vlc
		spotify
		eza
		bat
		coreutils-full
		fzf
		ani-cli
		curl
		wget
		man
		tldr
		duf
		jq
		procs
		ps
		gnused
		sd
		tree
		xsel
		busybox

  ];

  # Set your system settings
  system.stateVersion = "23.05"; # Adjust as needed.
}

