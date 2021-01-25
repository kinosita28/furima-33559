#furima テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false,              |
| first_name          | string  | null: false               |
| last_name           | string  | null: false               |
| k_first             | string  | null: false               |
| k_last              | string  | null: false               |
| birthday            | date    | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type          | Options             |
| ------------ | ------------- | ------------------- |
| product_name | string        | null: false         |
| expalanation | text          | null: false         |
| category_id  | integer       | null: false         |
| state_id     | integer       | null: false         |
| fee_id       | integer       | null: false         |
| area_id      | integer       | null: false         |
| day_id       | integer       | null: false         |
| selling_price| string        | null: false         |
| users        | references    | foreign_key: true   |
| orders       | references    | foreign_key: true   |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| items      | references | foreign_key: true |
| users      | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## domiciles

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | string     | null: false       |    
| prefectures  | string     | null: false       |
| manicipality | string     | null: false       |
| address      | integer    | null: false       |
| buliding     | string     |                   |
| phone_number | integer    | null: false       |
| orders       | references | foreign_key: true |

### Association

- belongs_to :orders
