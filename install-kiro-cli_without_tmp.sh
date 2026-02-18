#!/bin/bash
#set -e
set -x

INSTALL_DIR="$HOME/.kiro-install-tmp"
mkdir -p "$INSTALL_DIR"

export TMPDIR="$INSTALL_DIR"

if [ -f /etc/system-release ] && grep -q "Amazon Linux release 2" /etc/system-release; then
    /tmp/curl-new --cacert /etc/pki/tls/certs/ca-bundle.crt -fsSL https://cli.kiro.dev/install | bash
else
    /usr/bin/curl -fsSL https://cli.kiro.dev/install | bash
fi

rm -rf "$INSTALL_DIR"

export PATH="/home/ec2-user/.local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ec2-user/.local/bin:/home/ec2-user/bin"
/home/ec2-user/.local/bin/kiro-cli login --use-device-flow
kiro-cli
#sh-5.2$ kiro-cli
#
#Welcome to Kiro CLI, let's get you signed in!
#
#Press enter to continue to the browser or esc to cancel
#
#▰▰▱▱▱▱▱ Opening browser... | Press (^) + C to cancelFailed to open browser for authentication.
#Please try again with: kiro-cli login --use-device-flow
#error: No such file or directory (os error 2)
