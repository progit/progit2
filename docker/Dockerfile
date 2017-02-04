# rogeriopradoj/progit2
FROM centurylink/alpine-rails:latest
MAINTAINER rogeriopradoj <rogeriopradoj@gmail.com>

RUN mkdir /documents
WORKDIR /documents

COPY Gemfile .

RUN gem install bundler && \
    bundle install

VOLUME /documents

RUN mkdir /scripts
COPY start-container.sh /scripts/start-container.sh
RUN chmod +x /scripts/start-container.sh

CMD ["/scripts/start-container.sh"]
