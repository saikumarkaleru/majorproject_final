
sudo cat<<EOF | sudo tee -a /etc/sudoers
ubuntu ALL=(ALL) NOPASSWD: ALL
EOF


echo 'Docker instlalation'

#sudo yum update -y
sudo apt-get update

#sudo yum -y install docker
sudo apt install docker.io -y
#sudo service docker start
#sudo service enable docker
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service


#sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker ubuntu

#sudo usermod -aG docker $(whoami)
sudo chmod 666 /var/run/docker.sock

#sudo su 
sudo cat<<EOF | sudo tee /etc/docker/daemon.json
{
   "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF
sudo systemctl restart docker


echo 'KUBERENETES INSTALLATION'


cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl



#--------------NODE

### Node.js v16 ###
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt install -y nodejs vim