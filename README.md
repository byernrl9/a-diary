
<!-- users table -->

| column             | type   | option                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

- has_many :diaries 
- has_many :calendars

<!-- calendars table -->

| column             | type        | option                          |
|--------------------|-------------|---------------------------------|
| name               | string      | null: false                     |
| user               |references   |null: false, foreign_key: true   |
| diary              |references   |null: false, foreign_key: true   |

has_many :diaries
belongs_to :user

<!-- diaries table -->

| column    | type   | option      |
|-----------|--------|-------------|
| title     | string | null: false |
| content   | text   | null: false |
| place     | string | null: false | 
|weather_id |integer | null: false |

belongs_to :user
belongs_to :calendar
