FROM ubuntu:24.04

RUN apt update && \
    apt install -y git curl build-essential libssl-dev zlib1g-dev && \
    git clone https://github.com/TelegramMessenger/MTProxy.git /MTProxy

WORKDIR /MTProxy

RUN make

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 443/tcp

CMD ["/start.sh"]
