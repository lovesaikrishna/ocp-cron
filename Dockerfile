FROM WhateverCron

RUN yum install -y nc wget vim && wget https://mirror.openshift.com/pub/openshift-v4/ppc64le/clients/ocp/latest/openshift-client-linux.tar.gz
RUN tar xvzf openshift-client-linux.tar.gz && mv oc /usr/local/bin/ && mv kubectl /usr/local/bin/
RUN echo $PATH && which oc && which kubectl
          
RUN wget https://github.com/lovesaikrishna/ocp-cron/blob/main/2ndcron.yml          
#RUN oc create -f 2ndcron.yml
       
#RUN oc set image cronjob/2nd-cron hello=ao-2021/new-original:first --source=imagestreamtag
