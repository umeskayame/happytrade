# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| favorite           | text   |                           |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :trades
- has_many :comments


## items テーブル

| Column          | Type         | Options                        |
| ------          | ------       | -----------                    |
| item_name       | string       | null: false                    |
| description     | text         | null: false                    |
| category_id     | integer      | null: false                    |
| status_id       | integer      | null: false                    |
| prefecture_id   | integer      | null: false                    |
| shipping_day_id | integer      | null: false                    |
| wanted_item     | string       | null: false                    |
| user            | references   | null: false, foreign_key: true |


### Association

- has_many :comments
- has_one :trade
- belongs_to :user


## trades テーブル

| Column       | Type       | Options                                    |
| -------      | ---------- | ------------------------------             |
| user         | references | null: false, foreign_key: true             |
| item         | references | null: false, foreign_key: true             |



### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery



## deliveries テーブル

| Column        | Type       | Options                         |
| -------       | ---------- | ------------------------------  |
| trade         | references |  null: false, foreign_key: true |
| postcode      | string     |  null: false                    |
| prefecture_id | integer    |  null: false                    |
| city          | string     |  null: false                    |
| house_number  | string     |  null: false                    |
| building      | string     |                                 |
| phone         | string     |  null: false                    |


### Association
- belongs_to :trade



## comments テーブル

| Column      | Type       | Options                         |
| -------     | ---------- | ------------------------------  |
| user        | references |  null: false, foreign_key: true |
| item        | references |  null: false, foreign_key: true |
| content     | text       |                                 |


### Association

- belongs_to :user
- belongs_to :item