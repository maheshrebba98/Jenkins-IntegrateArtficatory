### Jenkins Server

#STEP-1: INSTALLING GIT JAVA-1.8.0 and Set PATH
yum install git java-1.8.0-openjdk -y

# vi .bash_profile ------> find / -name java
# export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.amzn2.0.1.x86_64
# PATH=$PATH:$JAVA_HOME:$HOME/bin
# su -
# echo $PATH

#STEP-2: GETTING THE REPO (jenkins.io --> download -- > redhat)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: DOWNLOAD JAVA11 AND JENKINS 
amazon-linux-extras install java-openjdk11 -y
yum install jenkins -y
update-alternatives --config java

#STEP-4: RESTARTING JENKINS (when we download service it will on stopped state)
systemctl start jenkins.service
systemctl status jenkins.service

##################
# Login into Jenkins <public_ip:8080> --> install plugins --> setup --> Manage Jenkins --> global tool config --> JDK --> 
   # Name : Java
   # JAVA_HOME: /usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.amzn2.0.1.x86_64
   # Apply and Save
