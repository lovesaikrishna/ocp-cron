FROM WhateverCron


RUN wget https://github.com/lovesaikrishna/custom-rpms/blob/main/health.sh && chmod +x health.sh 
RUN /usr/bin/echo "*/2 * * * * /root/health.sh" | crontab -
RUN yum install -y python

RUN yum install -y nc wget vim nscd* --skip-broken && wget https://mirror.openshift.com/pub/openshift-v4/ppc64le/clients/ocp/latest/openshift-client-linux.tar.gz
RUN tar xvzf openshift-client-linux.tar.gz && mv oc /usr/local/bin/ && mv kubectl /usr/local/bin/
RUN echo $PATH && which oc && which kubectl && yum install -y glibc* ncurses-libs* --skip-broken

RUN wget https://github.com/lovesaikrishna/custom-rpms/blob/main/epel-release-7-13.noarch.rpm  && rpm -Uvh epel-release*rpm 
RUN wget https://github.com/lovesaikrishna/custom-rpms/blob/main/nmon-16g-3.el7.x86_64.rpm && rpm -Uvh nmon*.rpm
RUN wget https://github.com/lovesaikrishna/ocp-cron/blob/main/2ndcron.yml && wget https://centos.pkgs.org/7/epel-aarch64/nmon-16g-3.el7.aarch64.rpm.html

#RUN oc create -f 2ndcron.yml
       
#RUN oc set image cronjob/2nd-cron hello=ao-2021/new-original:first --source=imagestreamtag
