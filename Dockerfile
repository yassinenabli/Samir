FROM adoptopenjdk/openjdk21:alpine AS build

# Install Maven manually
RUN apk add --no-cache curl tar bash
RUN mkdir -p /usr/local/maven
RUN curl -fsSL -o /tmp/apache-maven.tar.gz https://downloads.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
RUN tar -xzf /tmp/apache-maven.tar.gz -C /usr/local/maven --strip-components=1
RUN ln -s /usr/local/maven/bin/mvn /usr/bin/mvn

WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests

FROM adoptopenjdk/openjdk21:alpine AS runtime
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
