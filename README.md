[![Build Status](https://semaphoreci.com/api/v1/projects/305c6445-cd61-4d6f-9166-21ed33313499/514830/badge.svg)](https://semaphoreci.com/michaelrigart/feedalizer)      
 [![Code Climate](https://codeclimate.com/github/michaelrigart/feedalizer/badges/gpa.svg)](https://codeclimate.com/github/michaelrigart/feedalizer) [![Gem Version](https://badge.fury.io/rb/feedalizer.svg)](http://badge.fury.io/rb/feedalizer)

# Feedalizer

Feedalizer is a *small* Ruby library that glues together Oga with the standard RSS library in a way that makes it easy to transform web pages into RSS feeds. If you ask me, it makes it *too* easy.

This gem was originally created by [Christoffer Sawicki](http://qerub.se/feedalizer) who made the last version 0.1.2. During my search for a way to convert web pages to RSS feeds, I came upon this Gem and decided to revive it again. It originally used [Hpricot](https://github.com/hpricot/hpricot) which isn't supported anymore. So I just yanked it out and replaced it with [Oga](https://github.com/YorickPeterse/oga). 

In the process, I made some minor adjustments to the Gem layout.

Christoffer has been so kind to grant me author approval on RubyGems.org so I could make the necessary changes to update this gem.

## Installation

Feedalizer works on Ruby versions >= MRI 1.9.3

Add this line to your application's Gemfile:

```ruby
gem 'feedalizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install feedalizer

## Usage

First of all, see the included examples and take a quick look at the code.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelrigart/feedalizer.

