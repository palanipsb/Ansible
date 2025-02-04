#master node:
sudo apt update

ssh-keygen -t rsa

cat authorized_keys #(Then copy this key to remote servers)

#Remote servers:
cd ~/.ssh
vi authorized_keys
sudo chmod 700 ~/.ssh
sudo chmod 600 ~/.ssh/authorized_keys

ssh ubuntu@<IP address of Remote> #Test connection

sudo apt install ansible-core -y

#Create inventory file
vi inventory

example:
[we1]
<IP address of Remote>

[web]2
<IP address of Remote>

ansible all -i inventory -m ping #Test connection

ansible web1 -i inventory -m setup

ansible all -i inventory -m shell -a "sudo apt update"

ansible all -i inventory -m shell -a "sudo apt install maven -y"

touch test.txt

ansible all -m copy -a "src=/home/ubuntu/test.txt dest=/home/ubuntu/test.txt"

ansible all -i inventory -b -m apt -a "name=nginx state=present"

ansible all -i inventory -b -m user -a "name=testuser state=present"
