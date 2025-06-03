# CI/CD Fundamentals

CI/CD Fundamentals refer to the foundational principles and practices used to automate software development, testing, and deployment. Let's break it down clearly:

🔁 **CI/CD = Continuous Integration + Continuous Delivery/Deployment**

---

## 🔧 1. Continuous Integration (CI)

CI is the practice of merging all developers' code changes into a shared repository several times a day, automatically testing and verifying each integration.

### Key Concepts:
- Developers push code to a shared Git repo (e.g., GitHub, GitLab).
- Build automation tools (e.g., Jenkins, GitHub Actions) compile the code.
- Automated testing (unit/integration tests) runs on every push.
- Catch bugs early in the development cycle.

### Example Tools:
- GitHub Actions
- Jenkins
- GitLab CI
- CircleCI
- Travis CI

---

## 🚀 2. Continuous Delivery (CD)

CD ensures that your application is always in a deployable state. It automates the release process so that code can be deployed to staging or production with the click of a button.

### Key Concepts:
- After CI is successful, the pipeline automatically packages and prepares artifacts (e.g., Docker images).
- Code is deployed to test/staging environments for further testing.
- Final deployment to production is manual (but quick and safe).

---

## ⚡ 3. Continuous Deployment (also CD)

Similar to Continuous Delivery, but fully automated. Every successful code change that passes tests is automatically deployed to production — no manual intervention.

---

## 🛠️ CI/CD Pipeline Structure

### Source Code Stage
- Developer pushes code to repo (e.g., `git push`).

### Build Stage
- Code is compiled or containerized (e.g., `Docker build`).

### Test Stage
- Automated tests run (unit, integration, security tests).

### Artifact Stage
- Build is saved (e.g., JAR file, Docker image, ZIP package).

### Deploy Stage
- Code is deployed to environments (staging, production).

---

## ✅ Benefits of CI/CD
- Faster release cycles
- Early bug detection
- Reduced manual effort
- Better collaboration
- Stable and reliable deployments

---

## 🔒 Best Practices
- Commit frequently
- Keep builds fast
- Run tests in parallel
- Rollbacks and monitoring
- Use infrastructure as code (e.g., Terraform, Ansible)

# ⚙️ Popular CI/CD Platforms

## 1. Jenkins (Self-hosted, Open-source)
- Highly customizable with a large plugin ecosystem  
- Requires manual setup and maintenance  
- Supports pipelines via `Jenkinsfile` (Groovy)  
- Suitable for complex enterprise environments  

## 2. GitHub Actions (Cloud-native)
- Integrated directly into GitHub repositories  
- YAML-based workflows (e.g., `.github/workflows/main.yml`)  
- Easy to get started, especially for open-source and small to mid-size projects  
- Supports matrix builds, secrets, reusable workflows  

## 3. GitLab CI/CD (Cloud & Self-hosted)
- Built into GitLab, supports full DevOps lifecycle  
- Pipeline configuration via `.gitlab-ci.yml`  
- Native support for runners, artifacts, environments, manual approvals  

---

# ☁️ Cloud-based vs. Self-hosted CI/CD

| Feature              | Cloud-based CI/CD         | Self-hosted CI/CD            |
|----------------------|---------------------------|-------------------------------|
| **Examples**         | GitHub Actions, CircleCI  | Jenkins, GitLab (Self-managed) |
| **Maintenance**      | Managed by provider       | You manage infrastructure     |
| **Scalability**      | Scales easily (pay per use) | Requires infra setup and scaling |
| **Security control** | Less granular (vendor-owned) | Full control (e.g., air-gapped) |
| **Cost**             | Free tiers, pay-per-usage | Infra and setup cost          |
| **Customization**    | Limited                   | Highly customizable           |

---

# 📜 Pipeline as Code (PaC)

**Pipeline as Code** means defining your build/deployment pipeline in code stored in version control (e.g., Git).

