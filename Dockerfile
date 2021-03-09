FROM webhook
RUN yum install -y nc net-tools bind-utils && ls -lhatr /root 
