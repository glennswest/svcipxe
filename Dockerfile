FROM centos

RUN yum install -y epel-release 
RUN yum update -y
RUN yum install -y nginx

EXPOSE 80
#ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]

ADD root /

COPY rhel73 /usr/share/nginx/html
COPY rhel7atomic /usr/share/nginx/html/rhel7atomic

# forward request logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

WORKDIR /usr/src/app

COPY svcipxe.sh /usr/src/app/

COPY nginx.conf /etc/nginx/nginx.conf
COPY install.ipxe /usr/share/nginx/html
COPY ks.cfg /usr/share/nginx/html
COPY rhel7min.cfg /usr/share/nginx/html
COPY rhel7min.ipxe /usr/share/nginx/html
COPY rhel7dev.cfg /usr/share/nginx/html
COPY rhel7dev.ipxe /usr/share/nginx/html
COPY rhel7kvm.cfg /usr/share/nginx/html
COPY rhel7kvm.ipxe /usr/share/nginx/html
COPY rhel7atomic.ipxe /usr/share/nginx/html
COPY rhel7atomic.cfg /usr/share/nginx/html
COPY repo/ /usr/share/nginx/html/repo/
CMD ["bash","/usr/src/app/svcipxe.sh"]
