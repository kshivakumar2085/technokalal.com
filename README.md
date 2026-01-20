# Hello World Website - Terraform Deployment

This project deploys a simple "Hello World" static website using AWS Amplify.

## Architecture

- **Frontend**: Static HTML hosted on AWS Amplify

## Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform installed
- GitHub account and repository for the static site
- GitHub Personal Access Token with repo access

## Setup Instructions

1. **Create a GitHub Repository**:
   - Create a new public repository on GitHub (e.g., `yourusername/hello-world-site`)
   - Push the `site` directory to this repository

2. **Create GitHub Personal Access Token**:
   - Go to GitHub Settings > Developer settings > Personal access tokens
   - Create a token with `repo` scope

3. **Configure Terraform**:
   - Provide variables via command line
   - Example: `terraform apply -var="github_repo_url=https://github.com/yourusername/hello-world-site" -var="github_access_token=your_token_here"`

4. **Deploy**:
   ```bash
   terraform init
   terraform apply
   ```

5. **Access the Application**:
   - The Amplify app URL will be output after deployment

## Files Structure

- `main.tf`: Terraform configuration
- `variables.tf`: Input variables
- `outputs.tf`: Output values
- `site/`: Static HTML files

## Cost

This setup uses the AWS Amplify free tier.

Expected monthly cost: ~$0"# technokalal.com" 
