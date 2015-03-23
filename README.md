# Autotolk

This gem makes locales in tolk translate automatically (using bing).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'autotolk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install autotolk

And then:

    $ rails g autotolk:install

And follow the instructions on the screen (you will have to add your bing tokens to make it work).

## Usage

Now when you go to `/tolk/locales/xx` you will see a button `Start autotranslating!`. When you click on it, the translation will be automatic. The text areas will fill out with the translated text, so you could change it if needed and save.

## Issues

If you have any issues with this gem, feel free to add a new issue on Github.

## Todo

TESTS!! :)

## Contributing

1. Fork it ( https://github.com/rajaaa92/autotolk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
