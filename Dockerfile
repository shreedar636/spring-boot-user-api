# Stage 1: Build
FROM eclipse-temurin:17-jdk-jammy as builder

WORKDIR /app

# Copy only the essential build files first
COPY gradlew .
COPY gradle gradle
COPY build.gradle .

# Copy settings.gradle if it exists (using shell trick)
COPY *.gradle ./

# Copy source code
COPY src src

# Build the application
RUN ./gradlew build

# Stage 2: Runtime
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

COPY --from=builder /app/build/libs/app.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]