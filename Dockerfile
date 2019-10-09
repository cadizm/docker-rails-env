FROM ruby:2.5

RUN apt-get update && \
    apt-get install -y \
        bash \
        bash-completion \
        binutils \
        build-essential \
        ca-certificates \
        curl \
        git \
        less \
        libxml2 \
        locales \
        nodejs \
        openssl \
        pkg-config \
        postgresql \
        postgresql-client \
        python \
        python-pip \
        python3 \
        python3-pip \
        tar \
        unzip

RUN rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN git clone https://github.com/cadizm/bin.git /home/dev/bin && \
    git clone https://github.com/cadizm/dotfiles.git /dotfiles && \
    pip install dotfiles && \
    dotfiles --sync --force --home=/home/dev --repo=/dotfiles

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle update && bundle install
COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

RUN groupadd -r dev --gid=222 && useradd -r -g dev --uid=222 dev && \
    chown -R dev:dev ~dev

USER dev

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
