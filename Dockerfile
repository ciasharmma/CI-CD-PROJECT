FROM centos:8

RUN rm -f /etc/yum.repos.d/*

WORKDIR /etc/yum.repos.d

COPY ./local.repo /etc/yum.repos.d/

RUN yum install -y httpd zip wget

WORKDIR /var/www/html

RUN wget https://templatemo.com/download/templatemo_591_villa_agency

RUN unzip brainwave.zip

RUN rm -f brainwave.zip &&\
    cp -rf brainwave-html/* . &&\
        rm -rf brainwave-html
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

