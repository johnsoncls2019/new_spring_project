#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/mchrist1/demo/spring_project/src
COPY pom.xml /home/mchrist1/demo/spring_project
RUN mvn -f /home/mchrist1/demo/spring_project/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
EXPOSE 5000 
ENTRYPOINT ["java","-jar","/home/mchrist1/demo/spring_project/Achistartechnologies"]
