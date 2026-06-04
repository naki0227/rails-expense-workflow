# 02 Test And Lint Setup

## 目的
機能実装に入る前に、テストとコード品質チェックの土台を作る。

## やったこと
- `rspec-rails` を追加した
- `shoulda-matchers` を追加した
- `rubocop-rspec` を追加した
- `bundle exec rspec` が動くことを確認した
- `bundle exec rubocop` が動くことを確認した

## 実行したコマンド
```sh
bundle install
bin/rails generate rspec:install
bundle exec rspec
bundle exec rubocop
```

## 書き換えたファイル
- `Gemfile`
  - `rspec-rails` を `development, test` に追加した
  - `shoulda-matchers` を `test` に追加した
  - `rubocop-rspec` を RuboCop 系の流れに合わせて追加した
- `spec/rails_helper.rb`
  - `Shoulda::Matchers.configure` を追加して、RSpec と Rails に統合した
- `.rubocop.yml`
  - `rubocop-rspec` を読み込む設定を追加した
- `.rspec`
  - RSpec 初期化時に自動生成された
- `spec/spec_helper.rb`
  - RSpec 初期化時に自動生成された
- `spec/rails_helper.rb`
  - RSpec 初期化時に自動生成された後、shoulda-matchers を接続する設定を追記した

## 学んだこと
- gem は `Gemfile` の `group` で役割ごとに整理する
- `rails_helper.rb` は RSpec と Rails の共通設定を書く場所
- `shoulda-matchers` は gem を入れるだけではなく設定が必要
- `.rubocop.yml` は既存の流儀に合わせて拡張するのがよい
- `bin/rspec` がなくても `bundle exec rspec` で確認できる

## 詰まったこと
- `bin/rspec` は最初からないことがある
- RuboCop の `NewCops` メッセージは即エラーではない
- `rspec` と `rails` は shoulda-matchers 設定でシンボルとして書く必要がある

## 次にやること
- `User` モデルの責務を言葉で整理する
- 認証方式とロール設計を決める
