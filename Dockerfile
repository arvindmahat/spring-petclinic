FROM maven:3-jdk-11
RUN whereis spring-petclinic-2.7.0-SNAPSHOT.jar
RUN git clone https://github.com/arvindmahat/spring-petclinic.git && cd spring-petclinic && mvn clean package
COPY /var/jenkins_home/workspace/spc/target/spring-petclinic-2.7.0-SNAPSHOT.jar /spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/spring-petclinic-2.7.0-SNAPSHOT.jar"] 


