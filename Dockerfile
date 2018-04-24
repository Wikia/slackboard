FROM golang:1.10.1-stretch as builder

COPY . /go/src/github.com/cubicdaiya/slackboard

WORKDIR /go/src/github.com/cubicdaiya/slackboard
RUN go get ./slackboard && \
    make bin/slackboard

FROM debian:stretch-slim

ENV SLACK_URL https://SLACK_URL
ENV CHANNEL #channel
ENV TAG tag
ENV QPS 10
ENV MAX_DELAY 60

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /go/src/github.com/cubicdaiya/slackboard/bin/slackboard /usr/local/bin/slackboard
COPY entrypoint.sh /entrypoint.sh
COPY slackboard.toml /slackboard.toml

CMD ["slackboard", "-c", "/slackboard.toml"]
ENTRYPOINT ["/entrypoint.sh"]
