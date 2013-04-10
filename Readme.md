# Tomdoccery (beta)

## Installation

Add this line to your application's Gemfile:
```
gem 'tomdoccery'
bundle
```

Or install it yourself as:
```
gem install tomdoccery
```

## Usage

Mount it in your config/routes.rb file:
```
require 'tomdoccery/web'
mount Tomdoccery::Web => '/tomdoc'
```
You can use any url.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO
* Switch comment block parsing to use tomparse gem
* Creat CLI
