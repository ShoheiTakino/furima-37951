# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| lastname           | string | null: false               |
| firstname          | string | null: false               |
| lastname_ja        | string | null: false               |
| firstname_ja       | string | null: false               |
| birthday           | string | null: false               |

### Association
- has_many :items
- has_one :buyer


## itemsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | string     | null: false                    |
| item     | text       | null: false                    |
| content  | text       | null: false                    |
| category | string     | null: false                    |
| status   | string     | null: false                    |
| shipfee  | string     | null: false                    |
| local    | string     | null: false                    |
| date     | string     | null: false                    |
| price    | string     | null: false                    |
| user     | references | null: false, foreign_key: true |


### Association
- has_one :buyer
- belongs_to :user



## buyerテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postalcode | string     | null: false                    |
| province   | string     | null: false                    |
| city       | string     | null: false                    |
| address1   | string     | null: false                    |
| address2   | string     |                                |
| phone      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :users