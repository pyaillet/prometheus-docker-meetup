FROM centos:latest

RUN yum install -y curl \
    && yum clean all

COPY dashboards /opt/grafana-dashboards
COPY datasource /opt/grafana-datasource

COPY ./run.sh /opt

RUN chmod +x /opt/run.sh

WORKDIR /opt

ENTRYPOINT [ "/opt/run.sh" ]
