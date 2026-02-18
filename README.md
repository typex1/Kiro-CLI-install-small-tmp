# Kiro-CLI-install

Official instructions: https://kiro.dev/docs/cli/installation/
  
If space under /tmp is not sufficient, follow these steps to unpack the zip file in $HOME:<br/>
  
### Make sure that you use the ec2-user:
```
sudo su - ec2-user
```

### Install Kiro CLI without using /tmp:
```
cat<<EOF>./install-kiro-cli.sh
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
EOF
chmod u+x ./install-kiro-cli.sh
./install-kiro-cli.sh
```

### Next, select "Use with Builder ID", and follow the instructions on the command line.
