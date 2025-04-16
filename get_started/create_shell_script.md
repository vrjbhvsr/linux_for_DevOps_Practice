
# 🚀Get started With Linux🐧

This repo contains the basic bash scripts that shows the linux commands that can be used on daily basis on my DevOps journey. Such as file handling commands, file permission commands etc.

## 🛠️Create shell scripts

I have created the bash scripts to show how the commands work. The bash scripts are saved with `.sh` files.

To create any bash script, we need to define `#!/bin/bash` line at the beginning of the editor. I am using vim editor to create scripts.

*⚙️ To use vim editor i have first installed vim by running the following command in termainal.*

```
sudo apt install vim
```
*⚙️ To open or create `.sh` files.*

```
vim hello_world.sh

```

### 📝 Creating first shell script

```bash
#!/bin/bash

echo "Hello world! I am excited to start my Devops journey."
```

*🔧 To make the script executable i used the following command.*
```sh
chmod +x hello_world.sh
```
*▶️ To run the script*
```
./hello_world.sh
