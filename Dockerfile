FROM public.ecr.aws/docker/library/openjdk:17 AS build
WORKDIR /app
COPY . .
RUN ./mvnw clean package

FROM public.ecr.aws/docker/library/openjdk:17.0.2-jdk-slim
WORKDIR /app
COPY --from=build /app/target/Codewise-0.0.1-SNAPSHOT.jar ./codewise.jar
EXPOSE 8001
CMD ["java", "-jar", "codewise.jar"]
