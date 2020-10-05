FROM alpine

RUN apk add --no-cache --virtual gource-build-dependencies \
    git \
    build-base \
    autoconf \
    automake \
    sdl2-dev \
    sdl2_image-dev \
    pcre-dev \
    freetype-dev \
    glew-dev \
    glm-dev \
    boost-dev \
    libpng-dev \
    tinyxml-dev

ENV GOURCE_REVISION master
RUN git clone --recursive --branch ${GOURCE_REVISION} https://github.com/acaudwell/Gource.git /gource

WORKDIR /gource

RUN ./autogen.sh 
RUN ./configure \
    --prefix=/opt/gource \
    --with-tinyxml
RUN make
RUN make install

