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
set -e

INSTALL_DIR="\$HOME/.kiro-install-tmp"
mkdir -p "\$INSTALL_DIR"

export TMPDIR="\$INSTALL_DIR"
curl -fsSL https://cli.kiro.dev/install | bash

rm -rf "\$INSTALL_DIR"

export PATH="$HOME/.local/bin:$PATH"
$HOME/.local/bin/kiro-cli login --use-device-flow
kiro-cli
EOF
chmod u+x ./install-kiro-cli.sh
./install-kiro-cli.sh
```

### Next, select "Use with Builder ID", and follow the instructions on the command line.
