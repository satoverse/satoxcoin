 #!/usr/bin/env bash

 # Execute this file to install the satoxcoin cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Satoxcoin-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Satoxcoin-Qt.app/Contents/MacOS/satoxcoind /usr/local/bin/satoxcoind
 sudo ln -s ${LOCATION}/Satoxcoin-Qt.app/Contents/MacOS/satoxcoin-cli /usr/local/bin/satoxcoin-cli
