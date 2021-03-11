# furimaデータベース設計

## usersテーブル

<<<<<<< Updated upstream
| Column                | Type    | Options    |
| --------------------- | ------- | ---------- |
| nick_name             | string  | null false |
| email                 | string  | null false |
| password              | string  | null false |
| password_confirmation | string  | null false |
| first_name            | string  | null false |
| last_name             | string  | null false |
| first_name_kana       | string  | null false |
| last_name_kana        | string  | null false |
| birthday              | integer | null false |

### Association

- has_many :items
- has_many :buy_items


## itemsテーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| item_name                | string     | null: false                     |
| item_info                | string     | null: false                     |
| item_category            | string     | null: false                     |
| item-sales-status        | text       | null: false                     |
| item-shipping-fee-status | string     | null: false                     |
| item-prefecture          | string     | null: false                     |
| item-scheduled-delivery  | integer    | null: false                     |
| item_price               | integer    | null: false                     |
| add-tax-price            | integer    | null: false                     |
| profit                   | integer    | null: false                     |
| user                     | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one    :buy_item


## buy_itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

=======
| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------  |
| nick_name             | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| first_name            | string  | null: false               |
| last_name             | string  | null: false               |
| first_name_kana       | string  | null: false               |
| last_name_kana        | string  | null: false               |
| birthday              | date    | null: false               |
 
### Association

- has_many :items
- has_many :buy_items


## itemsテーブル

| Column                 | Type       | Options                         |
| ---------------------- | ---------- | ------------------------------- |
| item_name              | string     | null: false                     |
| item_info              | text       | null: false                     |
| category_id            | integer    | null: false                     |
| sales-status_id        | integer    | null: false                     |
| shipping-fee-status_id | integer    | null: false                     |
| prefecture_id          | integer    | null: false                     |
| scheduled-delivery_id  | integer    | null: false                     |
| item_price             | integer    | null: false                     |
| user                   | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one    :buy_item

## buy_itemsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

>>>>>>> Stashed changes
### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping-address


<<<<<<< Updated upstream
## shipping-addresses

| Column       | Type    | Options       |
| ------------ | ------- | ------------- |
| postal_code  | integer | null: false   |
| prefecture   | string  | null: false   |
| city         | string  | null: false   |
| addresses    | string  | null: false   | 
| building     | string  | null: false   | 
| phone_number | integer | null: false   |
=======
## shipping_addresses

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    | 
| building     | string     |                                | 
| phone_number | string     | null: false                    |
| buy_item     | references | null: false, foreign_key: true |
>>>>>>> Stashed changes

### Association

- belongs_to :buy_item