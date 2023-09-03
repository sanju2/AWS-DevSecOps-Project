# Flask install locally
pip install Flask

# Run Application Locally
python app.py

# Python venv create
python -m venv venv

# Activate venv
source venv/bin/activate

# Install Requirements
pip install -r requirements.txt

# CodeBuild Role
Code Build Role - codebuild-AWS-DevSecOps-Project-service-role

# Change Flask version and check
Flask==2.2.5
Flask==2.0.2

# Used following git command to mirro github to codecommit
git clone --mirror https://github.com/sanju2/AWS-DevSecOps-Project.git AWS-DevSecOps-Project
git push https://git-codecommit.us-east-2.amazonaws.com/v1/repos/AWS-DevSecOps-Project