# Use an official OpenJDK base image
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy project files into the container
COPY . .

# Make Maven Wrapper executable
RUN chmod +x mvnw

# Build the app
RUN ./mvnw clean package -DskipTests

# Run the app
CMD ["java", "-jar", "target/app-0.0.1-SNAPSHOT.jar"]
