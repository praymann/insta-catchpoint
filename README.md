# Insta-Catchpoint

A simple ruby CLI which enables the quick creation of tests on a given $website when using Catchpoint.

ie. Given www.google.com, create an Object (HTTP) test and a Emluated (Browser) test defined by a set of defaults.

Leverages Catchpoint Pull API with Oauth.

TODO:
* Flesh out creation of tests from a set of defaults, given a url/etc
* Flesh out pushing test to Catchpoint via POST
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

### Below is subject to change given the current developement :)
Help menu:
```ruby
~> insta-catchpoint 
Commands:
  insta-catchpoint add [WEBSITE]              # Add defined default tests for WEBSITE
  insta-catchpoint help [COMMAND]             # Describe available commands or one specific command
  insta-catchpoint pull [IDENTIFIER] [STYLE]  # Pull test that matches/contains/is; output in json, hash, human
  insta-catchpoint pullall [STYLE]              # Pull down ALL tests in Catchpoint; output in json, hash, human

Options:
  [--verbose], [--no-verbose]   
```
Pull (via Id):
```ruby
~> insta-catchpoint pull 65594 human
Name: IE Browser Full
Status: Active
Id: 65594
Type: Web
Monitor: IE
HTTP: GET request
Advanced Settings:
  On_failure: 
    Verify_test = true
  Additional_settings: 
    Capture_filmstrip = true
    Capture_http_headers = Always
    Capture_response_content = On Any Failure
URL(s): http://${randomlist(google.com,yahoo.com,example.com,)}/
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/praymann/insta-catchpoint/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
