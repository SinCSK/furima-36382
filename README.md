# テーブル設計

## usersテーブル
| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password-confirmation | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_name_kana        | string  | null: false |
| first_name_kana       | string  | null: false |
| birth_date_year       | integer | null: false |
| birth_date_month      | integer | null: false |
| birth_date_day        | integer | null: false |

### アソシエーション
has_many :items
has_many :comments

## itemsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| item_show             | text       | null: false                    |
| category              | string     | null: false                    |
| condition             | string     | null: false                    |
| shipping_charges      | string     | null: false                    |
| delivery_source       | string     | null: false                    |
| days_to_ship          | string     | null: false                    |
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

## credit_cardsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| cred_number           | integer    | null: false                    |
| date_of_expiry_month  | integer    | null: false                    |
| date_of_expiry_year   | integer    | null: false                    |
| security_code         | integer    | null: false                    |
| item                  | references | null: false, foreign_key: true |

### アソシエーション
belongs_to :item
has_many :shipping_addresses

## shipping_addressesテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| prefectur             | string     | null: false                    |
| city                  | string     | null: false                    |
| addresses             | string     | null: false                    |
| building              | string     |                                |
| phone_number          | integer    | null: false                    |
| item                  | references | null: false, foreign_key: true |
| credit_card           | references | null: false, foreign_key: true |

### アソシエーション
belongs_to :item
belongs_to :credit_cards