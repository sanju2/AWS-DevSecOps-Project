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
- AWS ECS (Elastic Cluster Service)

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


