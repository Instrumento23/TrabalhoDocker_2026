FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven git curl unzip && \
    apt-get clean

WORKDIR /app
COPY projeto-tabela-periodica-main /app

WORKDIR /app/api
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

EXPOSE 8080

CMD ["java", "-jar", "target/api-0.0.1-SNAPSHOT.jar"]
