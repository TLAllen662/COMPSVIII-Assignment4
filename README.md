# Assignment #4: Application Containerization

This is a simple Node.js web application designed for learning Docker containerization concepts.

## Application Overview

This application is a basic Express.js web server that:
- Serves a static HTML page at the root (`/`)
- Provides an API status endpoint at `/api/status`
- Includes a health check endpoint at `/health`
- Runs on port 3000 by default (configurable via PORT environment variable)

## What's Included

- **app.js**: Main application server file
- **package.json**: Node.js dependencies and project configuration
- **public/index.html**: Static HTML page that confirms successful containerization
- **public/style.css**: Styling for the web page

## Running Without Docker (for reference only)

If you wanted to run this application directly (not required for assignment):
```bash
npm install
npm start
```

## Your Docker Assignment

**DO NOT MODIFY THE APPLICATION CODE**

Your task is to containerize this existing application using Docker. You need to:

1. Create a `Dockerfile` that properly containerizes this Node.js application
2. Build a Docker image from your Dockerfile
3. Run a container from your image
4. Verify the application works by accessing it in your browser

## Starting the Application

- To build the docker image run the command:

```bash
docker build -t docker-demo-app:latest .
```

- To run your docker container in port 3000 run the command:

```bash
docker run -d -p 3000:3000 --name docker-demo-app docker-demo-app:latest
```

## Reflection Question
**Answer the following question in the space below**: How does containerization with Docker differ from using virtual machines, and why might a development team choose Docker containers over VMs for deploying applications like the one you just containerized?

Docker containers and virtual machines both isolate applications, but they do so at different levels. A VM virtualizes an entire machine, including a full guest operating system and kernel, which is managed by a hypervisor. Each VM carries the overhead of its own OS, making VMs relatively large (often gigabytes), slow to boot (minutes), and resource-heavy. Docker containers, on the other hand, virtualize at the operating system level: they share the host machine's kernel and only package the application code, its dependencies, and a minimal set of libraries/binaries. This makes container images much smaller (megabytes), containers start in seconds (or less), and far more containers can run on the same hardware compared to VMs.

For an app like the one containerized in this assignment (a small Node.js/Express application), a development team would likely choose Docker over VMs for several reasons:
- **Speed and efficiency**: Containers start almost instantly and use less CPU/memory, letting the team run many instances (or other services) on the same host without the overhead of multiple full OS installs.
- **Consistency across environments**: The Dockerfile captures the exact Node.js version, dependencies, and startup command, so the app runs identically on a developer's laptop, in CI, and in production — eliminating "it works on my machine" issues.
- **Portability**: The resulting image can be pushed to a registry and run on any machine with Docker installed, regardless of the underlying OS, without needing to configure a VM image for each target platform.
- **Simpler scaling and orchestration**: Lightweight containers are easier to scale horizontally and integrate with orchestration tools like Docker Compose or Kubernetes, which are well-suited to microservice-style Node.js apps.
- **Faster CI/CD cycles**: Building and tearing down containers is quick, which speeds up automated testing and deployment pipelines compared to provisioning and destroying full VMs.

VMs still have their place when you need to run different operating systems or require stronger isolation/security boundaries at the kernel level, but for deploying a self-contained web application like this one, Docker's lightweight, fast, and portable approach is generally the more practical choice.

## Application Requirements for Docker

Your Dockerfile should ensure:
- The application has Node.js runtime available
- All application files are copied into the container
- Dependencies are installed (`npm install`)
- Port 3000 is exposed
- The application starts with `npm start`
- The container can be accessed from your host machine

## Verification

When your Docker container is running correctly:
- Navigate to `http://localhost:3000` (or whatever port you mapped)
- You should see a success page confirming containerization worked
- The `/api/status` endpoint should return JSON status information

## Troubleshooting Tips

- Make sure your port mapping is correct in the `docker run` command
- Check that all files are copied into the container
- Verify Node.js dependencies are installed in the container
- Use `docker logs <container-name>` to see application output

## File Structure Expected
```
docker-assignment/
├── Dockerfile          # You create this
├── app.js              # Provided
├── package.json        # Provided
├── public/             # Provided
│   ├── index.html      # Provided
│   └── style.css       # Provided
└── README.md           # This file
```

Good luck with your Docker containerization!