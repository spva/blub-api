# Symfony Docker Project

This project provides a Dockerized environment for running a Symfony application.

## Getting Started

### 1. Initialize the Project

Run the initialization script to set up the environment:

```bash
./init-project.sh
```

This script will:
- Build Docker images
- Install Composer dependencies
- Set up environment variables

### 2. Common Makefile Commands

Use the provided `Makefile` for common tasks:

- **Start the containers:**
    ```bash
    make up
    ```
- **Stop the containers:**
    ```bash
    make down
    ```
- **Install Composer dependencies:**
    ```bash
    make composer-install
    ```
- **Run Symfony console commands:**
    ```bash
    make console CMD="your:command"
    ```
- **Run tests:**
    ```bash
    make test
    ```

### 3. Access the Application

After starting the containers, the application will be available at [http://localhost:8000/](http://localhost:8000/).

## Additional Information

- All commands should be run from the project root.
- Ensure Docker and Docker Compose are installed on your system.
