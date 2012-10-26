# DbnameGenerator

dbname_generator generate dbname from application name, Rails.env, and git branche name.

## Installation

Add this line to your application's Gemfile:

    gem 'dbname_generator', git: "git://github.com/1syo/dbname_generator.git"

And then execute:

    $ bundle

## Usage

Write your config/database.yml

    defaults: &defaults
      adapter: postgresql
      encoding: unicode
      pool: 5
      host: 127.0.0.1
      port: 5432
      username: username
      password: password

    development: &development
      <<: *defaults
      database: <%= Rails.dbname[:development] %>

    test:
      <<: *defaults
      database: <%= Rails.dbname[:test] %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
