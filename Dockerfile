FROM WhateverCron

RUN yum install -y nc wget vim && wget https://mirror.openshift.com/pub/openshift-v4/ppc64le/clients/ocp/latest/openshift-client-linux.tar.gz
RUN tar xvzf openshift-client-linux.tar.gz 
RUN echo $PATH && which oc
RUN 'cat << EOF | oc create -f - apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: 2nd-cron
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: first
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes cluster
          restartPolicy: OnFailure
EOF'
RUN oc set image cronjob/2nd-cron hello=ao-2021/new-original:first --source=imagestreamtag
