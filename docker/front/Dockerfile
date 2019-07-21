FROM node:12-stretch-slim
WORKDIR /app/front
RUN apt-get update && apt-get install -y \
  gcc g++ bzip2 make autoconf \
  git python procps
RUN yarn install

CMD ["sh", "/app/docker/front/start.sh"]
