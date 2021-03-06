# bloomer/Dockerfile

FROM alpine
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL \
  org.label-schema.schema-version="1.0" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vcs-url="${VCS_URL}" \
  maintainer="nroza@rethinkrobotics.com"
WORKDIR /tmp
RUN set -euvx \
  && apk --no-cache add \
    build-base \
    curl \
    expect \
    gettext \
    git \
    openssh-client \
    python \
    shadow \
  && curl -fsSLo get-pip.py https://bootstrap.pypa.io/get-pip.py \
  && python get-pip.py \
  && pip install bloom \
  && rosdep init
