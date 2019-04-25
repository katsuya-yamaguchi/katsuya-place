FROM ruby:2.6.3

ENV APP_ROOT /katsuya-place

WORKDIR $APP_ROOT
RUN apt-get update && \
    apt-get install -y mysql-client \
                       apt-transport-https \
                       --no-install-recommends && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc && \
    bundle config --global build.nokogiri --use-system-libraries && \
    bundle config --global jobs 4 && \
    bundle install && \
    rm -rf ~/.gem

COPY . $APP_ROOT/

WORKDIR $APP_ROOT/app/frontend
RUN yarn install && \
    yarn build-dev

WORKDIR $APP_ROOT
EXPOSE 8888

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8888"]
