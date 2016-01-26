# Rails Pundit

## Starting

### Setup

```sh
$ bundle install
$ bundle exec rake db:setup
```

### Sign in

```sh
$ bundle exec rails s
$ open http://localhost:3000/users/sign_in
```

You enter the credentials listed below:

**Admin user**

* **email**: `admin@example.com`
* **password**: `password`

**General user**

* **email**: `general@example.com`
* **password**: `password`

## Memo

### pundit_user

> ```ruby
> # Hook method which allows customizing which user is passed to policies and
> # scopes initialized by {#authorize}, {#policy} and {#policy_scope}.
> #
> # @see https://github.com/elabs/pundit#customize-pundit-user
> # @return [Object] the user object to be used with pundit
> def pundit_user
>   current_user
> end
> ```
> https://github.com/elabs/pundit/blob/master/lib/pundit.rb#L273-L280

## Refer to

* [elabs/pundit: Minimal authorization through OO design and pure Ruby classes](https://github.com/elabs/pundit)
* [Rubyist Magazine - 権限管理のgem、Punditの紹介](http://magazine.rubyist.net/?0047-IntroductionToPundit)
