# Progress Tracker

## 目的
このファイルは、`rails-expense-workflow` の現在地と残りステップをひと目で確認するための進捗トラッカーです。

## 全体ステップ
1. Rails / Ruby / PostgreSQL の環境構築
2. テスト / lint / セキュリティチェックの土台作成
3. GitHub / CI の整備
4. 認証の土台作成
5. `User` モデルとロール設計
6. `ExpenseRequest` モデル設計
7. `ExpenseRequest` の CRUD 実装
8. 申請ステータス遷移の実装
9. 承認 / 差し戻しフローの実装
10. コメント機能の実装
11. 添付ファイル機能の実装
12. 権限制御の整理
13. 管理者向け一覧 / 管理画面の実装
14. system spec / request spec の拡充
15. UI の整理
16. Docker 対応
17. README / docs の最終整理

## 現在の進捗
- `1. Rails / Ruby / PostgreSQL の環境構築`
  - 完了
- `2. テスト / lint / セキュリティチェックの土台作成`
  - 完了
- `3. GitHub / CI の整備`
  - 完了
- `4. 認証の土台作成`
  - ほぼ完了
  - Devise 導入済み
  - ログイン画面の動作確認はこれから
- `5. User モデルとロール設計`
  - 完了
  - `User` モデル
  - `role` enum
  - model spec
- `6. ExpenseRequest モデル設計`
  - 未着手
- `7. ExpenseRequest の CRUD 実装`
  - 未着手
- `8. 申請ステータス遷移の実装`
  - 未着手
- `9. 承認 / 差し戻しフローの実装`
  - 未着手
- `10. コメント機能の実装`
  - 未着手
- `11. 添付ファイル機能の実装`
  - 未着手
- `12. 権限制御の整理`
  - 未着手
- `13. 管理者向け一覧 / 管理画面の実装`
  - 未着手
- `14. system spec / request spec の拡充`
  - 未着手
- `15. UI の整理`
  - 未着手
- `16. Docker 対応`
  - 未着手
- `17. README / docs の最終整理`
  - 未着手

## 現在地
- 完了した主なもの
  - Ruby 環境の切り替え
  - Rails アプリ生成
  - PostgreSQL 接続確認
  - RSpec / RuboCop / Brakeman / bundler-audit 導入
  - GitHub Actions CI 作成
  - `User` モデルと最初の spec
- いまからやるもの
  - `ExpenseRequest` の設計
  - 状態の持ち方の決定
  - CRUD とワークフロー本体の実装

## 残りステップ数
- 全17ステップ中、完了4、ほぼ完了1、未着手12
- 次の実質的な開始地点は `6. ExpenseRequest モデル設計`

## 次にやること
1. `docs/design/` に `ExpenseRequest` 設計メモを追加する
2. 必要なカラムと関連を決める
3. migration / model / spec をセットで作る
