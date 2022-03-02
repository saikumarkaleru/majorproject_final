#https://stackoverflow.com/questions/53918841/how-to-install-docker-on-amazon-linux2
#https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html
#https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-centos-7
#https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/


echo 'Docker instlalation'

#sudo yum update -y
sudo apt-get update

#sudo yum -y install docker
#sudo apt install docker.io -y
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


echo 'KUBERENETES INSTALLATION'

#sudo kubeadm reset

sudo kubeadm init
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"


sleep 20

#node name -- private ip
#
hostname=$(hostname)
kubectl taint nodes  $hostname node-role.kubernetes.io/master-

sudo apt install openjdk-11-jre -y 
