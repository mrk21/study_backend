# Rails Pundit

## Starting

### Setup

```sh
$ bundle install
$ bundle exec rake db:create db:migrate
```

### Create a user

```sh
$ bundle exec rails c
> User.create(email: 'admin@example.com', password: 'password', admin: 1)
> User.create(email: 'user@example.com', password: 'password')
```

### Sign in

```sh
$ open http://localhost:3000/users/sign_in
```

You enter the credentials listed below:

* **email**: `user@example.com`
* **password**: `password`

## Refer to

* [elabs/pundit: Minimal authorization through OO design and pure Ruby classes](https://github.com/elabs/pundit)
* [Rubyist Magazine - 権限管理のgem、Punditの紹介](http://magazine.rubyist.net/?0047-IntroductionToPundit)
