# Use an official Maven image as the base image
FROM maven:3.6.3-openjdk-11-slim as build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use an official OpenJDK image as the base image
FROM openjdk:11-jdk-slim-stretch

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the previous stage to the container
COPY --from=build /app/target/inventivit-backend-0.0.1-SNAPSHOT.jar ./inventivit-backend.jar

# Expose the port that your Spring Boot application listens on (default is 8080)
EXPOSE 8080

# Set the command to run the application
ENTRYPOINT ["java", "-jar", "inventivit-backend.jar"]
