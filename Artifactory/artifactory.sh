#STEP-1: INSTALLING GIT JAVA-1.8.0 and Set PATH
yum install git java-1.8.0-openjdk -y
cd /opt 
wget https://jfrog.bintray.com/artifactory/jfrog-artifactory-oss-6.9.6.zip
unzip jfrog-artifactory-oss-6.9.6.zip
ls
cd artifactory-oss-6.9.6/
ll
cd bin
./artifactory.sh start
