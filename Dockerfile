FROM pinzhikeji/jdk8-alpine:1.2

RUN echo "downloading tomcat" \ 
    && wget http://image.xiniudada.top/file/apache-tomcat-8.5.59.tar.gz \
    -q -O /tmp/tomcat8.tar.gz

RUN mkdir /usr/local/tomcat8 \
    && tar -xzvf /tmp/tomcat8.tar.gz -C /usr/local/tomcat8/ \
    && mv /usr/local/tomcat8/apache-tomcat-8.5.59/* /usr/local/tomcat8/ \
    && rm -rf /usr/local/tomcat8/apache-tomcat-8.5.59/ \
    && rm -rf /usr/local/tomcat8/webapps/examples/ \
    && rm -rf /usr/local/tomcat8/webapps/docs/ \
    && rm /tmp/tomcat8.tar.gz

COPY license.lic /usr/local/license.lic

ENV LANG=zh_CN.utf8 \
    LANGUAGE=zh_CN.utf8

WORKDIR /usr/local/tomcat8/bin

EXPOSE 8080

CMD ["./catalina.sh", "run"]
