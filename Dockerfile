FROM eclipse-temurin:17
WORKDIR /opt
ENV PORT 8080
EXPOSE 8080
COPY build/libs/hello-world.jar /opt/app.jar
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
