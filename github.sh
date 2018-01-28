echo "Performing Github Setup .."
echo "Enter your Github username: "
read github_username
echo "Enter your Github email address: "
read github_email_address

if [[ $github_username && github_email_address ]]; then
    git config --global user.name $github_username
    git config --global user.email $github_email_address
    git config --global github.user $github_user
    
    cd $HOME/.ssh
    ssh-keygen -t rsa -C $github_email_address
    echo "Add the SSH public key located at $Home/.ssh/$github_email_address to your account."
fi

cd $current_repo
