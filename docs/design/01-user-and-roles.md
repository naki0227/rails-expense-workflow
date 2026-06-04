# 01 User And Roles

## 目的
経費申請システムの利用者と権限を最小構成で整理する。

## 現時点の方針
- `employee`: 申請を作成する
- `manager`: 承認 / 差し戻しを行う
- `admin`: 全体を管理する

## やったこと
- `User` を Devise 前提で設計した
- `users` テーブルに `name` と `role` を追加する方針を決めた
- `role` は `integer + enum` で扱う方針にした
- `name` と `role` の presence validation をモデルに入れる方針にした

## 実行したコマンド
```sh
bin/rails generate devise:install
bin/rails generate devise User
bin/rails db:migrate
bundle exec rspec spec/models/user_spec.rb
```

## 書き換えたファイル
- `db/migrate/20260604125605_devise_create_users.rb`
  - `name` カラムを追加した
  - `role` カラムを追加した
  - `role` は `integer` として保存するようにした
  - `name` と `role` に `null: false` を付けた
  - `role` に初期値を持たせる設計を検討した
- `app/models/user.rb`
  - Devise 設定に加えて `enum :role` を定義した
  - `employee`, `manager`, `admin` の対応を定義した
  - `name` と `role` の presence validation を追加した
- `spec/models/user_spec.rb`
  - `name` の必須バリデーションを確認する spec を追加した
  - `role` の必須バリデーションを確認する spec を追加した
  - `User.roles` の enum 定義を確認する spec を追加した

## 変更理由
- `role` を `enum` にすると、`user.employee?` のように読みやすい判定ができる
- `name` と `role` は業務上必須なので、DB 制約だけでなく model validation でも守る
- Devise には認証の標準部分を任せて、業務アプリ固有の責務だけを自分で足す

## 学んだこと
- Devise の `encrypted_password` が、最初に考えていた `hash 済み password` に相当する
- `null: false` は DB 制約であって、model spec の presence validation とは別
- `enum` は定義時は `employee: 0` のように書くが、`User.roles` の返り値確認では文字列キーを意識する
- `validates` は典型的なルールを短く書ける
- custom validation は複雑な業務ルールが必要になってから考えればよい

## 詰まったこと
- `null false` と書いてしまい、`null: false` の形に直した
- `emplyee` のスペルを `employee` に直した
- `role = { ... }` と変数代入してしまい、`enum :role, { ... }` に直した
- `shoulda-matchers` 設定の `with.test_framework = :rspec` が動かず、メソッド呼び出しの形に直した

## 次にやること
- `User` の登録・ログイン画面を Devise で確認する
- `ExpenseRequest` モデル設計に進む
- role ごとの認可方針を整理する
