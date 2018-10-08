ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache git nodejs yarn nodejs-npm

# Copy data
COPY run.sh /
RUN git clone https://github.com/nikhiljha/ethyl-hassio.git /etc/ethyl-hass
RUN (cd /etc/ethyl-hass && yarn install)

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
