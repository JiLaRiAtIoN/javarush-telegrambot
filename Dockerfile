FROM adoptopenjdk/openjdk17:ubi
ARG JAR_FILE=target/*.jar
ENV BOT_NAME=javarush345_bot
ENV BOT_TOKEN=136860867353:AAFQIazb1GybHchPXr2cMOH_dpQqwEt4Bok
ENV BOT_DB_USERNAME=dev_jrtb_db
ENV BOT_DB_PASSWORD=741852963qwe
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Dspring.datasource.password=${BOT_DB_PASSWORD}", "-Dbot.username=${BOT_NAME}", "-Dbot.token=${BOT_TOKEN}", "-Dspring.datasource.username=${BOT_DB_USERNAME}", "-jar", "app.jar"]