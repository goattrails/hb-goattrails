###############
# Build Stage #
###############
FROM hugomods/hugo:exts@sha256:74323dcaaa0d60c76b14a498462d2d6a49a625839189e10a38c6de6ce0b2175e as builder
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=${GITHUB_TOKEN}
ARG NETRC_USERNAME
ENV NETRC_USERNAME=${NETRC_USERNAME}
ARG NETRC_PASSWORD
ENV NETRC_PASSWORD=${NETRC_PASSWORD}
# Base URL
ARG HUGO_BASEURL=
ENV HUGO_BASEURL=${HUGO_BASEURL}
# Module Proxy
ARG HUGO_MODULE_PROXY=
ENV HUGO_MODULE_PROXY=${HUGO_MODULE_PROXY}
# Build site
COPY . /src
RUN printf "machine github.com\nlogin $NETRC_USERNAME\npassword $NETRC_PASSWORD" >> $HOME/.netrc
RUN hugo --minify --gc --enableGitInfo

###############
# Final Stage #
###############
FROM hugomods/hugo:nginx@sha256:248fdd78de0c9ae9b39f570815ba270b2ae7b35ebb4b4083f4d94552c8b8d1af
COPY deploy/nginx/conf.d /etc/nginx/conf.d/
COPY --from=builder /src/public /site
