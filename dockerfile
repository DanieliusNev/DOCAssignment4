# Fetch the Java and Maven for building
FROM maven:3.9.4-eclipse-temurin-17-alpine AS build
RUN mkdir -p /app
WORKDIR /app
COPY pom.xml /app
COPY src /app/src
RUN mvn -B package --file pom.xml -DskipTests

# Deployment Stage
FROM eclipse-temurin:latest
EXPOSE 8080
COPY --from=build /app/target/*jar Assignment1_2-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "Assignment1_2-0.0.1-SNAPSHOT.jar"]
