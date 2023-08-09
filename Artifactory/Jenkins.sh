### Jenkins Server

#STEP-1: INSTALLING GIT JAVA-1.8.0 and Set PATH
yum install git java-1.8.0-openjdk -y

# vi .bash_profile ------> find / -name java
# export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.382.b05-1.amzn2.0.1.x86_64
# PATH=$PATH:$JAVA_HOME:$HOME/bin
# sudo su -
# echo $PATH

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: DOWNLOAD JENKINS 
yum install jenkins -y

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service

##################
# Login into Jenkins <public_ip:8080> --> install plugins --> setup --> Manage Jenkins --> global tool config --> JDK --> 
   # Name : Java
   # JAVA_HOME: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.382.b05-1.amzn2.0.1.x86_64
   # Apply and Save
