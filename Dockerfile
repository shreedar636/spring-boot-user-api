# Use official OpenJDK 17 image
FROM eclipse-temurin:17-jdk-jammy as builder

# Set working directory
WORKDIR /app

# Copy build files
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

# Build the application
RUN ./gradlew build

# Create final runtime image
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy built jar from builder image
COPY --from=builder /app/build/libs/app.jar .

# Expose port (Spring Boot defaults to 8080)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]