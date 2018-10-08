ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# Setup base
RUN apk add --no-cache git nodejs

# Copy data
COPY run.sh /
CMD [ "git clone https://github.com/nikhiljha/ethyl-hassio.git /etc/ethyl-hass" ]

RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
