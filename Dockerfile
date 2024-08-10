FROM jenkins/jenkins:lts
RUN useradd jenkins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
RUN chown -R jenkins:jenkins /var/jenkins_home
USER jenkins
