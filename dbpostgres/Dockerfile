FROM postgres:9.6

RUN apt-get update && apt-get install -qq -y \
      build-essential \
      libpq-dev \
      postgresql-server-dev-9.6 \
      libxml2-dev \
      libgeos-dev \
      libproj-dev \
      libgdal-dev \
      wget \
      --fix-missing \
      --no-install-recommends

RUN wget http://postgis.net/stuff/postgis-2.5.2dev.tar.gz
RUN tar -xvzf postgis-2.5.2dev.tar.gz && rm postgis-2.5.2dev.tar.gz

WORKDIR postgis-2.5.2dev
RUN ./configure && make && make install

WORKDIR ..
