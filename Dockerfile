FROM alpine:latest

RUN apk --no-cache add lftp ca-certificates openssh
VOLUME /config /downloads
RUN touch /config/cron.log
RUN echo "starting cronlog" > /config/cron.log
RUN echo "*/5 * * * * sh /config/sync_script.sh >> /config/cron.log 2>&1" > /etc/cron.d/lftp-cron
RUN chmod 0644 /etc/cron.d/lftp-cron
RUN cat /config/sync*
CMD cron && tail -fn 100 /cron.log
