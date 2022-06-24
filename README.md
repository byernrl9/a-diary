# アプリケーション名	

A-diary

# アプリケーション概要

写真とその日の出来事をカレンダー上に投稿して保存できる日記兼アルバムのような役割ができるアプリ

# URL

https://a--diary.herokuapp.com/

# テスト用アカウント

・Basic認証パスワード:4869  

・Basic認証ID:byernrl9  

・メールアドレス:test@test1  
 
・パスワード:test1111

# 利用方法

1.トップページから新規登録を行う 

2.新規登録後にページ遷移したページでアルバムを作成する  

3.作成したアルバムをクリックすると画面中央にカレンダーと画面下部に「make memory」をクリックすると新規投稿画面にページ遷移 

4.新規作成画面の必要な項目入力後、「keep this memory」をクリック

# アプリケーションを作成した背景	

このアプリの作成にあたって、二つ背景がありました。一つは、友人と思い出話を話している時によく「いつ、どこで、どのようなことがあったか」などをよく写真フォルダーの中から、必死に探す手間があったこと。二つ目は、お子さんを持つ友人が子どもの成長記録を上手に残したいという背景がありました。それらの背景から、この課題を解決するために、カレンダー上にその日の出来事や写真などを残し記録できることと、また簡単に探せるように検索機能を実装し、検索ですぐに調べることができるアプリケーションを開発しました。

# 洗い出した要件

[要件定義シート](https://docs.google.com/spreadsheets/d/16BcJjUwgoVK4qFgGmjEyWHllTWIq0K2ayyTXhI0uqmo/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明

・投稿機能
[![Image from Gyazo](https://i.gyazo.com/7bc378c0dbab2130e064606d5249d4ec.gif)](https://gyazo.com/7bc378c0dbab2130e064606d5249d4ec)

# 実装予定の機能	

現在は、見た目の部分を修正中　　

今後はアカウントの共有機能を実装し共有したい家族に作成したアルバムを見れるようにしたい。
それに伴い、見れるアルバムと見れないアルバムを分けるロック機能も実装したい。

カレンダーのレイアウト選択、カレンダーに投稿した複数の投稿を選択して別の白紙のアルバムに纏めれる機能


# データベース設計	

[![Image from Gyazo](https://i.gyazo.com/42cf8439950e626d65c5a0efd810dae4.png)](https://gyazo.com/42cf8439950e626d65c5a0efd810dae4)

<!-- users table -->

| column             | type   | option                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

- has_many :diaries 
- has_many :calendars

<!-- albums table -->

| column             | type        | option                          |
|--------------------|-------------|---------------------------------|
| name               | string      | null: false                     |
| user               |references   |null: false, foreign_key: true   |


has_many :diaries
belongs_to :user

<!-- diaries table -->

| column      | type        | option                          |
|-------------|-------------|---------------------------------|
| title       | string      | null: false                     |
| content     | text        | null: false                     |
| place       | string      | null: false                     | 
|weather_id   |integer      | null: false                     |
| user        |references   | null: false, foreign_key: true  |
| album       |references   | null: false, foreign_key: true  |

belongs_to :user  
belongs_to :calendar


# 画面遷移図	

[![Image from Gyazo](https://i.gyazo.com/09a9050aa834fc44856509737629fedb.png)](https://gyazo.com/09a9050aa834fc44856509737629fedb)

# 開発環境	

・フロントエンド
・バックエンド
・インフラ
・テスト
・テキストエディタ
・タスク管理

# ローカルでの動作方法

以下のコマンドを順に実行
% git clone https://github.com/byernrl9/a-diary.git  

% cd a-diary

% bundle install

% yarn install

# 工夫したポイント

工夫した点は検索機能です。

この検索機能に関しては実際に複数の友人にどの項目で検索することが多いか尋ねた時に、出来事や日時より場所を覚えていることが多いので場所で探すと返ってきたので、場所での検索で投稿が表示されるようにしました。




