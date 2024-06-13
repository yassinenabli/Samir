# Use Microsoft JDK 17 as the base image
FROM mcr.microsoft.com/java/jdk:17-windowsservercore-ltsc2022

WORKDIR /app
COPY target/*.jar /app/yassine.jar
EXPOSE 8088

CMD ["java","-jar","yassine.jar"]
