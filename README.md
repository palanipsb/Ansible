Ansible Automation Project
This project demonstrates how to set up Ansible for automating tasks across multiple remote servers. Below are the steps and commands used to configure the master node, generate SSH keys, create an inventory file, and execute Ansible commands.

Steps
1. Update the Master Node
Update the package list on the master node (Linux):


sudo apt update
2. Generate SSH Key
Generate an SSH key pair on the master node for secure communication with remote servers:


ssh-keygen -t rsa
Press Enter to accept the default file location and passphrase.

3. Copy SSH Key to Remote Servers
Copy the public key to the remote servers for passwordless authentication:


cat ~/.ssh/id_rsa.pub
Add the public key to the ~/.ssh/authorized_keys file on each remote server.

4. Set Permissions for SSH Directory
Ensure proper permissions for the .ssh directory and authorized_keys file on remote servers:


sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys
5. Test SSH Connection
Test the SSH connection to the remote servers:


ssh ubuntu@<IP address of Remote>
6. Install Ansible on Master Node
Install Ansible on the master node:


sudo apt install ansible-core -y
7. Create Inventory File
Create an inventory file to define the remote servers:


vi inventory
Example inventory file:

ini
Copy
[web1]
<IP address of Remote>

[web2]
<IP address of Remote>
8. Test Ansible Connection
Test the connection to all servers in the inventory:


ansible all -i inventory -m ping
9. Gather Facts from Remote Servers
Gather system information from a specific server:


ansible web1 -i inventory -m setup
10. Update Packages on Remote Servers
Update the package list on all remote servers:


ansible all -i inventory -m shell -a "sudo apt update"
11. Install Maven on Remote Servers
Install Maven on all remote servers:


ansible all -i inventory -m shell -a "sudo apt install maven -y"
12. Copy a File to Remote Servers
Create a test file on the master node and copy it to all remote servers:


touch test.txt
ansible all -m copy -a "src=/home/ubuntu/test.txt dest=/home/ubuntu/test.txt"
13. Install Nginx on Remote Servers
Install Nginx on all remote servers using Ansible's apt module:


ansible all -i inventory -b -m apt -a "name=nginx state=present"
14. Create a User on Remote Servers
Create a user named testuser on all remote servers:


ansible all -i inventory -b -m user -a "name=testuser state=present"
Conclusion
This project demonstrates the basics of using Ansible for automating tasks across multiple servers. You can expand this setup by adding more tasks, playbooks, and configurations to suit your needs.
