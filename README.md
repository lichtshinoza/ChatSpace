# README

 ## messages table

  |Column|Type|Options|
  |------|------|------|
  |string|text|------|
  |image|string|------|
  |group_id|integer|null: false, foreign_key: true|
  |user_id|integer|null: false, foreign_key: true|

 ### Association

 - belongs_to :group
 - belongs_to :user

 ## users table

  |Column|Types|Option|
  |------|------|------|
  |name|string|null: false, index :true, :name, unique: true|
  |email|string|null: false, index :true, :email, unique: true|
  |password|string|null: false|


### Association

 - has_many :messages
 - has_many :groups, through: :members
 - has_many :members

 ## groups table

  |Column|Type|Option|
  |group_name|string|null: false, add_index :groups, :group_name, unique: true|

  ### association

 - has_many :messages

 - has_many :users, through: :members
 - has_many :members

 ## members table (iintermidiate)

 |Column|Type|Option|
 |------|------|------|
 |user_id|integer|null: false, foreign_key: true|
 |group_id|integer|null: false, foreign_key: true|

 ### Association
 - belongs_to :user
 - belongs_to :group
