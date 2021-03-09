FROM WhateverCron
RUN cat << EOF | oc create -f - apiVersion: batch/v1beta1
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
EOF
RUN oc set image cronjob/2nd-cron hello=ao-2021/new-original:first --source=imagestreamtag
