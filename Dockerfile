FROM registry.scc.suse.de/scc_foundation

RUN zypper --non-interactive --gpg-auto-import-keys ar \
    http://download.suse.de/ibs/SUSE/Products/SLE-SDK/12/x86_64/product sdk \
    && zypper ref

RUN zypper --non-interactive --gpg-auto-import-keys in ruby2.1 ruby2.1-devel gcc \
    make libxml2-devel libxslt-devel gcc-c++ which tar

RUN gem install bundler

COPY . /app
WORKDIR app
RUN bundler install -j4
CMD bundle exec ruby em-proxy.rb