### Why it matters:
- **Reproducibility**
- **Versioned pipeline logic** (track changes)
- **Easier collaboration and review**
- **DevOps-as-Code alignment**

### Examples:
- **Jenkins**: `Jenkinsfile` (Groovy)  
- **GitHub Actions**: `.github/workflows/build.yml` (YAML)  
- **GitLab CI**: `.gitlab-ci.yml` (YAML)  

---

# 🔗 CI/CD Integration Points

## 1. Source Code Management (SCM)
- GitHub, GitLab, Bitbucket — trigger pipelines on commits, PRs  

## 2. Build Tools
- Maven, Gradle, npm, Docker — compile/package source code  

## 3. Test Frameworks
- JUnit, PyTest, Selenium — run automated tests during pipeline  

## 4. Artifact Repositories
- JFrog Artifactory, Nexus, GitHub Packages — store build outputs  

## 5. Infrastructure as Code (IaC)
- Terraform, CloudFormation, Ansible — provision infra in pipelines  

## 6. Container & Orchestration
- Docker, Kubernetes — build, push, deploy containerized apps  

## 7. Monitoring & Notifications
- Slack, Email, Prometheus, Grafana — alert on build/deploy status  


## 🧩 GitHub Actions Components Overview

GitHub Actions uses YAML files to define workflows that automate tasks like building, testing, and deploying code. These workflows consist of several core components:

---

### 1. **Workflow**
A workflow is an automated process defined in a `.yml` file located under `.github/workflows/`.

- Triggered by events (e.g., `push`, `pull_request`, `schedule`)
- Can include multiple jobs and steps  

```yaml
name: CI Pipeline
on: [push, pull_request]
jobs:
  build:
    ...
```

---

### 2. **Event**

The **event** is the trigger that starts the workflow.

#### 📌 Common Events:
- `push` — Triggered when code is pushed to the repository
- `pull_request` — Triggered when a pull request is opened or updated
- `schedule` — Triggered on a cron schedule (e.g., nightly builds)
- `workflow_dispatch` — Manual trigger via GitHub UI
- `release` — Triggered when a release is published

```yaml

on:
  push:
    branches: [main]
```

---

### 3. **Job**

A **job** is a set of steps that run on the same runner.

- Each job runs in its own **VM** or **container**
- Jobs can run **in parallel** or **sequentially** using the `needs` keyword
- Jobs are defined under the `jobs` section in the workflow file

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      ...
```

---

### 4. **Runner**

The **runner** is the server (host machine) where a job executes.

- **GitHub-hosted**: Managed by GitHub  
  Example: `ubuntu-latest`, `windows-latest`, `macos-latest`
- **Self-hosted**: Your own machine, VM, or container

Each job specifies its runner using the `runs-on` key.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      ...

```

---

### 5. **Step**

A **step** is a single task within a job.

- Can run shell commands using the `run` keyword  
- Can use a GitHub Action via the `uses` keyword  

Each job contains one or more steps executed in order.

```yaml
steps:
  - name: Checkout code
    uses: actions/checkout@v3

  - name: Run tests
    run: npm test
    
```
---

### 6. **Action**

An **action** is a reusable piece of code (written in Docker or JavaScript) that performs a task.

- Use **official** or **custom** actions from the GitHub Marketplace or other sources  
- Syntax: `uses: owner/repo@version`

```yaml
uses: actions/setup-node@v3
```

---

### 7. **Environment Variables**

You can define environment variables globally, per job, or per step.

```yaml
env:
  NODE_ENV: production
```
#### 🔐 Using GitHub Secrets

For sensitive data like API keys or tokens, use **GitHub Secrets** stored securely in your repository settings:

```yaml
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}

```
---

### 8. **Artifacts and Caching**

#### Artifacts
Store and share files between jobs (e.g., test reports).

#### Cache
Speed up workflows by saving dependencies.

```yaml
uses: actions/cache@v3
with:
  path: ~/.npm
  key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
```

# 🚀 GitHub Actions: Full CI/CD Workflow Example

