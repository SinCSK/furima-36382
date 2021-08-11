# テーブル設計

## usersテーブル
| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| birth_date            | date    | null: false               |

### アソシエーション
has_many :items
has_many :comments

## itemsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| item_show             | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| shipping_charges_id   | integer    | null: false                    |
| prefectur_id          | integer    | null: false                    |
| days_to_ship_id       | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### アソシエーション
has_many :comments
has_many :credit_cards
has_many :shipping_addresses
belongs_to :user

## commentsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| text                  | text       | null: false                    |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### アソシエーション
belongs_to :user
belongs_to :item

## shipping_addressesテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| city                  | string     | null: false                    |
| addresses             | string     | null: false                    |
| building              | string     |                                |
| phone_number          | string     | null: false                    |
| item                  | references | null: false, foreign_key: true |

### アソシエーション
belongs_to :item