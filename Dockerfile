FROM ruby:2.6

WORKDIR /usr/src/app

COPY Gemfile ./

COPY Makefile ./

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs

RUN make install

COPY . .

RUN make setup-serve

EXPOSE 3000

CMD ["make", "serve"]
