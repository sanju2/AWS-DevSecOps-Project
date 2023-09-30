# AWS-DevSecOps-Project
AWS DevSecOps Project

### Architectural Diagram
![Diagram](Architectural-Diagram-St2_Animated.gif)


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


![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/0d0c9fbe-3fad-4ae4-a076-69168dbb44f8)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/22c3aef3-9e1c-4fce-8c20-5bc13133fa52)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/97335463-d316-4e6b-bb9b-08e46788e9da)

**Once the codecommit repository has been created we need to clone the project repository from github. To get the project repo click on the link below;**

```
https://github.com/sanju2/AWS-DevSecOps-Project.git
```

 **To clone the repository from github to codecommit we can use cloudshell from AWS**

 -	Click on the icon to open cloudshell terminal

 ![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/c4b68e90-15a2-4019-abc1-9a6c64154776)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/8dd04d1b-f6c7-46dd-9d48-4f49b26ee53d)

**It will ask you enter username and password. Enter username as your github username and under password we need to add the access token of github. If you don’t know how to create access token then follow the below steps;**

### Create access token

Go to Github and click on your profile --> settings

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/53e260d9-a979-4371-9ba2-bfe3909590b7)

**Go to github settings and scroll down to the bottom. In the left hand side you can see an option called Developer settings. Open that tab.**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/e8b7443f-0920-4b2f-b5cc-795b8d32e955)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/dd513f24-a4e0-4e4f-beae-906aaea75c48)

**Click on generate new token (classic) tab to generate an access token. Make sure you keep it somewhere safe.**

Go back to cloudshell and clone using this token.

- Next we need to mirror the repository we cloned. To mirror use the below commnad (if you are getting any error says name already exist the change the name or repository.)

```
git clone --mirror https://github.com/sanju2/AWS-DevSecOps-Project.git AWS-DevSecOps-Project
```

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/6cad8bb5-a3d0-46f2-aea5-59f8fc5a7413)

Now we have cloned and mirror the repository from github. Next we need to push the code to codecommit repository. Let's see how to do that;

#### Push project repo to codecommit repository 

**To do this first we need to generate access token for IAM user as well. To create github access keys for IAM user follow the below steps;
Go to IAM console and open the IAM user that you have logged in or using.**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/0ecf78d8-3253-4331-b841-1b16a0eabbc9)

**Click on security credentials and scroll towards HTTPS Git credentials for AWS CodeCommit**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/aa5ee7a0-62b9-4d21-b182-44ab184bf1a3)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/777c281b-6234-406b-a723-832f9afcf39b)

**Click on generate credentials and don’t forget to download the credentials**

**Once the credentials has been generated we can go ahead and push the git repo to codecommit**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/0dfbca76-76af-448e-8cf1-31910469b47a)

-	Copy the codecommit HTTPS url and go to cloudshell

```
#Change directory to the mirror repo and enter the below command.
git push https://git-codecommit.us-east-2.amazonaws.com/v1/repos/AWS-DevSecOps-Project
```
(under username and password enter the username and password created for HTTPS Git credentials for AWS CodeCommit)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/a1a364e8-4541-469a-9c25-fe68cecd51de)

**Now if we go to codecommit repository we can see all the code has been pushed😎.**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/a5a84031-8193-4652-8427-895aa1ca4522)



# Step 2

- Create ECR repository

# Step 3 
- Create Build project
- Add ECR permission for the IAM role create for build project.

# Step 4
- Create pipeline
- Add new stage and connect the snyk account to check the vulnerabilities.

# Step 5
- Create ECS cluster
- Create task definition (add port 5000 because our app is running in this port also add tag:latest after the image URI)
- Create service (make sure the security group has port 5000 added)
- Once service has been created we can see the task running. Go to networking from task tab and copy the Public IP and add :5000 in the end. And we can see our app running.

# Step 6
- Deployment
Add new stage in pipeline called deployment and add the ECS cluster in that. 
