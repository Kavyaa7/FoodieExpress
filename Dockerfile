# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Package stage
FROM tomcat:10.1-jdk17
# Remove default Tomcat apps (optional, keeps image clean)
RUN rm -rf /usr/local/tomcat/webapps/*
# Deploy your WAR as ROOT so it's served at "/"
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]