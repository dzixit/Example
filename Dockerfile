FROM openjdk:17-jdk-slim

WORKDIR /app

# Kopiuj pliki Gradle
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Kopiuj źródła
COPY src src

# Nadaj uprawnienia do gradlew
RUN chmod +x ./gradlew

# Zbuduj aplikację
RUN ./gradlew build -x test

# Uruchom aplikację
CMD ["java", "-jar", "-Dserver.port=$PORT", "build/libs/demo1-0.0.1-SNAPSHOT.jar"]
