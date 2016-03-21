FROM selenium/base:2.52.0
MAINTAINER Selenium <selenium-developers@googlegroups.com>

#========================
# Selenium Configuration
#========================

EXPOSE 4444

ENV GRID_NEW_SESSION_WAIT_TIMEOUT -1
ENV GRID_JETTY_MAX_THREADS -1
ENV GRID_NODE_POLLING  5000
ENV GRID_CLEAN_UP_CYCLE 5000
ENV GRID_TIMEOUT 30000
ENV GRID_BROWSER_TIMEOUT 0
ENV GRID_MAX_SESSION 5
ENV GRID_UNREGISTER_IF_STILL_DOWN_AFTER 30000

VOLUME /opt/selenium
WORKDIR /opt/selenium

COPY generate_config /opt/selenium/generate_config
COPY entry_point.sh /opt/bin/entry_point.sh

USER 6001

#RUN chown 6001:root /opt/selenium
RUN chmod -R u+w,g+w /opt/selenium

CMD ["/opt/bin/entry_point.sh"]

