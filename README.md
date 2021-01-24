#furima テーブル設計

## users テーブル

| Column     | Type    | Options                   |
| ---------- | ------- | ------------------------- |
| nickname   | string  | null: false               |
| email      | string  | null: false, unique: true |
| password   | string  | null: false, unique: true |
| first_name | string  | null: false, unique: true |
| last_name  | string  | null: false, unique: true |
| k_first    | string  | null: false, unique: true |
| k_last     | string  | null: false, unique: true |
| birthday   | integer | null: false               |


### Association

- has_many :items
- has_one :orders
- has_many :domiciles

## items テーブル

| Column       | Type          | Options             |
| ------------ | ------------- | ------------------- |
| image        | ActiveStorage |                     |
| product_name | text          | null: false         |
| expalanation | enum          | null: false         |
| category     | enum          | null: false         |
| state        | enum          | null: false         |
| delivery_fee | enum          | null: false         |
| area         | enum          | null: false         |
| days         | enum          | null: false         |
| selling_price| string        | null: false         |
| users        | references    | foreign_key: true   |
| orders       | references    | foreign_key: true   |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| id         | integer    | null: false       |
| card_number| integer    | null: false       |
| items      | references | foreign_key: true |
| users      | references | foreign_key: true |

### Association

- has_one :users
- has_one :items

## domiciles

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | integer    | null: false       |    
| prefectures  | string     | null: false       |
| manicipality | string     | null: false       |
| address      | integer    | null: false       |
| buliding     | string     |                   |
| phone_number | integer    | null: false       |
| users        | references | foreign_key: true |
| items        | references | foreign_key: true |
| orders       | references | foreign_key: true |

### Association

- belongs_to :users
- has_one :items
- has_one :orders
