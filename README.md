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

```
git clone https://github.com/sanju2/AWS-DevSecOps-Project.git
```
- Mirror the repo

```
git clone --mirror https://github.com/sanju2/AWS-DevSecOps-Project.git AWS-DevSecOps-Project
```

- Push the repo to codecommit repository (Need to create HTTPS Git credentials for AWS CodeCommit from IAM user)

```
git push <codecommit repo URI>
```

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
    

