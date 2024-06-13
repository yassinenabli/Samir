# Use a base Windows Server Core image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set JAVA_HOME environment variable to point to JDK 21 installation directory
ENV JAVA_HOME="C:\Program Files\Java\jdk-21"

# Add JDK 21 bin directory to the PATH environment variable
ENV PATH="$JAVA_HOME\bin;$PATH"

# Set working directory
WORKDIR /app

# Copy your application JAR file
COPY target/*.jar /app/yassine.jar

# Expose the port your app runs on
EXPOSE 8088

# Command to run the application
CMD ["java", "-jar", "yassine.jar"]
