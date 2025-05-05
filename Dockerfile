FROM bellsoft/liberica-openjre-alpine

WORKDIR /app

# Copy Spring Boot app and Jolokia agent
COPY target/spring-boot-jolokia-docker-0.0.1-SNAPSHOT.jar app.jar
COPY jmx_prometheus_javaagent-1.2.0.jar jmx_exporter.jar
COPY jmx_exporter.yml jmx_exporter.yml

EXPOSE 8080 8088

CMD ["java", "-javaagent:/app/jmx_exporter.jar=8088:/app/jmx_exporter.yml", "-jar", "app.jar"]
