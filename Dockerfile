FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/SchaleDB/SchaleDB.git && \
    cd SchaleDB && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/SchaleDB .
