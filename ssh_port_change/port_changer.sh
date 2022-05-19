###Change the port number as you required"
new_port_number_for_ssh=9111

sshd_config='/etc/ssh/sshd_config'

# sshd_config='sshd_config.txt'
############
##  Don't edit the below code
##  set -x

new_word="Port $new_port_number_for_ssh"

existing_port=$(cat $sshd_config | grep -e "Port" | awk 'FNR==1 {print}')

echo This is the existing  $existing_port. It will be changed to $new_port_number_for_ssh

sudo sed -i "s/$existing_port/$new_word/g" $sshd_config
cat $sshd_config | grep -e "Port"

# remove comment if need to restart ssh service
sudo service sshd restart

service sshd status
