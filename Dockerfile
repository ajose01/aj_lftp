FROM alpine:latest

RUN apk --no-cache add lftp ca-certificates openssh
VOLUME /config /downloads
RUN touch /config/cron.log
RUN echo "*/5 * * * * sh /config/sync_script.sh" > /var/spool/cron/crontabs/root
CMD crond -l 2 -f 
