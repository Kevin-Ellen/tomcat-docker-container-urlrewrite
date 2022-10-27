FROM tomcat:8.5.35-jre10

COPY src/*.war /usr/local/tomcat/webapps/ROOT.war
COPY src/urlrewritefilter-4.0.3.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/lib/
COPY src/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/
COPY src/urlrewrite.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/

EXPOSE 8080

CMD ["catalina.sh", "run"]