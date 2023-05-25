sudo apt-get update
sudo apt-get upgrade

read -rp "Enter the USERNAME of the new user account: " USERNAME
sudo adduser $USERNAME
sudo usermod -a -G sudo $USERNAME
echo "Password"
passwd $USERNAME
mkdir /home/$USERNAME
chown $USERNAME:$username /home/$USERNAME
mkdir /home/$USERNAME/.ssh
read -rp "Enter generated publick ssh key for ${USERNAME}: " SSH_KEY
echo "$SSH_KEY" > /home/$USERNAME/.ssh/authorized_keys

sudo apt install git

sudo apt-get install docker.io
sudo apt-get install docker-compose
sudo groupadd docker
sudo usermod -aG docker $USERNAME
newgrp docker

sudo apt-get install neovim

sudo apt-get install fish
chsh -s /usr/bin/fish

sudo apt install ncdu

sudo apt install ranger
