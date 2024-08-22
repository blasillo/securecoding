# Usa una imagen base de JDK
FROM eclipse-temurin:17-jdk-jammy

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo JAR de la carpeta target al contenedor
COPY target/*.jar /app/sqli.jar

# Expone el puerto en el que la aplicación escuchará (por defecto Spring Boot usa el 8080)
EXPOSE 8181

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/sqli.jar"]