# Use AdoptOpenJDK as the base image
FROM openjdk:23-ea-21-windowsservercore-ltsc2022
WORKDIR /app
COPY target/*.jar /app/yassine.jar
EXPOSE 8088
CMD ["java","-jar","yassine.jar"]
