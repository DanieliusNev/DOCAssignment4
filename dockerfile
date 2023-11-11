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
COPY --from=build /app/target/cicd-demo-1.3.jar cicd-demo-1.3.jar
ENTRYPOINT ["java", "-jar", "cicd-demo-1.3.jar"]
