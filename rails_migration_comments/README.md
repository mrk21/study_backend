# Rails migration comments

## Running this projejct

1. Run `bundle install` command
1. Run `bundle exec rake db:create db:migrate` command
1. Look at `db/schema.rb` file and your database schema

There is also version of MySQL. In that case, please you specify `development_mysql` to the `RAILS_ENV` environment variable.

## Memo

You execute commands shown below in order to look at comments of your database:

### PostgreSQL

You will execute `\d+` command on PostgreSQL CLI:

```
$ psql rails_migration_comments_development
rails_migration_comments_development=# \d+
                                    List of relations
 Schema |       Name        |   Type   | Owner  |    Size    |        Description        
--------+-------------------+----------+--------+------------+---------------------------
 public | configs           | table    | you    | 8192 bytes | application configuration
 public | configs_id_seq    | sequence | you    | 8192 bytes | 
 public | schema_migrations | table    | you    | 16 kB      | 
(3 rows)

rails_migration_comments_development=# \d+ configs
                                                         Table "public.configs"
 Column |       Type        |                      Modifiers                       | Storage  | Stats target |        Description        
--------+-------------------+------------------------------------------------------+----------+--------------+---------------------------
 id     | integer           | not null default nextval('configs_id_seq'::regclass) | plain    |              | application configuration
 name   | character varying |                                                      | extended |              | config name
 value  | integer           |                                                      | plain    |              | config value
Indexes:
    "configs_pkey" PRIMARY KEY, btree (id)
```

### MySQL

You will execute `show table status` and `show full columns` commands on MySQL CLI:

```
$ mysql -uroot rails_migration_comments_development
mysql> show table status like 'configs';
+---------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-----------------+----------+----------------+---------------------------+
| Name    | Engine | Version | Row_format | Rows | Avg_row_length | Data_length | Max_data_length | Index_length | Data_free | Auto_increment | Create_time         | Update_time | Check_time | Collation       | Checksum | Create_options | Comment                   |
+---------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-----------------+----------+----------------+---------------------------+
| configs | InnoDB |      10 | Compact    |    0 |              0 |       16384 |               0 |            0 |         0 |              1 | 2015-05-20 11:11:29 | NULL        | NULL       | utf8_unicode_ci |     NULL |                | application configuration |
+---------+--------+---------+------------+------+----------------+-------------+-----------------+--------------+-----------+----------------+---------------------+-------------+------------+-----------------+----------+----------------+---------------------------+
1 row in set (0.01 sec)

mysql> show full columns from configs;
+-------+--------------+-----------------+------+-----+---------+----------------+---------------------------------+---------------------------+
| Field | Type         | Collation       | Null | Key | Default | Extra          | Privileges                      | Comment                   |
+-------+--------------+-----------------+------+-----+---------+----------------+---------------------------------+---------------------------+
| id    | int(11)      | NULL            | NO   | PRI | NULL    | auto_increment | select,insert,update,references | application configuration |
| name  | varchar(255) | utf8_unicode_ci | YES  |     | NULL    |                | select,insert,update,references | config name               |
| value | int(11)      | NULL            | YES  |     | NULL    |                | select,insert,update,references | config value              |
+-------+--------------+-----------------+------+-----+---------+----------------+---------------------------------+---------------------------+
3 rows in set (0.01 sec)
```

## See

* [pinnymz/migration_comments](https://github.com/pinnymz/migration_comments)
