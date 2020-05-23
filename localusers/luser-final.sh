read -p "Enter new username: " USERNAME
read -p "Enter new password: " PASSWORD

useradd -m ${USERNAME}
echo ${PASSWORD} | passwd --stdin -e ${USERNAME}
