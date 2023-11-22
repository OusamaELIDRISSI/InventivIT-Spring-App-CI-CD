FROM openjdk:11

WORKDIR /app

COPY target/inventivit-backend-0.0.1-SNAPSHOT.jar inventivit-backend.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "inventivit-backend.jar"]
