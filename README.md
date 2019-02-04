# 個人用ブログサービス

Railsで作成した個人用ブログサービスです。WordPressを参考に作成しています。  
実装している機能は、以下になります。  

**一般機能**  
- 記事一覧の表示  
- 記事の詳細表示  
- カテゴリページ  

**管理機能**
- 管理ユーザの管理
- 新規記事投稿  
  - 人気記事機能  
  - 下書き機能  
- 画像アップロード  
- 既存記事の編集  


## Set up
1. ライブラリ等をインストールをインストール  

```
$ bundle install --path=vendor/bundle
```

2. データベースの準備と開発用データの挿入  

```
$ bundle exec rails db:migrate
$ bundle exec rails db:seed
```

3. 管理者ユーザーの作成  

```
$ export ADMIN_EMAIL='[管理者ユーザーのEmailアドレスを入力して下さい]'
$ export ADMIN_PASSWORD='[管理者ユーザーのパスワードを入力して下さい]'
$ bundle exec rails admin_user_management:add_user
```
また、管理者ユーザーを削除したい場合は、以下を実行して下さい。  

```
$ bundle exec rails admin_user_management:delete_user
```

## Environment

### Database
- sqlite  


## How to run the test suite
```
$ bundle exec rspec spec/
```
