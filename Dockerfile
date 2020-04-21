FROM openjdk:11.0.6-jdk-slim

RUN addgroup --system spring && adduser --system spring
USER spring:spring
VOLUME /tmp
WORKDIR /home/spring
ADD build/libs/config-0.1.0.jar /home/spring/app.jar
ADD src/main/resources/* /home/spring/
ENV JAVA_OPTS=""
ENV SPRING_PROFILES_ACTIVE=dev
ENTRYPOINT [ "sh", "-c", "exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /home/spring/app.jar --spring.profiles.active=$SPRING_PROFILES_ACTIVE"  ]