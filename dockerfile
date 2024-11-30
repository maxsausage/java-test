FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY ./helloWorld /app
RUN mvn package

FROM openjdk:24-jdk-slim
WORKDIR /app
COPY --from=build /app/target/hello-world-0.0.1-SNAPSHOT.jar /app/hello-world-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/hello-world-0.0.1-SNAPSHOT.jar"] 
