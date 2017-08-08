FROM alpine:latest

RUN apk --no-cache add lftp ca-certificates openssh
VOLUME /config /downloads
ADD /mnt/user/appdata/aj_lftp /aj_lftp
COPY /mnt/user/appdata/aj_lftp/crontab /etc/cron.d/lftp-cron
RUN chmod 0644 /etc/cron.d/lftp-cron
RUN touch /config/cron.log
RUN echo "starting cronlog" > /config/cron.log
CMD cron && tail -fn 100 /cron.log
