# Insta-Catchpoint

A simple ruby CLI which enables the quick creation of tests on a given $website when using Catchpoint.

ie. Given www.google.com, created an Object (HTTP) test and a Emluated (Browser) test defined by a set of defaults.

Leverages Catchpoint Pull API with Oauth.

TODO:
* Flesh out creation of tests
** json then push
** Allow for creation of one or many
* Set defaults via YAML?
* Clean up Configurator Module
* Comments, Comments, Comments
* Error handling

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'insta-catchpoint'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install insta-catchpoint

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/praymann/insta-catchpoint/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
