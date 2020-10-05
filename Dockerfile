FROM 0x01be/gource:build as build

FROM alpine

COPY --from=build /opt/gource/ /opt/gource/

RUN apk add --no-cache --virtual gource-runtime-dependencies \
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

ENV PATH ${PATH}:/opt/gource/bin/

