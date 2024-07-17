# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		];

	nixpkgs.config.allowUnfree = true;
# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nix"; # Define your hostname.
# Pick only one of the below networking options.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

# Set your time zone.
	time.timeZone = "America/Sao_Paulo";

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Select internationalisation properties.
	i18n.defaultLocale = "pt_BR.UTF-8";
# console = {
#   font = "Lat2-Terminus16";
#   keyMap = "us";
#   useXkbConfig = true; # use xkb.options in tty.
# };

# Enable the X11 windowing system.
	services.xserver =  {
		enable = true;

	};

	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
#  services.xserver.desktopManager.gnome.wayland = true;

	services.gnome.gnome-keyring.enable = true;
	programs.zsh.enable = true;

	services.xserver.windowManager.i3 = {
		enable = true;
		package = pkgs.i3-gaps;
	};


# Configure keymap in X11
	services.xserver.xkb.layout = "br";
	services.xserver.xkb.options = "eurosign:e,caps:escape";

# Enable CUPS to print documents.
# services.printing.enable = true;

	# Configuration of audio
	hardware.pulseaudio.enable = false;
	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	# Touch pad support
	services.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users.bender = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
			shell = pkgs.zsh;
		packages = with pkgs; [
			firefox
				tree
				gnome.gnome-tweaks
				gnome.gnome-shell-extensions
				grim
				slurp
				wl-clipboard
				mako
				waybar
				dmenu
				neovim
				libgcc
				git
				exercism
		];
	};

# List packages installed in system profile. To search, run:
# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
			feh 
			picom
			wget
			git
			curl
			neofetch
			kitty
			i3
			zsh
			obsidian
			texliveFull
			texstudio
			librewolf
			chromium
			neovim
			kdePackages.okular
			libreoffice-qt6-fresh
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
			htop
			gtop
			gping
			uutils-coreutils-noprefix
			buku
			cmus
			cointop
			ddgr
			cowsay
			figlet
			lolcat
			taskwarrior
			ffmpeg
			obs-studio
			kdePackages.kdenlive
			lmms
			kdePackages.dolphin
			shutter
			thunderbird
			docker_27
			virtualbox
			lazygit
			rustup
			go
			kotlin
			ruby
			postgresql
			sqlite
			redis
			pgadmin4
			R
			rstudio
			rstudio-server
			luajit
			samba
			nginx
			apacheHttpd
			libgcc
			gnumake
			xmake
			cmake
			elixir
			elixir-ls
			gleam
			glas
			python3
			pypy3
			python312Packages.pip
			python312Packages.jupyter-core
			typescript
			nodejs_22
			yarn
			vite
			jdk
			lunarvim
			jetbrains.idea-ultimate
			];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
	services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This option defines the first version of NixOS you have installed on this particular machine,
# and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
#
# Most users should NEVER change this value after the initial install, for any reason,
# even if you've upgraded your system to a new NixOS release.
#
# This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
# so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
# to actually do that.
#
# This value being lower than the current NixOS release does NOT mean your system is
# out of date, out of support, or vulnerable.
#
# Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
# and migrated your data accordingly.
#
# For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
	system.stateVersion = "24.05"; # Did you read the comment?

}



