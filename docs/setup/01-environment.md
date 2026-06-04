# 01 Environment Setup

## 目的
Rails アプリを自分の開発環境で動かせるようにする。

## やったこと
- `rbenv` を導入した
- Ruby `3.3.11` を使うようにした
- Rails をインストールした
- PostgreSQL を起動して `bin/rails db:create` を実行した
- GitHub リポジトリと接続した

## 実行したコマンド
```sh
ruby -v
which ruby
which gem
rbenv --version
brew --version
rbenv install -l
rbenv local 3.3.11
ruby -v
which ruby
gem install rails
which gem
which rails
rbenv rehash
hash -r
rails -v
brew services start postgresql@18
bin/rails db:create
git status
git add .
git commit -m "Initialize Rails expense workflow app"
git remote add origin https://github.com/naki0227/rails-expense-workflow.git
git push -u origin main
```

## 書き換えたファイル
- `.ruby-version`
  - `3.3.11` を記録して、このプロジェクトで使う Ruby を固定した
- `~/.zshrc`
  - `rbenv` の `PATH` 設定と初期化設定を追加した

## 学んだこと
- macOS の `/usr/bin/ruby` はシステム Ruby なので、学習用開発では避けた方がよい
- `rbenv local` は `.ruby-version` でプロジェクトごとの Ruby を固定できる
- `PATH` と `rbenv init` の設定がないと Ruby は切り替わらない
- `bundle exec` は Gemfile の文脈でコマンドを実行するために重要
- PostgreSQL は Rails とは別に起動しておく必要がある

## 詰まったこと
- `sudo gem install rails` は避けるべきだった
- `rails` コマンドが見つからず、`rbenv rehash` が必要だった
- `rbenv local` をしても、`.zshrc` 設定前はシステム Ruby のままだった

## 次にやること
- Devise を入れる前に `User` の設計を決める
- テストと lint の初期設定を安定させる
