# アプリケーション名
「eco share」 

# アプリケーション概要
環境問題やエコに関心があるユーザーが、自分が行っているエコ活動を写真と共に投稿し、他ユーザーと情報を共有できるアプリです。<br>また、他ユーザーの投稿にコメントをすることもできます。

# 本番環境
ログイン情報（テスト用）
- メールアドレス：　maki@maki.com
- パスワード：　maki1234

# 利用方法
1.トップページ上部にある「新規登録」ボタンを押下し、会員情報の登録を行います。<br>
(既に登録済みの場合はトップページ上部にある「ログイン」ボタンを押下し、ログインします。)

2.「投稿する」ボタンを押下し、新規投稿画面に遷移します。

3.新規投稿画面にて、タイトル・エコアピールポイント・画像を入力し、「投稿する」ボタンを押下します。

4.一覧画面には新着順で投稿された画像がタイトルと共に一覧表示されているので、気になる画像をクリックすると、その投稿内容の詳細画面に遷移することができます。

5.投稿内容詳細画面ではコメントをすることも可能です。

6.投稿内容が良いと思ったら、「いいね」する事ができます。また、「いいねを取り消す」で取り消す事もできます。

7.投稿者は自分の投稿内容を編集・削除することができます。

# 製作背景（意図）
「自分が行っているエコ活動を誰かに知ってもらいたい」、「他の人はどんなエコ活動を行っているのか知りたい」、こういった思いを持ったユーザー同士がアプリを利用することで、気軽に情報共有することができればと思いました。<br>
また、身近にできるエコ活動を共有することで、環境問題と聞くと先行してしまう堅苦しいイメージのハードルを下げたいと思いました。<br>
対象性別:男女問わない  理由:エコに関心がある人であれば性別は関係ない為。<br>
対象年齢:20〜30代    理由:昨今では40代以降より20〜30代の若い世代の方がエコへの関心が高い為。<br>

# DEMO

## 新規登録画面
![sign_up.png](./sign_up.png)

- ニックネーム・メールアドレス・パスワード・パスワード（確認用）・プロフィールを入力して、登録するボタンを押下すると新規登録ができます。


## ログイン画面
![sign_in.png](./sign_in.png)

- メールアドレス・パスワードを入力して、ログインボタンを押下するとログインができます。


## 一覧画面
![top_index.jpg](./top_index.jpg)

- ユーザーが投稿した画像とタイトルが一覧で表示されます。
- ユーザーがログインしている場合のみ、タイトル・ユーザー名下の「いいね」が表示されます。


## 投稿詳細画面
![show.jpg](./show.jpg)

- 投稿詳細画面では、一覧画面で表示されていた画像・タイトルの他にシェアしたい内容も表示されます。
- 投稿詳細画面からも「いいね」ができます。
- 「いいね」をすると「いいねを取り消す」ボタンに切り替わり、いいねを取り消す事もできます。


## 編集・削除
![edit_delet.jpg](./edit_delet.jpg)

- 投稿者本人の詳細画面のみに「編集する」・「削除する」ボタンが表示されます。


## ユーザー情報画面
![user_show.png](./user_show.png)

- 新規登録の際に入力したプロフィールの内容が表示されます。


## コメント機能
![comment.jpg](./comment.jpg)

- 他ユーザーの投稿に対してコメントをする事ができます。
- コメントの横にはコメントしたユーザー名が表示されます。



# 要件定義
## ユーザー管理機能
- ユーザーを新しく登録できる<br>
- ユーザー登録が完了している場合、ログインすることができる<br>
- ログアウトできる<br>

## 写真付きメッセージ投稿機能
- テキストと画像を投稿できる<br>
- 投稿内容は投稿後でも編集・削除できる<br>

## コメント機能
- 他ユーザーの投稿内容に対してコメントができる<br>

## いいね機能
- 他ユーザーの投稿内容に対して「いいね」する事ができる<br>
- いいねを取り消す事ができる<br>

# 実装予定の機能
- ユーザー新規登録・ログイン機能<br>
- 写真付きメッセージ投稿機能<br>
- 投稿内容の編集・削除機能<br>
- コメント投稿機能<br>
- いいね機能<br>

# 使用技術（開発環境）

## バックエンド

Ruby, Ruby on Rails

## フロントエンド

HTML/CSS, bootstrap

## データベース

MySQL SequelPro

## インフラ

AWS(EC2)

## ソース管理

GitHub, GitHubDesktop

## テスト
RSpec

## エディタ

VSCode


# テーブル設計

## usersテーブル

| Column              | Type     | Options                  |
| ------------------- | -------- | ------------------------ |
| nickname            | string   | null:false               |
| email               | string   | null:false, unique:true  |
| encrypted_password  | string   | null:false               |
| profile             | text     | null:false               |

### Association

- has_many :shares
- has_many :comments
- has_many :likes


## sharesテーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| title      | string      | null:false                     |
| share      | text        | null:false                     |
| user       | references  | null:false, foreign_key: true  |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes


## commentsテーブル

| Column   | Type        | Options                         |
| -------- | ----------- | ------------------------------- |
| text     | text        | null:false                      |
| user     | references  | null:false, foreign_key: true   |
| share    | references  | null:false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :share


## likesテーブル

| Column   | Type        | Options                          |
| -------- | ----------- | -------------------------------- |
| user     | references  | null:false, foreign_key: true    |
| share    | references  | null:false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :share

