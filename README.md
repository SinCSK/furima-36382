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
has_many :purchases

## itemsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| item_show             | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| shipping_charge_id    | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| day_to_ship_id        | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### アソシエーション
has_one :purchase
belongs_to :user

## shipping_addressesテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building              | string     |                                |
| phone_number          | string     | null: false                    |
| purchase              | references | null: false, foreign_key: true |
| prefecture_id         | integer    | null: false                    |

### アソシエーション
belongs_to :purchase

## purchasesテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### アソシエーション
belongs_to :user
belongs_to :item
has_one :shipping_address