# rogeriopradoj/progit2
FROM alpine:3.3

MAINTAINER rogeriopradoj <rogeriopradoj@gmail.com>

ENV LIBRARY_PATH=/lib:/usr/lib

RUN apk add --update --no-cache gcc g++ make bash curl unzip tar ruby-dev ruby python python-dev py-setuptools py-pip ttf-dejavu libxml2-dev libxslt-dev libjpeg-turbo libjpeg-turbo-dev zlib zlib-dev && \
    gem install --no-ri --no-rdoc nokogiri -- --use-system-libraries && \
    gem install --no-ri --no-rdoc asciidoctor && \
    gem install --no-ri --no-rdoc json awesome_print && \
    gem install --no-ri --no-rdoc asciidoctor-epub3 --pre && \
    gem install --no-ri --no-rdoc asciidoctor-pdf --pre && \
    gem install --no-ri --no-rdoc coderay pygments.rb thread_safe epubcheck kindlegen && \
    gem cleanup && \
    apk del bash curl unzip tar gcc g++ make ruby-dev python-dev py-pip libjpeg-turbo-dev libxml2-dev libxslt-dev zlib-dev && \
    rm -rf /tmp/* /var/cache/apk/* ~/.cache/pip

RUN mkdir /documents
WORKDIR /documents
VOLUME /documents

RUN mkdir /scripts
COPY scripts/start-container.sh /scripts/start-container.sh
RUN chmod +x /scripts/start-container.sh

CMD ["/scripts/start-container.sh"]
