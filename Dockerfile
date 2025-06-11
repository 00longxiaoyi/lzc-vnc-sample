# Pull base image.
FROM registry.lazycat.cloud/kasm-debian-bookworm:0.0.1
USER root

RUN usermod -l lazycat kasm-user
RUN echo 'lazycat ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
ENV HOME /home/lazycat
WORKDIR $HOME
RUN sudo apt-get update;  
RUN sed -i 's/kasm_user/lazycat/g' /dockerstartup/vnc_startup.sh
RUN sed -i '5i sudo chown -R lazycat:kasm-user /home/lazycat/' /dockerstartup/kasm_default_profile.sh
RUN cat /dockerstartup/kasm_default_profile.sh
COPY --chown=lazycat:kasm-user kasmvnc.yaml /home/lazycat/.vnc/kasmvnc.yaml
COPY --chown=lazycat:kasm-user desktop/X11-Xeyes.desktop /home/lazycat/Desktop/

COPY --chown=lazycat:kasm-user desktop/X11-Xeyes.desktop /home/lazycat/.config/autostart/

RUN chmod +x /home/lazycat/Desktop/*.desktop
RUN chmod +x /home/lazycat/.config/autostart/*.desktop
ENV VNCOPTIONS "-PreferBandwidth -disableBasicAuth -DynamicQualityMin=4 -DynamicQualityMax=7 -DLP_ClipDelay=0 -sslOnly=0"
ENV VNC_PW lazycat

USER lazycat
