# AWS-DevSecOps-Project
AWS DevSecOps Project

### Architectural Diagram
![Diagram](Architectural-Diagram-St2_Animated.gif)

### Youtube Video
https://youtu.be/mIU6f14Mvhw

# Prerequisites

- AWS Account
- Github account
- Snyk Account

# Services Covered

- AWS CodeCommit
- AWS CodeBuild, CodePipeline
- AWS ECR (Elastic Container Registry)
- AWS ECS (Elastic Container Service)


# Step 1

- Create codecommit repository
- Clone the project repository from github (Open cloudshell and clone the repo using below command)

To create code commit repository follow the below steps;


![image](screenshots/1.png)

![image](screenshots/2.png)

![image](screenshots/3.png)

**Once the codecommit repository has been created we need to clone the project repository from github. To get the project repo click on the link below;**

```
git clone https://github.com/sanju2/AWS-DevSecOps-Project.git
```

 **To clone the repository from github to codecommit we can use cloudshell from AWS**

 -	Click on the icon to open cloudshell terminal

 ![image](screenshots/4.png)

![image](screenshots/5.png)

**It will ask you enter username and password. Enter username as your github username and under password we need to add the access token of github. If you don’t know how to create access token then follow the below steps;**

### Create access token

Go to Github and click on your profile --> settings

![image](screenshots/6.png)

**Go to github settings and scroll down to the bottom. In the left hand side you can see an option called Developer settings. Open that tab.**

![image](screenshots/7.png)

![image](screenshots/8.png)

**Click on generate new token (classic) tab to generate an access token. Make sure you keep it somewhere safe.**

Go back to cloudshell and clone using this token.


Now we have cloned the repository from github. Next we need to push the code to codecommit repository. Let's see how to do that;

#### Push project repo to codecommit repository 

**To do this first we need to generate access token for IAM user as well. To create github access keys for IAM user follow the below steps;
Go to IAM console and open the IAM user that you have logged in or using.**

![image](screenshots/9.png)

**Click on security credentials and scroll towards HTTPS Git credentials for AWS CodeCommit**

![image](screenshots/10.png)

![image](screenshots/11.png)

**Click on generate credentials and don’t forget to download the credentials**

**Once the credentials has been generated we can go ahead and push the git repo to codecommit**

![image](screenshots/12.png)

-	Copy the codecommit HTTPS url and go to cloudshell

```
#Change directory to the mirror repo and enter the below command.
git push https://git-codecommit.us-east-2.amazonaws.com/v1/repos/AWS-DevSecOps-Project
```
(under username and password enter the username and password created for HTTPS Git credentials for AWS CodeCommit)

![image](screenshots/13.png)

**Now if we go to codecommit repository we can see all the code has been pushed😎.**

![image](screenshots/14.png)



# Step 2

- Create ECR repository

To create ECR repository follow the below steps;

![image](screenshots/15.png)

![image](screenshots/16.png)


![image](screenshots/17.png)



# Step 3 
- Create Build project
- Add ECR permission for the IAM role create for build project.

Go to codecommit console page and under codebuild click on build projects

![image](screenshots/18.png)

![image](screenshots/19.png)
![image](screenshots/20.png)
![image](screenshots/21.png)
![image](screenshots/22.png)

**Expand additional configuration to add the environment variables and add the below variables.**
(Make sure add the region and ECR repo name as per your configuration.)

![image](screenshots/23.png)

| AWS_DEFAULT_REGION  | Region (eg: us-east-1) |
| --- | --- |
| AWS_ACCOUNT_ID  | <AWS_A/C_ID>  |
| IMAGE_TAG  | latest  |
| IMAGE_REPO_NAME | ECR_repo_name |

![image](screenshots/24.png)



- Once the codebuild has been created click on start build.

![image](screenshots/25.png)

![image](screenshots/26.png)

**We can see the build got failed. The error is because of the role permission. We need to manually add the ECR permission for the IAM role. To do that go to codebuild IAM role and add the ECR permission.**

(Click on the service role and it will open the IAM role interface.)

![image](screenshots/27.png)

![image](screenshots/28.png)

