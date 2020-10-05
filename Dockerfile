FROM 0x01be/gource:build as build

FROM 0x01be/xpra

COPY --from=build /opt/gource/ /opt/gource/

USER root
RUN apk add --no-cache --virtual gource-runtime-dependencies \
    git \
    sdl2 \
    sdl2_image \
    pcre \
    freetype \
    glu \
    glew \
    glm \
    libpng \
    tinyxml \
    boost-filesystem \
    mesa-dri-swrast

USER xpra

ENV PATH ${PATH}:/opt/gource/bin/

WORKDIR /workspace

ENV COMMAND "gource"

