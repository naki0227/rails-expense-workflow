# 02 Test And Lint Setup

## 目的
機能実装に入る前に、テストとコード品質チェックの土台を作る。

## やったこと
- `rspec-rails` を追加した
- `shoulda-matchers` を追加した
- `rubocop-rspec` を追加した
- `brakeman` を追加した
- `bundler-audit` を追加した
- `bundle exec rspec` が動くことを確認した
- `bundle exec rubocop` が動くことを確認した
- `bundle exec brakeman` が動くことを確認した
- `bundle exec bundler-audit` が動くことを確認した
- GitHub Actions の CI を追加した

## 実行したコマンド
```sh
bundle install
bin/rails generate rspec:install
bundle exec rspec
bundle exec rubocop
bundle exec brakeman
bundle exec bundler-audit
```

## 書き換えたファイル
- `Gemfile`
  - `rspec-rails` を `development, test` に追加した
  - `shoulda-matchers` を `test` に追加した
  - `rubocop-rspec` を RuboCop 系の流れに合わせて追加した
  - `brakeman` を追加した
  - `bundler-audit` を追加した
- `spec/rails_helper.rb`
  - `Shoulda::Matchers.configure` を追加して、RSpec と Rails に統合した
  - `with.test_framework :rspec` と `with.library :rails` の形に直した
- `.rubocop.yml`
  - `rubocop-rspec` を読み込む設定を追加した
- `.github/workflows/ci.yml`
  - `rubocop` job を追加した
  - `brakeman` job を追加した
  - `bundler_audit` job を追加した
  - PostgreSQL service 付きの `rspec` job を追加した
- `.rspec`
  - RSpec 初期化時に自動生成された
- `spec/spec_helper.rb`
  - RSpec 初期化時に自動生成された
- `spec/rails_helper.rb`
  - RSpec 初期化時に自動生成された後、shoulda-matchers を接続する設定を追記した

## 変更理由
- 実装と同じコミットに spec を必ず含める方針にした
- CI を先に整えて、以後の実装を常に同じ品質基準で確認できるようにした
- `brakeman` と `bundler-audit` を追加して、lint だけでなく安全性のチェックも早い段階から入れた

## 学んだこと
- gem は `Gemfile` の `group` で役割ごとに整理する
- `rails_helper.rb` は RSpec と Rails の共通設定を書く場所
- `shoulda-matchers` は gem を入れるだけではなく設定が必要
- `.rubocop.yml` は既存の流儀に合わせて拡張するのがよい
- `bin/rspec` がなくても `bundle exec rspec` で確認できる
- `require: false` はコマンド用途の gem で自然に使われる
- GitHub Actions は最初から全部入りでなく、今必要な job に絞って作る方が理解しやすい
- `services` は CI job の横で動かす補助コンテナで、今回なら PostgreSQL を指す

## 詰まったこと
- `bin/rspec` は最初からないことがある
- RuboCop の `NewCops` メッセージは即エラーではない
- `rspec` と `rails` は shoulda-matchers 設定でシンボルではなくメソッド呼び出しとして書く必要があった
- CI の `uses` を `action/checkout` と書いてしまい、`actions/checkout@v4` に直した
- CI の `with:` と `run:` の YAML 階層で迷いやすかった
- `DATABASE_URL` では test DB 名 `rails_expense_workflow_test` を意識する必要があった

## 次にやること
- CI を push して GitHub Actions の実行結果を見る
- CI で落ちたら、ローカルとの差分を記録しながら修正する
- 今後の model / controller 実装でも spec を同じコミット単位で追加する
