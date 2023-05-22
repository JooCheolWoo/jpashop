FROM openjdk:11-jdk

# JAR 파일 메인 디렉토리에 복사
COPY ./build/libs/jpashop-0.0.1-SNAPSHOT.jar ../jpashop.jar

# 시스템 진입점 정의
ENTRYPOINT ["java","-jar","/jpashop.jar"]