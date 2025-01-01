# Base image
FROM alpine:latest

# Set environment variables
ENV HUGO_VERSION=0.140.2
# or amd64
ENV ARCH=amd64

ENV HUGO_BINARY=hugo_extended_${HUGO_VERSION}_linux-${ARCH}.tar.gz

# Install dependencies
RUN apk add --no-cache \
    git \
    wget \
    libc6-compat \
    bash \
    libstdc++ \
    gcc \
    && wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} \
    && tar -xzvf ${HUGO_BINARY} -C /usr/local/bin/ \
    && rm -f ${HUGO_BINARY} \
    && apk del wget

# Set working directory
WORKDIR /site

# Expose Hugo server port
EXPOSE 1313

# Command to run Hugo server with the "terminal" theme and minify
CMD ["hugo", "server", "--bind", "0.0.0.0", "--port", "1313", "-t", "terminal", "--watch", "--buildDrafts", "--buildFuture" ]
