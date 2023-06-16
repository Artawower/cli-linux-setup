sudo apt-get update
sudo apt-get upgrade

read -rp "Enter the USERNAME of the new user account: " USERNAME

if id "$USERNAME" >/dev/null 2>&1; then
    echo "User $USERNAME already exists."
else
    sudo adduser $USERNAME
    sudo usermod -a -G sudo $USERNAME
    echo "Password"
    passwd $USERNAME
    mkdir /home/$USERNAME
    mkdir /home/$USERNAME/.ssh
    chown -R $USERNAME:$USERNAME /home/$USERNAME
    read -rp "Enter generated publick ssh key for ${USERNAME}: " SSH_KEY
    echo "$SSH_KEY" > /home/$USERNAME/.ssh/authorized_keys
    usermod -aG sudo $USERNAME
    sudo su $USERNAME -c 'cd ~/.ssh/ && ssh-keygen' 
fi

sudo apt install git

sudo apt-get install docker.io
sudo apt-get install docker-compose
sudo groupadd docker
sudo usermod -aG docker $USERNAME

sudo su $USERNAME -c 'sudo apt-get install neovim'

sudo su $USERNAME -c 'sudo apt-get install fish'
sudo su $USERNAME -c 'chsh -s /usr/bin/fish'

sudo su $USERNAME -c 'sudo apt install ncdu'

sudo su $USERNAME -c 'sudo apt install ranger'

echo "The setup was successfully finished!"
