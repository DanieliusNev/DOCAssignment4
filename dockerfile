# Fetch the Java and Maven for building
FROM maven:3.9.4-eclipse-temurin-17-alpine AS build
RUN mkdir -p /app
WORKDIR /app
COPY pom.xml /app
COPY src /app/src
RUN mvn -B package --file /app/pom.xml -DskipTests

# Deployment Stage
FROM openjdk:17-alpine
EXPOSE 8383
COPY --from=build /app/target/Assignment1_2-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
