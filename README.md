# Kiro-CLI-install for ssm-user

Official instructions: https://kiro.dev/docs/cli/installation/
  
If space under /tmp is not sufficient, follow these steps to unpack the zip file in $HOME:<br/>

### In case you are ssm-user, make sure that your home-dir and files are yours:
```
cd && sudo chown -R ssm-user:ssm-user .
# make "kiro-cli" available through PATH variable:
cat > ~/.bashrc << 'EOF'
export PATH="$HOME/.local/bin:$PATH"
sudo rm -rf /tmp/*
EOF
bash

```

### Install Kiro CLI without using /tmp, as user "ssm-user":
```
cat<<'EOF'>./install-kiro-cli.sh
#!/bin/bash
set -e
#set -x

INSTALL_DIR="$HOME/.kiro-install-tmp"
mkdir -p "$INSTALL_DIR"

export TMPDIR="$INSTALL_DIR"

if [ -f /etc/system-release ] && grep -q "Amazon Linux release 2" /etc/system-release; then
    wget https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64 -O /tmp/curl-new
    chmod +x /tmp/curl-new
    /tmp/curl-new --cacert /etc/pki/tls/certs/ca-bundle.crt -fsSL https://cli.kiro.dev/install | bash
else
    /usr/bin/curl -fsSL https://cli.kiro.dev/install | bash
fi

rm -rf "$INSTALL_DIR"

export PATH="/home/ssm-user/.local/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/ssm-user/.local/bin:/home/ssm-user/bin"
/home/ssm-user/.local/bin/kiro-cli login --use-device-flow
kiro-cli
EOF
chmod u+x ./install-kiro-cli.sh
./install-kiro-cli.sh

```

### Next, select "Use with Builder ID", and follow the instructions on the command line.

-----------
-----------

### In case you MUST be "ec2-user", make sure that switch-user to ec2-user:
```
sudo su - ec2-user
```

### Install Kiro CLI without using /tmp, as user "ec2-user":
```
cat<<'EOF'>./install-kiro-cli.sh
#!/bin/bash
set -e
#set -x

INSTALL_DIR="$HOME/.kiro-install-tmp"
mkdir -p "$INSTALL_DIR"

export TMPDIR="$INSTALL_DIR"

if [ -f /etc/system-release ] && grep -q "Amazon Linux release 2" /etc/system-release; then
    wget https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64 -O /tmp/curl-new
    chmod +x /tmp/curl-new
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
