# アプリケーション名
「eco share」 

# アプリケーション概要
環境問題やエコに関心があるユーザーが、自分が行っているエコ活動を写真と共に投稿し、他ユーザーと情報を共有できるアプリです。<br>また、他ユーザーの投稿にコメントをすることもできます。

# 利用方法
1.トップページ上部にある「新規登録」ボタンを押下し、会員情報の登録を行います。<br>
(既に登録済みの場合はトップページ上部にある「ログイン」ボタンを押下し、ログインします。)

2.「投稿する」ボタンを押下し、新規投稿画面に遷移します。

3.新規投稿画面にて、タイトル・エコアピールポイント・画像を入力し、「投稿する」ボタンを押下します。

4.トップ画面には新着順で投稿された画像がタイトルと共に一覧表示されているので、気になる画像をクリックすると、その投稿内容の詳細画面に遷移することができます。

5.投稿内容詳細画面ではコメントをすることも可能です。

6.投稿内容が良いと思ったら、「いいね」する事ができます。また、「いいねを取り消す」を取り消す事もできます。

7.投稿者は自分の投稿内容を編集・削除することができます。

# 製作背景（意図）
「自分が行っているエコ活動を誰かに知ってもらいたい」、「他の人はどんなエコ活動を行っているのか知りたい」、こういった思いを持ったユーザー同士がアプリを利用することで、気軽に情報共有することができればと思いました。<br>
また、身近にできるエコ活動を共有することで、環境問題と聞くと先行してしまう堅苦しいイメージのハードルを下げたいと思いました。<br>
対象性別:男女問わない  理由:エコに関心がある人であれば性別は関係ない為。<br>
対象年齢:20〜30代    理由:昨今では40代以降より20〜30代の若い世代の方がエコへの関心が高い為。<br>

# 要件定義
## ユーザー管理機能
- ユーザーを新しく登録できる<br>
- ユーザー登録が完了している場合、ログインすることができる<br>
- ユーザー登録後にユーザー情報を編集することができる<br>
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

