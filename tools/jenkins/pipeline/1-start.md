Setting up a CI/CD pipeline with Jenkins and GitHub involves several steps. Since you're a beginner, I'll guide you through the process step-by-step, explaining each concept with examples.

### Step 1: Install Required Plugins
1. **Open Jenkins Dashboard:**
   - Go to your Jenkins dashboard in your web browser (usually `http://localhost:8080`).
2. **Install Git Plugin:**
   - Click on **"Manage Jenkins"**.
   - Select **"Manage Plugins"**.
   - Go to the **"Available"** tab.
   - Search for **"Git Plugin"** and install it.

### Step 2: Create a New Jenkins Job
1. **Create a New Item:**
   - From the Jenkins dashboard, click on **"New Item"**.
   - Enter a name for your job (e.g., `My-CI-CD-Pipeline`).
   - Select **"Freestyle project"** and click **"OK"**.

### Step 3: Configure the Job to Pull Code from GitHub
1. **Configure Source Code Management:**
   - In the job configuration page, scroll down to the **"Source Code Management"** section.
   - Select **"Git"**.
   - Enter the URL of your GitHub repository (e.g., `https://github.com/your-username/your-repo.git`).
   - If your repository is public, you don't need to provide credentials.

### Step 4: Set Up Build Triggers
1. **Trigger the Job on Push to Main Branch:**
   - Scroll down to the **"Build Triggers"** section.
   - Check **"GitHub hook trigger for GITScm polling"**.

### Step 5: Define the Build Steps
1. **Add Build Steps:**
   - Scroll down to the **"Build"** section.
   - Click on **"Add build step"**.
   - Select **"Execute shell"**.
   - Enter the shell commands to build your project. For example, if you have a Node.js project, you might enter:
     ```sh
     npm install
     npm test
     ```

### Step 6: Deploy to Remote Server
1. **Add Post-Build Action:**
   - Scroll down to the **"Post-build Actions"** section.
   - Click on **"Add post-build action"**.
   - Select **"Send build artifacts over SSH"** (You might need to install the "Publish Over SSH" plugin).
   - Configure the SSH settings to connect to your remote server:
     - **SSH Server Name:** Give a name to your SSH server.
     - **Hostname:** Enter the IP address or hostname of your remote server.
     - **Username:** Enter the SSH username.
     - **Password:** Enter the SSH password.
     - **Remote Directory:** Enter the directory on the remote server where you want to deploy your build artifacts.

### Step 7: Test the Pipeline
1. **Run the Job:**
   - Go back to the Jenkins dashboard.
   - Select your job and click **"Build Now"**.
   - Monitor the build progress and check the console output for any errors.

### Step 8: Configure Webhook in GitHub
1. **Set Up Webhook in GitHub:**
   - Go to your GitHub repository.
   - Click on **"Settings"**.
   - Select **"Webhooks"**.
   - Click on **"Add webhook"**.
   - Enter the Jenkins URL with `/github-webhook/` endpoint (e.g., `http://your-jenkins-url/github-webhook/`).
   - Set the content type to **"application/json"**.
   - Select **"Just the push event"**.

### Example: Basic Shell Commands in the Build Step
If you have a simple project, your build step might look like this:
```sh
echo "Starting build process"
# Example: Compile code
javac -d out src/*.java

# Example: Run tests
java -cp out org.junit.runner.JUnitCore MyTests

echo "Build process completed"
```

### Example: Deploy Script for Remote Server
Here's an example script to deploy a web application:
```sh
echo "Deploying to remote server"
scp -r * user@remote-server:/path/to/deploy
ssh user@remote-server 'cd /path/to/deploy && ./start-server.sh'
echo "Deployment completed"
```

By following these steps, you can set up a basic CI/CD pipeline with Jenkins and GitHub. As you become more comfortable, you can explore more advanced topics like automated testing, environment-specific configurations, and using Jenkins pipelines with declarative syntax.
