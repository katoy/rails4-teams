
[![Build Status](https://travis-ci.org/katoy/rails4-teams.png?branch=master)](https://travis-ci.org/katoy/rails4-teams)
[![Dependency Status](https://gemnasium.com/katoy/rails4-teams.png)](https://gemnasium.com/katoy/rails4-teams)


準備
=====
    $ rails new teams -t
    $ cd teams
Gemfile を編集して、幾つかの gem を追加する。

その後 gem のインストール、model の作成を行う。

    $ bundle install
    $ rails g model team
    $ rails g model member

db/migrates 以下を編集して team, member の DB 構造を記載する。

team 1: <-> n: member の１対ｎの関係も db/migrate/*, app/models/* で設定する。

また、  
　　チームは必ず１人以上のメンバーが属している事  
を validator で設定する。  

db/seed.rb で次の関係のデータを設定する。

    Team A ---- Abe
            |-- Inoue

    Team B ---- Kato

次のようにして、DB の初期化とデータ内容をチェックする。

    $ bundle exec rake db:drop
    $ bundle exec rake db:reset
    $ rails c
    [1] pry(main)>
    [2] pry(main)> Team.all
    Team Load (2.2ms)  SELECT "teams".* FROM "teams"
    +----+--------+-------------+-------------------------+-------------------------+
    | id | name   | description | created_at              | updated_at              |
    +----+--------+-------------+-------------------------+-------------------------+
    | 1  | Team A |             | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    | 2  | Team B |             | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    +----+--------+-------------+-------------------------+-------------------------+
    2 rows in set

    [3] pry(main)> Member.all
    Member Load (0.2ms)  SELECT "members".* FROM "members"
    +----+------+-----+-------------------+---------+-------------------------+-------------------------+
    | id | name | age | mail              | team_id | created_at              | updated_at              |
    +----+-------+-----+-------------------+---------+-------------------------+-------------------------+
    | 1  | Abe   | 30  | abe@example.com   | 1       | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    | 2  | Inoue | 40  | inoue@example.com | 1       | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    | 3  | Kato  | 30  | kato@example.com  | 2       | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    +----+-------+-----+-------------------+---------+-------------------------+-------------------------+
    3 rows in set

    [4] pry(main)> Team.find(1).members
    Team Load (0.2ms)  SELECT  "teams".* FROM "teams" WHERE "teams"."id" = ? LIMIT 1  [["id", 1]]
    Member Load (0.2ms)  SELECT "members".* FROM "members" WHERE "members"."team_id" = ?  [["team_id", 1]]
    +----+-------+-----+-------------------+---------+-------------------------+-------------------------+
    | id | name  | age | mail              | team_id | created_at              | updated_at              |
    +----+-------+-----+-------------------+---------+-------------------------+-------------------------+
    | 1  | Abe   | 30  | abe@example.com   | 1       | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    | 2  | Inoue | 40  | inoue@example.com | 1       | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    +----+-------+-----+-------------------+---------+-------------------------+-------------------------+
    2 rows in set

    [5] pry(main)> Team.find(2).members
    Team Load (0.1ms)  SELECT  "teams".* FROM "teams" WHERE "teams"."id" = ? LIMIT 1  [["id", 2]]
    Member Load (0.1ms)  SELECT "members".* FROM "members" WHERE "members"."team_id" = ?  [["team_id", 2]]
    +----+------+-----+------------------+---------+-------------------------+-------------------------+
    | id | name | age | mail             | team_id | created_at              | updated_at              |
    +----+------+-----+------------------+---------+-------------------------+-------------------------+
    | 3  | Kato | 30  | kato@example.com | 2       | 2015-12-12 00:08:41 UTC | 2015-12-12 00:08:41 UTC |
    +----+------+-----+------------------+---------+-------------------------+-------------------------+
    1 row in set
    [6] pry(main)>


ER図を生成する。

    $ bundle exec rake erd
    Loading code in search of Active Record models...
    Generating Entity-Relationship Diagram for 2 models...
    Done! Saved diagram to erd.pdf.

![erd.pdf.png](erd.pdf.png)

Form の作成
===========

app/controllers/teams_contloler.rb を作成する。

views/* を作成する。

app/assets/javascripts/teams.coffee を作成する。

チームを編集する際には、次のようなparamsがコントローラに渡ってくる。

```json
{"utf8"=>"✓",
 "_method"=>"patch",
 "authenticity_token"=>"tKW3fTDfPhvhYWr6Fke/SnxBD29d8ql6oNRtZoTFQIR3FvzK7FSL4f/lpbKh5mfxRtiPSDAxQpyq8rgYR3xi6A==",
 "team"=>
  {"name"=>"Team A",
   "description"=>"In China",
   "members_attributes"=>
    {"0"=>{"name"=>"Abe", "age"=>"30", "mail"=>"abe@example.com", "_destroy"=>"1", "id"=>"1"},
     "1"=>{"name"=>"Inoue", "age"=>"40", "mail"=>"inoue@example.com", "_destroy"=>"1", "id"=>"2"},
     "2"=>{"name"=>"zzz", "age"=>"33", "mail"=>"33@com", "_destroy"=>"0", "id"=>"4"},
     "3"=>{"name"=>"yyy", "age"=>"22", "mail"=>"22@com"}}},
 "commit"=>"保存する",
 "controller"=>"teams",
 "action"=>"update",
 "id"=>"1"}
```

削除するメンバーは _destroy => 1 となる。

既存のメンバーの編集なら、 id => ”４” のように member の id が設定される。

新規のメンバーは、id は設定されていない。


# スクリーンショット

* 001 ![001](screenshots/001.png)
* 002 ![002](screenshots/002.png)
* 003 ![003](screenshots/003.png)

See
===
* http://qiita.com/shizuma/items/6f56ca442111ece021b5
Rails ネストした関連先のテーブルもまとめて保存する (accepts_nested_attributes_for、fields_for)
* http://qiita.com/shizuma/items/5bfcf6c1e855b959e135
Rails 複数の子レコードの作成・更新を自在に扱う (accepts_nested_attributes_for)
* https://www.tamurasouko.com/?p=1595
Rails – 親子テーブルを一度に更新する方法
* http://ruby-rails.hatenadiary.com/entry/20141208/1418018874
Railsでaccepts_nested_attributes_forとfields_forを使ってhas_many関連の子レコードを作成/更新するフォームを作成
* http://ruby-rails.hatenadiary.com/entry/20141207/1417926599
Rails4でポリモフィックのリレーションを実装する
