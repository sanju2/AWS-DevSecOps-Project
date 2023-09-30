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

To create ECR repository follow the below steps;

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/c91a7664-e106-478a-8a03-7b17f221d4b3)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/7102175b-c560-42e3-bb12-0a58eddd9907)


![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/91fed4f3-2608-4b35-a808-222b1a417e01)



# Step 3 
- Create Build project
- Add ECR permission for the IAM role create for build project.

Go to codecommit console page and under codebuild click on build projects

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/ed53e254-975b-4853-a23e-f32f5f9f0c50)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/1f92856d-2ffd-43ed-aa6e-cce2ad8c5756)
![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/0b325bb8-5204-4749-a6a6-4544e11a8aad)
![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/20dd0a65-3540-4778-9906-05970865e46c)
![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/29a737b8-cf89-4403-9d81-be16cda28689)

**Expand additional configuration to add the environment variables and add the below variables.**
(Make sure add the region and ECR repo name as per your configuration.)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/5e020e3b-3915-425a-8899-dfedef4bf68a)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/9d000b25-2e80-4414-905a-00418a24ebae)

- Once the codebuild has been created click on start build.

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/9d98c423-e899-4d45-9997-6e9cf5705d7a)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/278224c5-be0f-4e7d-ad24-e678beebf0d9)

**We can see the build got failed. The error is because of the role permission. We need to manually add the ECR permission for the IAM role. To do that go to codebuild IAM role and add the ECR permission.**

(Click on the service role and it will open the IAM role interface.)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/b0be4531-8d52-4dbd-955c-46b6b29bf251)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/d490464e-265c-48ee-88ae-daa655d17dc0)

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
![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/17c5d6a9-b40a-455d-8fb3-043898df0694)

**Once you add inline policy then try build again. This time we can see it is success**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/09194f3f-15b8-41de-b791-c1b39c062b8e)

**If you are still getting the error then check the IAM role and make sure you have the below permissions attached**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/6ee296a7-a828-4f55-a829-017e4f9f1794)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/96e31bb1-38b3-4b5f-bde3-2b1123e29561)

**Now we can see the build process is success. If we go to ECR repository we can see the image uploaded.**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/96d056c8-076d-4d2f-b8b6-e61093424d6d)

 
# Step 4
- Create pipeline
- Add new stage and connect the snyk account to check the vulnerabilities.

To create codepipeline follow the below steps;
 

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/7ea19252-9058-495a-8573-33cb9b03d3ab)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/bd9415f1-d2cf-4816-9347-f12168c4355f)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/d353dfd0-52be-4f48-b72c-c0896885715d)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/e41c1bc1-bd5c-411d-b131-aa69aa1f76ce)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/c630dc9f-a37d-494b-a68f-4d632ca24f53)

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/f8890fe3-40d9-436f-ad1c-f341b8375ea0)

**Skip deploy stage and create pipeline**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/35be58e9-64c6-4882-8ae1-6873b437d5ca)

**Wait for some time and we can see the pipeline success**

![image](https://github.com/sanju2/AWS-DevSecOps-Project/assets/111639918/0ba59199-d698-45de-81b9-6ce4fe6baacc)

**If you are facing any issue while creating pipeline then add the ECR permission we have added for codebuild to the code pipeline role as well.**




# Step 5
- Create ECS cluster
- Create task definition (add port 5000 because our app is running in this port also add tag:latest after the image URI)
- Create service (make sure the security group has port 5000 added)
- Once service has been created we can see the task running. Go to networking from task tab and copy the Public IP and add :5000 in the end. And we can see our app running.

# Step 6
- Deployment
Add new stage in pipeline called deployment and add the ECS cluster in that. 
