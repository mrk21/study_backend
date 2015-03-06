# rails squasher test

## Running this project

1. Run `bundle install` command
1. Run `./bin/squasher 2016` command

The execution result that ran above steps is `db/migrate_after/20150306055703_init_schema.rb`.

**NOTE:** If you used `direnv`, you should not need typing `./bin/` prefix in above steps.

## See

* [jalkoby/squasher](https://github.com/jalkoby/squasher)
* [過去のmigrationをまとめてくれるGem「Squasher」](http://blog.mah-lab.com/2014/07/19/squash-rails-migration/)

## Memo

Squasher uses active record schema dumper, so it should shy away from cases shown below, such as changing primary key and adding limit column options:

The migration file:

```ruby
create_table :user, id: false do |t|
  t.integer :id, primary_key: true
  t.integer :age, limit: 3
  t.string :name, null: false
end
```

The schema file generated from the database set by above migration file:

```ruby
create_table "user", force: :cascade do |t|
  t.integer "age"
  t.string "name", null: false
end
```

The primary key settings and limit column options have been lost.
