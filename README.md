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

- has_many :item
- has_many :order

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
| selling_price| integer       | null: false         |
| user         | references    | foreign_key: true   |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| item       | references | foreign_key: true |
| user       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :domicile

## domiciles

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal_code  | string     | null: false       |    
| area         | integer    | null: false       |
| manicipality | string     | null: false       |
| address      | string     | null: false       |
| buliding     | string     |                   |
| phone_number | string     | null: false       |
| order        | references | foreign_key: true |

### Association

- belongs_to :orders
