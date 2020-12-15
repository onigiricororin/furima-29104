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

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| furigana | string | null: false |
| nickname | string | null: false, unique: true |
| birthday | date   | null: false |
| email    | string | null: false, unique: true |
| password | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type        | Options     |
| ------      | ------      | ----------- |
| user        | references  | null: false, foreign_key: true |
| name        | string      | null: false |
| summary     | text        | null: false |
| image       | string      | null: false |
| price       | integer     | null: false |
| category_id  | integer    | null: false |
| condition_id | integer    | null: false |
| burden_id    | integer    | null: false |
| area_id      | integer    | null: false |
| days_to_ship_id | integer | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| order       | references | null: false, foreign_key: true |
| postal_code | string     | null: false      |
| prefecture  | integer    | null: false      |
| city        | string     | null: false      |
| house_number| string     | null: false      |
| building_name| string    | null: false      |
| phone_number | integer   | null: false      |


### Association

- belongs_to :order
