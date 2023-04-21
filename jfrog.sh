#!/bin/sh
CICD=true
WORKSPACE=/home/jenkins/
JOB_BASE_NAME=test0
BUILD_NUMBER=2
if [ $CICD = true ]
then
    echo "CI/CD pipe line check"
file= "${WORKSPACE}/test0/target/spring-petclinic-2.7.0-SNAPSHOT.jar"
REPORTNAME=${JOB_BASE_NAME}_${BUILD_NUMBER}.Test_demo_2
echo "CICD Check starting"
    if [ -f "$file" ]; then
        echo "testReport file found sending to artifactory"
        curl -H X-arvindmahato2615@gmail.com:j5iNtj1COI98I0ng1Rd-EVo0NA_JvOPT4592N_G8I-0DbYvVmhCPllywW0AuKRPHMB4Bxf140rlZHr9LPLQXoBZeN7GtXzMs4yA09nuUXV4oyqqeAn0xM_aWqYQ -T $file https://akm11jfrog.jfrog.io/artifactory/libs-snapshot-local/
