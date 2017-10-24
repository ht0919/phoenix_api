# PhoenixでWebアプリの作成課題(3)

## 参照テキスト

- [Elixir入門「第3回：Phoenix 1.3で高速webアプリ ＆ REST APIアプリをサクッと書いてみる」](
  https://www.slideshare.net/piacere_ex/elixir3phoenix-13web-rest-api-81099953)
  - 2017/10/10 ver1.3 (Phoenix 1.3対応)

## 実行方法

- 下記のコマンドを実行後にJSONクライアント(Postman)でGETやSETを送信する
```
$ cd api
$ iex -S mix phx.server
```

## 作成手順

- 下記のコマンドを実行後にJSONクライアント(Postman)でGETやSETを送信する
```
# mix phx.new api --no-brunch
# cd api
# sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"
# mix ecto.create
# mix phx.gen.json Json Post posts title:string body:text
※ テキストエディタで「lib/app_web/router.ex)にパスを追加
※ 「plug :protect_from_forgery」をコメント化
# mix ecto.migrate

# sudo -u postgres psql
postgres=# \c api_dev
postgres=# \d posts
postgres=# \q

# mix phx.routes

# iex -S mix phx.server
```

## Dockerイメージを保存する

- Ctrl+p→Ctrl+qを押してDockerを抜けたあと、次のコマンドを実行
```
$ docker ps -a
$ docker commit -m "Phoenix/PostgreSQL/node.js installed" [imagename] local/phoenix
$ docker images
$ docker stop [imagename]
```

## 補足

- 次回実行時はPostgreSQLの起動とnvmの有効化を実行
```
# /etc/init.d/postgresql start
# source ~/.nvm/nvm.sh
```
- PostgreSQLの停止は下記のコマンドを実行
```
# /etc/init.d/postgresql stop
```
