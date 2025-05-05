FROM bellsoft/liberica-openjdk-alpine:21

WORKDIR /app

# Copy Spring Boot app and Jolokia agent
COPY target/spring-boot-jolokia-docker-0.0.1-SNAPSHOT.jar app.jar
COPY jolokia-agent-jvm-2.2.9-javaagent.jar jolokia.jar

EXPOSE 8080 8778

CMD ["java", "-javaagent:jolokia.jar=port=8778,host=0.0.0.0", "-jar", "app.jar"]
