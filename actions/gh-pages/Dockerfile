FROM alpine

LABEL "com.github.actions.name"="gh-pages"
LABEL "com.github.actions.description"="Deploy to gh-pages"
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="white"

LABEL version="0.0.1"
LABEL maintainer="Haishan <haishanhan@gmail.com>"
LABEL repository="http://github.com/haishanh/github-actions-foo"
LABEL homepage="http://github.com/haishanh/github-actions-foo/actions/gh-pages"

RUN apk add git

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
