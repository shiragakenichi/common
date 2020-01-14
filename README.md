# README

## バージョン
  Rails 5.2.4.1
  Ruby 2.5.1
  Haml 5.1.2
  jquery-rails 4.3.5
  mysql2 0.5.2, 0.4.10

## 概要
グループチャットアプリ

## 機能一覧
### ・ユーザー登録機能 : (gem'device')
.googleでのユーザー認証 : (gem 'omniauth'、gem 'omniauth-google-oauth2')テスト環境のみの対応

.Facebookでのユーザー認証 : (gem 'omniauth'、gem 'omniauth-facebook')テスト環境のみの対応

.LINEでのユーザー認証 :（gem 'omniauth'、gem 'omniauth-line'）テスト環境のみの対応

### .ユーザータグ付け機能
ユーザーの興味のあるタグをつけることができる。タグはユーザーでも作成可能で自分にあったタグを作成、紐ずけをすることができる。
タグからユーザーを探すこともできる。
![image](https://user-images.githubusercontent.com/56780590/72309671-fa5a5200-36c2-11ea-9975-9e7f45555da5.png)

![image](https://user-images.githubusercontent.com/56780590/72311293-7b1b4d00-36c7-11ea-9786-90664b9a6021.png)

### ・ユーザー検索機能
ユーザーを名前、性別、都道府県の三段階で検索可能
![image](https://user-images.githubusercontent.com/56780590/72311752-0fd27a80-36c9-11ea-9e0a-b5bc28f8554f.png)



### .友達機能 : 
中間テーブルを使用することによって友達、フォロワー、フォロー、機能を実装、他のユーザーにフォローされる事によって、トップページにユーザーからの申請が表示される。フォローを返してもらう事によって友達に追加される。
![image](https://user-images.githubusercontent.com/56780590/72310421-1232d580-36c5-11ea-8300-0e788c722ef2.png)


### .グループ作成機能 :
 グループを作成することができる。グループは友達のみ招待可能、他のユーザーに招待されたグループのリンクがトップページに表示されるのでそのリンクをクリックする事によって、グループに参加することができる。
 ![image](https://user-images.githubusercontent.com/56780590/72310616-83728880-36c5-11ea-972c-95931cb27588.png)

 ![image](https://user-images.githubusercontent.com/56780590/72310421-1232d580-36c5-11ea-8300-0e788c722ef2.png)


### ・グループメッセージ機能 :
 グループでメッセージ、画像投稿ができる、チャットはajax通信の非同期および自動更新をjqueryにて実装
 ![image](https://user-images.githubusercontent.com/56780590/72309574-a8b1c780-36c2-11ea-8923-9e432e94c147.png)


### .グループアルバム機能 : 
グループのアルバムを作成することができる、アルバムの写真は、一度に複数枚投稿が可能、アルバム作成完了後に、アルバム作成ユーザーのメッセージが作成される、作成されたメッセージはリンクになっている為グループの詳細ページに飛ぶことができる。
![image](https://user-images.githubusercontent.com/56780590/72310799-10b5dd00-36c6-11ea-8256-caf014ef7138.png)

![image](https://user-images.githubusercontent.com/56780590/72310861-3d69f480-36c6-11ea-8ce2-1acb0270bfae.png)

## データベース
 usersテーブル
|Column|Type|Options|
|------|----|-------|
|e-mail|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|image|string|
 Association
- has_many :group-users
- has_many :messages
- has_many :groups,  through:  :groups_users

 groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|user_id|integer|null: false, foreign_key: true|

 Association
- has_many : group-users
- has_many : messages
- has_many : users, through:  :groups_users


 groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

 Association
- belongs_to :group
- belongs_to :user

 messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

 Association
- belongs_to :user
- belongs_to :group












  