FROM openjdk:11
RUN cd spring-petclinic
COPY /var/jenkins_home/workspace/spc/target/spring-petclinic-2.7.0-SNAPSHOT.jar /spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java, "-jar", "spring-petclinic-2.7.0-SNAPSHOT.jar"]







