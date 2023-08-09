#### Artifactory Server (must need instance type is t2.medium & Security group must add 8081,8082)

#STEP-1: INSTALLING GIT JAVA-1.8.0 and Set PATH
yum install git -y
amazon-linux-extras install java-openjdk11 -y

#STEP-2: GETTING THE REPO (jFrog oss --> download -- > RPM --> Copy Command)
wget https://releases.jfrog.io/artifactory/artifactory-rpms/artifactory-rpms.repo -O jfrog-artifactory-rpms.repo;
sudo mv jfrog-artifactory-rpms.repo /etc/yum.repos.d/;
sudo yum update && sudo yum install jfrog-artifactory-oss

#STEP-4: RESTARTING ARTIFACTORY Service (when we download service it will on stopped state)
systemctl start artifactory.service
systemctl enable artifactory.service
systemctl status artifactory.service

############# by default stored files in artifactory --> artifacts

# Login into Artifactory Server <public-ip:8081> --> Give user: admin password: password
  # Change Password: Mahesh@1234
  # Check logout and login again
  # create a new user in JFrog --> password and give admininstrative permissions --> save it

# go to Jenkins Server Console --> Manage Jenkins --> Plugins --> available Plugins --> type: Artifactory --> install
# Manage Jenkins --> System --> JFrog --> Instance id : JFrog or Artifactory $ Artifactory of URL : http://3.87.6.10:8082 
# --> Give Username : ciadmin Password: Admin@1234 from JFrog created new User and Test it
# Manage Jenkins --> Tools --> Maven ---> add --> Select version --> 3.8.8 --> Save

########
# 1...Create one Maven Project --> git is : https://github.com/maheshrebba98/hello-world.git --> Pre Steps --> Build: pom.xml & Goals: clean install or clean package
    # Add Post Build Actions : Deploy to Artifacts to Artifactory --> refresh repositories --> select: lib-release-local & lib-snapshot-local --> save 

   # Finally Build it and check it from build console or jfrog console.
#########

# 2...Create one Freestyle Project --> git is : https://github.com/maheshrebba98/hello-world.git --> Build Environment -->  
    # Maven3-Artifactory Integration: --> refresh repositories --> select: lib-release-local & lib-snapshot-local --> 
    # Add Build Steps: Invoke Artifactory Maven 3 --> Maven Name: Maven3, Root POM: pom.xml & Goals: clean install or clean package --> save 

   # Finally Build it and check it from build console or jfrog console.
