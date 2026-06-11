# 02 Expense Request

## 目的
経費申請の中心となる `ExpenseRequest` モデルの最小構成を設計する。

## やったこと
- `ExpenseRequest` の最小カラムを決めた
- `User` との関連を `belongs_to / has_many` で持つ方針にした
- `status` を `integer + enum` で持つ方針にした
- model validation と model spec を追加した

## カラム一覧
- `user_id` / requester id / `references`
- `title` / request title / `string`
- `description` / purpose / `text`
- `amount` / expense amount / `integer`
- `spent_on` / expense date / `date`
- `status` / workflow status / `integer + enum`
  - `draft` / 下書き
  - `submitted` / 提出済み
  - `approved` / 承認済み
  - `returned` / 差し戻し

## validation
- `user` 必須
- `title` 必須
- `amount` 必須
- `amount greater than 0`
- `spent_on` 必須
- `status` 必須

## Out of Scope
- `comments`
- `file attachments`
- `approval history`
- `multi-step approval`

## 実行したコマンド
```sh
bin/rails generate model ExpenseRequest user:references title:string description:text amount:integer spent_on:date status:integer
bin/rails db:migrate
bundle exec rspec spec/models/expense_request_spec.rb
```

## 書き換えたファイル
- `db/migrate/20260604144532_create_expense_requests.rb`
  - `ExpenseRequest` 用のテーブル定義を追加した
  - `user` 参照に `foreign_key: true` を付けた
  - `title`, `amount`, `spent_on`, `status` に `null: false` を付けた
  - `status` に `default: 0` を付けて初期値を `draft` 想定にした
- `app/models/expense_request.rb`
  - `belongs_to :user` を追加した
  - `enum :status` を追加した
  - `title`, `amount`, `spent_on`, `status` の validation を追加した
  - `amount` に `numericality` を使って `greater_than: 0` を追加した
- `spec/models/expense_request_spec.rb`
  - presence validation の spec を追加した
  - `status` enum の spec を追加した
  - `amount > 0` の spec を追加した

## 変更理由
- 最初は業務フローの中心データだけを持たせて、コメントや添付は後回しにしたかった
- `status` を enum にすると状態遷移や表示条件を読みやすく書ける
- `amount` は円単位で扱う前提なので、まずは `integer` で十分と判断した
- `submitted_at` のような提出日時は、最初の最小版では複雑さを増やすので後回しにした

## 学んだこと
- `references` は `user_id` と関連の土台を Rails らしく作ってくれる
- `foreign_key: true` を付けると DB レベルでも関連の整合性を守りやすい
- `t.timestamps null: false` のように `timestamps` にはカンマを入れない
- `amount > 0` のような条件は `eq` より `valid / invalid` で確認する方が自然
- spec では `Date.new(2026, 4, 11)` のように日付として明示した方が分かりやすい

## 詰まったこと
- migration の `t.timestamps, null: false` で構文エラーになり、`t.timestamps null: false` に直した
- `enum` と `validates` の区切りでカンマが必要だった
- `amount > 0` の spec を最初 `eq` で考えてしまった
- `let` を `it` ブロックの中に置いてしまい、describe 直下へ移動した
- `spent_on` を `2026/04/11` と書いてしまい、日付オブジェクトに直した

## 次にやること
- `ExpenseRequest` の CRUD 設計に進む
- `User` 側に `has_many :expense_requests` を追加する
- request spec / system spec の対象を広げていく
