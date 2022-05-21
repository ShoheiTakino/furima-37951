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




## Usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name_ja        | string     | null: false                    |
| first_name_ja       | string     | null: false                    |
| birthday            | date       | null: false                    |

### Association
- has_many :orders
- has_many :items

## Itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| content      | text       | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| shipfee_id   | integer    | null: false                    |
| province_id  | integer    | null: false                    |
| ship_day_id  | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- has_one :order
- belongs_to :user

## Odersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## Addresses

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| posta_lcode | string     | null: false                    |
| province_id | integer    | null: false                    |
| city        | string     | null: false                    |
| address1    | string     | null: false                    |
| address2    | string     |                                |
| phone       | string     | null: false                    |
| order       | references | null: false, foreign_key: true |

### Association
- belongs_to :order