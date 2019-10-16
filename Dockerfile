FROM maven:3.3.9

COPY ./helloworld /projects/helloword
RUN cd /projects/helloword/Helloworld && \
mvn clean install && \
cd ../HelloworldCompositeApplication/ && \
mvn clean install && \
mkdir /artifacts && \ 
cp -r /projects/helloword/HelloworldCompositeApplication/* /artifacts && \
rm -r /projects/helloword

FROM <BASE>

COPY --from=0 /artifacts/* ${WSO2_SERVER_HOME}/repository/deployment/server/carbonapps/
