FROM jenkins/jenkins:lts
USER root
RUN mkdir -p /var/lib/apt/{lists,cache,archives} && \
    chown -R jenkins:jenkins /var/lib/apt && \
    chmod -R 775 /var/lib/apt
RUN apt update && apt install -y wget
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN wget -q -O - https://updates.jenkins.io/download/update-center.json | grep -E '"url".*"/updateCenter.combined.json"' | cut ->
RUN /usr/bin/java -jar /var/lib/jenkins/tools/jenkins-cli.jar install-plugins -plugin  < /tmp/update-center.json plugins.txt
RUN chown -R jenkins:jenkins /var/jenkins_home
