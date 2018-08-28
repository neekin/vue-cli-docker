FROM neekin/vue-cli:2.9.6
RUN mkdir /app
WORKDIR  /app
COPY . /app
