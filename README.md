
# Welcome

![Bayport](/Bayport_Logo.png)

Welcome to Bayport's DevOps skills assessment.
Please use this template to create your own repository of this test and share your repo with us. Please answer all questions on this assessment.
# General Instructions
* Click on the "Use This Template" button. This will allow you to create a copy of this repository on your own GitHub account.
* Give your repository a name. Keep the repository public as you'll need to share it with us to review.
* When you've completed all the questions, share your repository with us by sending us the repo's URL.
# Linux
* What is the command to list the contents of a direcory, line by line and ordered by size ascending in human readable format?

 ``` Ls -1 -Sr -H  ```
 
* How would you add a DNS server to a network interface in Linux? 

 By editing the /etc/network/interface file so to set the Ethernet / eth0 - and confifigure the DNS- (dns-nameservers IP_ADDRESS) once done , Run the sudo ifup eth0 command to verify 

* If the DNS server you've just added is not reachable, how can you get any particular hostname to resolve locally? 

Run the ```nslookup``` Command, with domain name/ IP Address, 

* How would you check for SELinux related errors?

 The first step to take is to check the audit log , the run the analysis command to check the root source by running the ```sealert``` and the ```journalctl -t```

* Write the commands to add 30GB disk space to a logical volume named "docker" that belongs to a logical group named "docker-group".

```lvextend -L+30G /dev/docker-group/docker```

* In the root of this repository, create a Bash script called "listit.sh", when executed, this script must do the following (in order):

    * Create a file called directories.list that contains the directory names only of the current directory.
    * Add a line at the beginning of the directories.list file that reads "line one's line".
    * Output the first three lines of directories.list on the console.
    * Accept an integer parameter when executed and repeat the previous question's output x amount of times based on the parameter provided at execution.

* Commit and push your changes.

# Docker
* In the root of this repository, create a Dockerfile that is based on the latest mariadb image.
    * Expose port 3307.
    * Define an evironment variable called BRUCE with a value of WAYNE.
    * Run a command that will output the value from BRUCE into a file called BATCAVE in the root directory of the container. 
* Create a Bash script in the root of this repository called FLY.sh that will do the following:
    * Install Docker if it is not yet installed.
    * Ensure the installed version of Docker is the latest version available.
    * Start a container using the image you've craeted above with your Dockerfile - this container must run as follows:
        * It must be named ALFRED.
        * It must mount /var/lib/mysql to the host operating system to /var/lib/mysql.
        * It must mount /BATCAVE to the host operating system.
    * Checks whether a container exists called ALFRED and if it does, removes an recreates it.
    * Create a schema in the database called "wayneindustries" with one table in it called "fox" with columns "ID" and "Name".
    * Insert an entry with ID "50" and Name "BATMOBILE".
* Create an encrypted file called "secret" in the root of this repository that contains the root password of the database (the password must be "thisisadatabasepassword123456789!").
* Change your Bash script to start the conainer using the root password from the "secret" file.
* Commit and push your changes.

# OpenShift / OKD For the questions below, please make use of the OpenShift CLI (oc) where applicable.
* Write the command used to login to a remote OpenShift cluster.

```oc login ```

* Write the command to add the "cluster-admin" cluster role to a user called "clark".

```oc create clusterrolebinding registry-controller \
--clusterrole=cluster-admin --user=clark```


* Write the command used to list all pods in the "smallville" project (namespace).
```oc adm top pod --smallville=''```

* Write the command to scale an application (deployment config) called "dailyplanet" to 2 pods.

```oc scale deploy dailyplanet--replicas=2```

* Write the command to gain remote shell access to a pod called "lex" in the "smallville" project (namespace).

```oc project``` then 
```oc rsh lex``` 

* Write the command to export a secret called "loislane" in JSon format, the secret is in the "dailyplanet" project (namespace). 


* Add a file called "Krypton" (in YAML format) to this repo that contains the resource defintion for a Persistent Volume Claim with the following properties:
    * Points to a Persistent Volume called "zod".
    * Requests 5GB of storage.
    * The volume can be mounted as read-write by more than one node.
# General
* How would you ensure any change made to this Dockerfile is source controlled, approved, tested and deployed. Explain which tools you will use as if this was going into a production environment.
* Commit and push your changes.


For delivery process I would a ci/cd tool like Jenkins and create pipeline steps that will manage the pulling of the source/compiled code(inthis case the doker file), deployment and testing thereof.

My source controll of my docker file will maintained in a GIT(bitbucket,github etc) repo. I will have development branch for the development stage of the docker file and a Master branch that will be used to deploy the final product. I will ensure that any merges to the Master branch will go through an approval proccess (i.e. pull request). 

For the testing portion I will look at getting a  test automation framework like JMeter for api testing, Selenium for the ui and other relevant tools that can be used.

For the deployment part since it's a docker file I could create a shell script like the one created above to deploy the image or I could also use docker-compose. 

The pipeline that I mentioned above can use the tools metinoed as well in the steps for delivery to pro.

My Pipe line steps 

Step 1 = Checkout the docker file and/script from devlopment branch first 
Step 2 = run the deployment script 
Step 3 = once the application is succefully deployed to a development environment the I run the automation framework
Step 4 = Once the test are succesfully completed in the develoment environment then I can start invoking a pull request to Master of the Development branch
Step 5 = I could have a webhool that checks if approvals are completed and the deploy to merge the branch and deploy to production.
