# Build your Spring Boot jar
./mvnw clean package

# Build the Docker image
docker build -t jolokia-spring-boot .

# Run the container
docker run -p 8080:8080 -p 8778:8778 jolokia-spring-boot