This is a complete CI/CD pipeline using GitHub Actions for a **Node.js application**, with build, test, and deploy steps to AWS S3.

---

## 📁 Workflow File Path

```bash
.github/workflows/ci-cd.yml

name: CI/CD Pipeline

# 🚦 Trigger on push to main or manual run
on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build-and-deploy:
    name: Build and Deploy Job
    runs-on: ubuntu-latest

    env:
      AWS_REGION: us-east-1
      S3_BUCKET_NAME: your-s3-bucket-name

    steps:
      # 🧾 Checkout source code
      - name: Checkout Repository
        uses: actions/checkout@v3

      # 🛠️ Setup Node.js
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'

      # 📦 Install dependencies
      - name: Install dependencies
        run: npm install

      # ✅ Run tests
      - name: Run tests
        run: npm test

      # 🏗️ Build the app
      - name: Build the app
        run: npm run build

      # 🔐 Configure AWS credentials
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v3
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

      # ☁️ Deploy to S3
      - name: Deploy to S3
        run: |
          aws s3 sync ./build s3://${{ env.S3_BUCKET_NAME }} --delete

```

# 🏗️ GitHub Repository Preparation for CI/CD

Setting up a GitHub repository properly is essential for successful CI/CD with GitHub Actions.

---

## ✅ 1. Initialize the Repository

### 📌 Create a New Repo
- Go to [github.com/new](https://github.com/new)
- Choose a name, description, and visibility (public/private)
- Initialize with:
  - `README.md` (optional)
  - `.gitignore` (choose based on language/framework)
  - License (MIT, Apache, etc.)

---

## 🧰 2. Set Up Directory Structure

### Minimal Project Structure:
\`\`\`
my-project/
├── .github/
│   └── workflows/
│       └── ci-cd.yml         # Workflow YAML file
├── src/                      # Source code
├── tests/                    # Unit/integration tests
├── package.json / pyproject.toml / etc.
├── README.md
└── .gitignore
\`\`\`

---

## 🔐 3. Add Secrets for CI/CD

Go to:
**Repo → Settings → Secrets and variables → Actions**

### Add Secrets:
- `AWS_ACCESS_KEY_ID` / `AWS_SECRET_ACCESS_KEY`
- `DOCKER_USERNAME` / `DOCKER_PASSWORD`
- `SSH_PRIVATE_KEY`
- `ENVIRONMENT_VARIABLES`

Use them in workflows:
\`\`\`yaml
env:
  API_KEY: ${{ secrets.API_KEY }}
\`\`\`

---

## 🧾 4. Create GitHub Actions Workflow

### File Path:
\`\`\`
.github/workflows/ci-cd.yml
\`\`\`

### Example:
\`\`\`yaml
name: CI Pipeline
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: echo "Building your app"
\`\`\`

---

## 🛡️ 5. Optional: Branch Protection Rules

Enable in:
**Settings → Branches → Branch protection rules**

Recommended:
- Require status checks (e.g., CI build)
- Require pull request reviews
- Require signed commits

---

## 🧪 6. Add Tests

Add test files under `/tests` directory. Example for Node.js:

\`\`\`bash
npm install --save-dev jest
\`\`\`

In \`package.json\`:
\`\`\`json
"scripts": {
  "test": "jest"
}
\`\`\`

---

## 📋 7. Add .gitignore

Example \`.gitignore\` for Node.js:

\`\`\`
node_modules/
.env
dist/
coverage/
\`\`\`

Use [gitignore.io](https://www.toptal.com/developers/gitignore) for custom templates.

---

## 📌 8. README & Docs

Good README includes:
- Project description
- Setup instructions
- CI/CD badge (optional)
- Deployment info

---

## 📦 9. Version Control Best Practices

- Use feature branches
- Follow naming conventions (\`feature/\`, \`bugfix/\`, \`hotfix/\`)
- Use clear commit messages
- Merge via PRs, not direct pushes

---

✅ You're now ready to automate building, testing, and deploying your code!

