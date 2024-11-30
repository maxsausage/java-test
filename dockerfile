FROM maven:3.9.4-amazoncorretto-21 AS build
WORKDIR /app
COPY ./helloWorld /app
RUN mvn package

FROM amazoncorretto:21-alpine
WORKDIR /app
COPY --from=build /app/target/hello-world-0.0.1-SNAPSHOT.jar /app/hello-world.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/hello-world.jar"] 
