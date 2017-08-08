FROM alpine:latest

RUN apk --no-cache add lftp ca-certificates openssh
VOLUME /config /downloads
RUN touch /config/cron.log
RUN echo "starting cronlog" > /config/cron.log
RUN crontab -l | { cat "*/5 * * * * sh /config/sync_script.sh >> /config/cron.log 2>&1"; echo ; } | crontab -
RUN cat /config/sync*
CMD cron && tail -fn 100 /config/cron.log
