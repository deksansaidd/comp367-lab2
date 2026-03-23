FROM openjdk:11
ADD target/comp367-webapp-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
