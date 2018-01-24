FROM maven:3.5.2-jdk-8

RUN curl https://sdk.cloud.google.com | bash && \
    ln -s /root/google-cloud-sdk/bin/* /usr/local/bin/ && \
    echo 'source /root/google-cloud-sdk/path.bash.inc' > /etc/profile.d/gcloud && \
    echo 'source /root/google-cloud-sdk/completion.bash.inc' >> /etc/profile.d/gcloud 

ARG GCLOUD_COMPONENTS=app-engine-java

RUN /bin/bash --login -c 'gcloud components install $GCLOUD_COMPONENTS'

RUN apt-get update -qq && apt-get install -y git vim jq curl bc rsync

#ADD assets /assets

ENTRYPOINT ["/bin/bash", "--login"]
