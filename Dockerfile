FROM debian:stretch-slim

ENV SLACK_URL https://SLACK_URL
ENV CHANNEL #channel
ENV TAG tag
ENV QPS 10
ENV MAX_DELAY 60

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY bin/slackboard /usr/local/bin/slackboard
COPY entrypoint.sh /entrypoint.sh
COPY slackboard.toml /slackboard.toml

CMD ["slackboard", "-c", "/slackboard.toml"]
ENTRYPOINT ["/entrypoint.sh"]