Add the below policy in the IAM role 
```
{
    "Statement": [
      {
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:GetAuthorizationToken",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ],
        "Resource": "*",
        "Effect": "Allow"
      }
    ],
    "Version": "2012-10-17"
  }

```
-	Give any role name and click on create policy
![image](screenshots/29.png)

**Once you add inline policy then try build again. This time we can see it is success**

![image](screenshots/30.png)

**If you are still getting the error then check the IAM role and make sure you have the below permissions attached**

![image](screenshots/31.png)

![image](screenshots/32.png)

**Now we can see the build process is success. If we go to ECR repository we can see the image uploaded.**

![image](screenshots/33.png)

 
# Step 4
- Create pipeline

To create codepipeline follow the below steps;
 

![image](screenshots/34.png)

![image](screenshots/35.png)

![image](screenshots/36.png)

![image](screenshots/37.png)

![image](screenshots/38.png)

![image](screenshots/39.png)

**Skip deploy stage and create pipeline**

![image](screenshots/40.png)

**Wait for some time and we can see the pipeline success**

![image](screenshots/41.png)

**If you are facing any issue while creating pipeline then add the ECR permission we have added for codebuild to the code pipeline role as well.**

# Step 5

### Add Snyk Stage

- Add new stage and connect the snyk account to check the vulnerabilities.
- If you don’t have a Snyk account then click the link below and sign up.
```
https://snyk.io/
```

- Once the snyk account has been created we need to add the snyk stage in the code pipeline. To do that follow the below steps;

![image](screenshots/42.png)

![image](screenshots/43.png)

![image](screenshots/44.png)

![image](screenshots/45.png)

![image](screenshots/46.png)


- It will prompt to enter the username and password of Snyk account. Once you fill the details the SNyk will get connected to our code pipeline

![image](screenshots/47.png)

![image](screenshots/48.png)


![image](screenshots/49.png)

Once you add the stage click on Save



# Step 6
- Create ECS cluster

![image](screenshots/50.png)

![image](screenshots/51.png)

Creating cluster may take sometime.

- Create task definition (add port 5000 because our app is running in this port also add tag:latest after the image URI) (Also make sure under container name give the same name as ECR name)

![image](screenshots/52.png)


![image](screenshots/53.png)

Under Image URL add the ECR latest image (make sure to add :latest in the end)

Leave everuthing default and click on save.

![image](screenshots/54.png)


- Create service (make sure the security group has port 5000 added)
To create service click on the Deploy dropdown and click on create service.

![image](screenshots/55.png)

Select the cluster we created 

![image](screenshots/56.png)

![image](screenshots/57.png)

![image](screenshots/58.png)

Uncheck the circuit breaker and give any service name then click on create. (Make sure the security group has port 5000 added in the inbound rule)


- Once service has been created we can see the task running. Go to networking from task tab and copy the Public IP and add :5000 in the end. And we can see our app running.

![image](screenshots/59.png)

![image](screenshots/60.png)

Now if we copy the public IP and add port 5000 we can see like below;

![image](screenshots/61.png)


# Step 7
- Deployment
Add new stage in pipeline called deployment and add the ECS cluster in that. To do that go code pipeline we created and click on edit --> Add new stage after build and follow the below steps;

![image](screenshots/62.png)

Once added the deploy stage click on done and save.

![image](screenshots/63.png)

Click on release change and after some time we can see the pipeline is successful.

![image](screenshots/64.png)

- If you want to make any changes in the code  make the changes **app.py** and deploy it again using pipeline. If the deployment is successful we will see the changes.

![image](screenshots/65.png)


I have made some changes in the code and above you can see the changes succesfully completed. 

# Clean Up

- AWS ECS: Remove Service, Task Definition & Cluster.
- AWS Dev Tools: Remove CodePipeline, CodeBuild, CodeDeploy & CodeCommit Repository.
- AWS S3: Remove Artefact Bucket.
- AWS IAM: Remove Service Role.
- AWS ECR: Remove the repository.
- AWS EC2 Security Group: Remove the SG.

### Thank You! :shipit:



------------------------------------------------------------------------------------------------------------------
