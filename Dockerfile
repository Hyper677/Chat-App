# Use official Maven image WITH JDK 17 included
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory inside container
WORKDIR /app

# Copy the entire project into container
COPY . .

# Make Maven Wrapper executable
RUN chmod +x mvnw

# Build the project and skip tests
RUN ./mvnw clean package -DskipTests

# Use a smaller image to run the final app
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy the built JAR from previous stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
