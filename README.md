# CI/CD with Testing and Simulated Deployment

This project demonstrates a Continuous Integration and Continuous Deployment (CI/CD) pipeline that includes testing and simulated deployment using Docker and Jenkins.

## Project Structure

- **app.py**: A Flask application that provides a simple API for managing tasks.
- **Dockerfile**: Defines the Docker image for the Flask application.
- **docker-compose-prod.yml**: Docker Compose configuration for production deployment.
- **docker-compose.test.yml**: Docker Compose configuration for testing environment.
- **requirements.txt**: Lists the Python dependencies for the project.
- **test_api.py**: Contains unit tests for the Flask application.
- **wait-for-db.sh**: A script to ensure the database service is ready before starting the application.

## Prerequisites

- Docker
- Docker Compose
- Jenkins (for CI/CD pipeline)

## Setup and Usage

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/ByJeanCa/CI-CD-with-Testing-and-Simulated-Deployment.git
   cd CI-CD-with-Testing-and-Simulated-Deployment
   
2. **Environment Variables**:

Create a .env file in the project root with the following variables:

POSTGRES_USER=test
POSTGRES_PASSWORD=password
POSTGRES_DB=db-test
DATABASE_URL=postgresql://test:password@db-test:5432/db-test

## Running Tests:

To run tests using the testing environment:

  ```bash
docker compose -f docker-compose.test.yml up --abort-on-container-exit --exit-code-from api
```
This command will build and start the services defined in docker-compose.test.yml, run the tests, and then stop the services.

## Deploying to Production:

To deploy the application using the production configuration:
  ```bash
docker compose -f docker-compose-prod.yml up -d --build
```
This will build and start the services defined in docker-compose-prod.yml in detached mode.

## CI/CD Pipeline with Jenkins
The project includes a Jenkinsfileconf that defines the CI/CD pipeline:

Clone Repository: Jenkins clones the repository.
Set Up Environment: Copies necessary environment variables.
Run Tests: Executes tests using the testing environment.
Deploy to Production: If tests pass, deploys the application using the production configuration.

## To set up the pipeline in Jenkins:
Create a New Pipeline: In Jenkins, create a new pipeline project.
Configure Pipeline: Set the pipeline script to point to the Jenkinsfileconf in this repository.
Provide Environment Variables: Ensure Jenkins has access to the necessary environment variables, either through credentials or a .env file.

## Notes
The wait-for-db.sh script ensures that the application starts only after the database service is ready.
The application exposes its API on port 5000.
Ensure that the necessary ports are available and not in use by other services.

## License
This project is licensed under the MIT License. See the LICENSE file for details.


This `README.md` provides an overview of the project, setup instructions, usage guidelines, and information about the CI/CD pipeline.
::contentReference[oaicite:0]{index=0}
 
