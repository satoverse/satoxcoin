VERSION=2.0.0.0
rm -rf ./release-linux
mkdir release-linux

cp ./src/satoxcoind ./release-linux/
cp ./src/satoxcoin-cli ./release-linux/
cp ./src/qt/satoxcoin-qt ./release-linux/
cp ./satoxcoin_small.png ./release-linux/

cd ./release-linux/
strip satoxcoind
strip satoxcoin-cli
strip satoxcoin-qt

#==========================================================
# prepare for packaging deb file.

mkdir satoxcoincoin-$VERSION
cd satoxcoincoin-$VERSION
mkdir -p DEBIAN
echo 'Package: satoxcoincoin
Version: '$VERSION'
Section: base 
Priority: optional 
Architecture: all 
Depends:
Maintainer: Satoxcoin
Description: Satoxcoin coin wallet and service.
' > ./DEBIAN/control
mkdir -p ./usr/local/bin/
cp ../satoxcoind ./usr/local/bin/
cp ../satoxcoin-cli ./usr/local/bin/
cp ../satoxcoin-qt ./usr/local/bin/

# prepare for desktop shortcut
mkdir -p ./usr/share/icons/
cp ../satoxcoin_small.png ./usr/share/icons/
mkdir -p ./usr/share/applications/
echo '
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/local/bin/satoxcoin-qt
Name=satoxcoincoin
Comment= satoxcoin coin wallet
Icon=/usr/share/icons/satoxcoin_small.png
' > ./usr/share/applications/satoxcoincoin.desktop

cd ../
# build deb file.
dpkg-deb --build satoxcoincoin-$VERSION

#==========================================================
# build rpm package
rm -rf ~/rpmbuild/
mkdir -p ~/rpmbuild/{RPMS,SRPMS,BUILD,SOURCES,SPECS,tmp}

cat <<EOF >~/.rpmmacros
%_topdir   %(echo $HOME)/rpmbuild
%_tmppath  %{_topdir}/tmp
EOF

#prepare for build rpm package.
rm -rf satoxcoincoin-$VERSION
mkdir satoxcoincoin-$VERSION
cd satoxcoincoin-$VERSION

mkdir -p ./usr/bin/
cp ../satoxcoind ./usr/bin/
cp ../satoxcoin-cli ./usr/bin/
cp ../satoxcoin-qt ./usr/bin/

# prepare for desktop shortcut
mkdir -p ./usr/share/icons/
cp ../satoxcoin_small.png ./usr/share/icons/
mkdir -p ./usr/share/applications/
echo '
[Desktop Entry]
Version=2.0.0.0
Type=Application
Terminal=false
Exec=/usr/bin/satoxcoin-qt
Name=satoxcoincoin
Comment= satoxcoin coin wallet
Icon=/usr/share/icons/satoxcoin_small.png
' > ./usr/share/applications/satoxcoincoin.desktop
cd ../

# make tar ball to source folder.
tar -zcvf satoxcoincoin-$VERSION.tar.gz ./satoxcoincoin-$VERSION
cp satoxcoincoin-$VERSION.tar.gz ~/rpmbuild/SOURCES/

# build rpm package.
cd ~/rpmbuild

cat <<EOF > SPECS/satoxcoincoin.spec
# Don't try fancy stuff like debuginfo, which is useless on binary-only
# packages. Don't strip binary too
# Be sure buildpolicy set to do nothing

Summary: Satoxcoin wallet rpm package
Name: satoxcoincoin
Version: $VERSION
Release: 1
License: MIT
SOURCE0 : %{name}-%{version}.tar.gz
URL: https://www.satoverse.io/

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
%{summary}

%prep
%setup -q

%build
# Empty section.

%install
rm -rf %{buildroot}
mkdir -p  %{buildroot}

# in builddir
cp -a * %{buildroot}


%clean
rm -rf %{buildroot}


%files
/usr/share/applications/satoxcoincoin.desktop
/usr/share/icons/satoxcoin_small.png
%defattr(-,root,root,-)
%{_bindir}/*

%changelog
* Sat Jan 28 2023  Satoxcoin Project Team.
- First Build

EOF

rpmbuild -ba SPECS/satoxcoincoin.spec



