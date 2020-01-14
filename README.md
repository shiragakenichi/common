# COMMON README

## バージョン

####  Rails 5.2.4.1
####  Ruby 2.5.1
#### Haml 5.1.2
#### jquery-rails 4.3.5
#### mysql2 0.5.2, 0.4.10

## 概要
グループチャットアプリ

## 機能一覧
### ・ユーザー登録機能 : (gem'device')
.googleでのユーザー認証 : (gem 'omniauth'、gem 'omniauth-google-oauth2')テスト環境のみの対応

.Facebookでのユーザー認証 : (gem 'omniauth'、gem 'omniauth-facebook')テスト環境のみの対応

.LINEでのユーザー認証 :（gem 'omniauth'、gem 'omniauth-line'）テスト環境のみの対応

### .ユーザータグ付け機能
ユーザーの興味のあるタグをつけることができる。タグはユーザーでも作成可能で自分にあったタグを作成、紐ずけをすることができる。
タグからユーザーを探すこともできる。紐ずけられたタグはユーザーの詳細画面でも参照可能

![image](https://user-images.githubusercontent.com/56780590/72316496-b0309b00-36d9-11ea-9a22-f81b93412aa1.png)

![image](https://user-images.githubusercontent.com/56780590/72311293-7b1b4d00-36c7-11ea-9786-90664b9a6021.png)

![image](https://user-images.githubusercontent.com/56780590/72316267-f9341f80-36d8-11ea-95db-931dd83264d7.png)


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

 ![image](https://user-images.githubusercontent.com/56780590/72316418-6f388680-36d9-11ea-8de3-7d15fa0fe396.png)


### .グループアルバム機能 : 
グループのアルバムを作成することができる、アルバムの写真は、一度に複数枚投稿が可能、アルバム作成完了後に、アルバム作成ユーザーのメッセージが作成される、作成されたメッセージはリンクになっている為グループの詳細ページに飛ぶことができる。

![image](https://user-images.githubusercontent.com/56780590/72310799-10b5dd00-36c6-11ea-8256-caf014ef7138.png)

![image](https://user-images.githubusercontent.com/56780590/72316104-5bd8eb80-36d8-11ea-86d2-a65ee2d80154.png)



## データベース

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|e-mail|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|image|string|

 #### Association
- has_one  :profile,dependent: :destroy
- has_many :group-users
- has_many :messages
- has_many :groups,  through:  :groups_users
- has_many :group_users,dependent: :destroy
- has_many :messages
- has_many :alert
- has_many :groups, through: :group_users
- has_many :sns_credentials, dependent: :destroy
- has_many :interest_users,dependent: :destroy
- has_many :interests, through: :interest_users
- has_many :following_relationships, foreign_key"follower_id", class_name: "Relationship", dependent: :destroy
- has_many :followings, through: :following_relationships, source: :follower
- has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many :followers, through: :follower_relationships

###  sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :user

### relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer||
|following_id|integer||

#### Association
- belongs_to :follower, class_name: "User"
- belongs_to :following, class_name: "User"

#### profilesテーブル
|Column|Type|Options|
|------|----|-------|
|introduction|text||
|gender|string||
|prefectures|string||
|birth_year|string||
|birth_month|string||
|birth_day|string||
|user_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :user 

### groupテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|user_id|integer|null: false, foreign_key: true|

#### Association
- has_many : group-users
- has_many : messages
- has_many : users, through:  :groups_users
- has_many :albums
- has_many :alert

### groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :group
- belongs_to :user

### alertsテーブル
|Column|Type|Options|
|------|----|-------|
|message|string||
|efect_id|integer||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :group
- belongs_to :user


### messagesテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
|efect_id|integer|

#### Association
- belongs_to :user
- belongs_to :group

### albumsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|group_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :group
- has_many :images, dependent: :destroy

### imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text||
|album_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :album, optional: true


### interestsテーブル

|Column|Type|Options|
|------|----|-------|
|tag|string||
|image|string||
|imagelist|string||

#### Association
- has_many :interest_users
- has_many :users, through: :interest_users

### interests_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|interest_id|integer|null: false, foreign_key: true|

#### Association
- belongs_to :interest
- belongs_to :user












  