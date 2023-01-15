
Debian
====================
This directory contains files used to package satoxcoind/satoxcoin-qt
for Debian-based Linux systems. If you compile satoxcoind/satoxcoin-qt yourself, there are some useful files here.

## satoxcoin: URI support ##


satoxcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install satoxcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your satoxcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/satoxcoin128.png` to `/usr/share/pixmaps`

satoxcoin-qt.protocol (KDE)

