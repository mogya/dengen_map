# System dependencies

- api server
  - rails
  - postgresql
  - Postgis
- frontend
  - vue.js

# rails

## docker development

```
dengen_map]$ docker-compose up -d
Starting dengenmap_data_1 ...
Starting dengenmap_data_1 ... done
Starting dengenmap_db_1 ...
Starting dengenmap_db_1 ... done
Recreating dengenmap_app_1 ...
Recreating dengenmap_app_1 ... done
dengen_map]$ docker exec -it dengenmap_app_1 /bin/bash
[root@6f9b7e7a2a38 app]# rails -v
Rails 5.0.2
```

## Database creation

```
# rails dbconsole
=# CREATE DATABASE production;
=# \c production
You are now connected to database "production" as user "dengenmap".
production=# CREATE EXTENSION postgis;
# rake db:migrate RAILS_ENV=production
# rake db:seed RAILS_ENV=production
```

## How to run the test suite

```
bin/rake spec SPEC_OPTS='--format documentation --fail-fast' SPEC=""
```

## Services (job queues, cache servers, search engines, etc.)

```
bin/rails unicorn:start
```

# vue.js

Mac上でそのまま開発可能

インクリメンタル開発
```
yarn dev
```

productionファイルの生成
```
yarn build
```
