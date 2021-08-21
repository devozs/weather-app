FROM openjdk:8-jre-alpine3.9

COPY target/weather-app-1.0-SNAPSHOT.jar /weather-app.jar

CMD ["java", "-jar", "/weather-app.jar"]