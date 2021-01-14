#FROM alpine:3.12.3
#FROM gcr.io/google-containers/fluentd-elasticsearch:v2.4.0
FROM fluent/fluentd:v1.12-1

USER root

RUN apk update
RUN apk upgrade
RUN apk add wget
#RUN wget http://packages.treasuredata.com.s3.amazonaws.com/3/ubuntu/bionic/pool/contrib/t/td-agent/td-agent_3.2.1-0_amd64.deb
#RUN apk add dpkg
#RUN dpkg -i td-agent_3.2.1-0_amd64.deb
RUN wget https://raw.githubusercontent.com/emsearcy/fluent-plugin-gelf/master/lib/fluent/plugin/out_gelf.rb
#RUN mv out_gelf.rb /etc/td-agent/plugin
#RUN mv out_gelf.rb /etc/fluent/plugin
RUN mv out_gelf.rb /fluentd/plugins
#RUN /usr/sbin/td-agent-gem install gelf
#RUN /usr/local/bin/fluent-gem install gelf
RUN /usr/bin/fluent-gem install gelf

USER fluent