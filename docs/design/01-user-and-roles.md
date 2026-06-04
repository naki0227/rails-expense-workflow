# 01 User And Roles

## 目的
経費申請システムの利用者と権限を最小構成で整理する。

## 現時点の方針
- `employee`: 申請を作成する
- `manager`: 承認 / 差し戻しを行う
- `admin`: 全体を管理する

## これから決めること
- `users` テーブルに持たせるカラム
- Devise をどの範囲まで使うか
- ロールを enum にするか、別設計にするか

## メモ
最初は複雑にせず、3 ロールから始める。

## テーブル
users:
    * name / 社員の名前
    * email / 社員のemail　ログイン認証
    * role [employee, manager, admin] / 閲覧や編集権限の分離
    * Deviseが使う認証用カラム / パスワードとかリセット管理