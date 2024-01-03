FROM openjdk:17-jdk-slim-bullseye
Docker  ENV JAVA_OPTS = "-Xmx256m -Xms128"
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw && ./mvnw dependency:resolve
COPY src ./src
CMD ["./mvnw", "spring-boot:run"]
