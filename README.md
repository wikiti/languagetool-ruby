[![Gem Version](https://badge.fury.io/rb/languagetool.svg)](https://badge.fury.io/rb/languagetool)[![Dependency Status](https://gemnasium.com/badges/github.com/wikiti/languagetool-ruby.svg)](https://gemnasium.com/github.com/wikiti/languagetool-ruby)[![CircleCI](https://circleci.com/gh/wikiti/languagetool-ruby.svg?&style=shield&circle-token=30f27cf5467c3b815e1ea6102e551fd4be05ca83)](https://circleci.com/gh/wikiti/languagetool-ruby.svg?&style=shield&circle-token=30f27cf5467c3b815e1ea6102e551fd4be05ca83)

# languagetool

<img src="https://gitlab.com/uploads/project/avatar/1507736/languagetool-ruby.png" width="200">

A simple ruby wrapper for the LanguageTool HTTP API. This gem is only compatible with LanguageTool 3.4 and above.

Please visit the this [link](https://languagetool.org/http-api/swagger-ui/#/default) for more information about the public LanguageTool HTTP API, and its allowed parameters.

This project uses [`jeweler`](https://github.com/technicalpickles/jeweler) for managing and releasing this gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'languagetool'
```

And then execute:

```sh
$ bundle install
```

Or install it yourself as:

```sh
$ gem install languagetool
```

## Usage

First, you need to init the API:

```ruby
require 'languagetool'
api = LanguageTool::API.new # Public LanguageTool API by default
```

Please bear in mind that Ruby uses underscore names (`long_code`), while the LanguageTool API uses camelcase names (`longCode`).

### Available languages

You can retrieve the available languages with `languages` method:

```ruby
languages = api.languages
# Play with the result!
languages.last.name      # English (US)
languages.last.code      # en
languages.last.long_code # en-US
```

### Check

A text can be checked an validated with the `check` method:

```ruby
check = api.check text: 'this ish a invalid text', language: 'en-US'
# Play with the result!
check.software # LanguageTool::Resources::Software
check.language # LanguageTool::Resources::Language
check.matches  # Array of LanguageTool::Resources::Match
```

You can also let the gem try to auto-correct the errors:

```ruby
check.auto_fix # "This is an invalid text."
```

## Error handling

If something went wrong, then the api wrapper will raise an `LanguageTool::APIError` exception. For example:

```ruby
begin
  api.check text: 'Text' # Missing required 'language' parameter. Will raise a LanguageTool::APIError
rescue LanguageTool::APIError => e
  puts e.exception
end
```

## Self-host LanguageTool server

First, create your own LanguageTool server (3.4 or above) by following [this](http://wiki.languagetool.org/http-server) instructions.

Then, use your custom local or remote url in your ruby code:

```ruby
require 'languagetool'
api = LanguageTool::API.new base_uri: 'http://localhost:8081/v2/'
```

## Custom options

The api initialization accepts the following options:

| Name | Description | Default |
| ---- | ----------- | ------- |
| base_uri | Base URI to make the HTTP requests. | https://languagetool.org/api/v2 |

## Authors

This project has been developed by:

| Avatar | Name | Nickname | Email |
| ------- | ------------- | --------- | ------------------ |
| ![](http://www.gravatar.com/avatar/2ae6d81e0605177ba9e17b19f54e6b6c.jpg?s=64)  | Daniel Herzog | Wikiti | [wikiti.doghound@gmail.com](mailto:wikiti.doghound@gmail.com) |
