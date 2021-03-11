FROM WhateverCron

RUN yum install -y nc wget vim && wget https://mirror.openshift.com/pub/openshift-v4/ppc64le/clients/ocp/latest/openshift-client-linux.tar.gz
RUN tar xvzf openshift-client-linux.tar.gz && mv oc /usr/local/bin/ && mv kubectl /usr/local/bin/
RUN echo $PATH && which oc && which kubectl
RUN wget https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-13.noarch.rpm
RUN rpm -Uvh epel-release*rpm && yum install -y nmon
RUN wget https://github.com/lovesaikrishna/ocp-cron/blob/main/2ndcron.yml && wget https://centos.pkgs.org/7/epel-aarch64/nmon-16g-3.el7.aarch64.rpm.html          
#RUN oc create -f 2ndcron.yml
       
#RUN oc set image cronjob/2nd-cron hello=ao-2021/new-original:first --source=imagestreamtag
