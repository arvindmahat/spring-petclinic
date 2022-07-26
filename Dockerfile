FROM maven:3-jdk-11 AS builder
RUN git clone https://github.com/arvindmahat/spring-petclinic.git && cd spring-petclinic && mvn clean package
FROM maven:3-jdk-11
COPY --from=builder /spring-petclinic/target/spring-petclinic-2.7.0-SNAPSHOT.jar /spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic-2.7.0-SNAPSHOT.jar"]
