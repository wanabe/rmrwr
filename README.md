# Rmrwr

Ruby Method Re-implementation With Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rmrwr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rmrwr

## Usage

Just `require`.

## Benchmark

You can `rake benchmark`.

## benchmark results (i/s)

|                     |   trunk|trunk,--jit|trunk,WITHOUT_RMRWR=1|trunk,--jit,WITHOUT_RMRWR=1|trunk,--disable-gems|trunk,--jit,--disable-gems|trunk,--disable-gems,WITHOUT_RMRWR=1|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|
|:--------------------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|
|1_000_000.times      |  33.007|  45.427|  39.373|  40.753|  33.264|  74.723|  39.767|  43.804|
|(1..1_000_000).each  |  33.222|  41.192|  39.281|  40.785|  31.228|  60.986|  39.407|  45.159|

### Comparison
|1_000_000.times|||
|:---|:---|:---|
|trunk,--jit,--disable-gems|        74.7 i/s |
|trunk,--jit|        45.4 i/s | 1.64x  slower|
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|        43.8 i/s | 1.71x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|        40.8 i/s | 1.83x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|        39.8 i/s | 1.88x  slower|
|trunk,WITHOUT_RMRWR=1|        39.4 i/s | 1.90x  slower|
|trunk,--disable-gems|        33.3 i/s | 2.25x  slower|
|   trunk|        33.0 i/s | 2.26x  slower|

|(1..1_000_000).each|||
|:---|:---|:---|
|trunk,--jit,--disable-gems|        61.0 i/s |
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.2 i/s | 1.35x  slower|
|trunk,--jit|        41.2 i/s | 1.48x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|        40.8 i/s | 1.50x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|        39.4 i/s | 1.55x  slower|
|trunk,WITHOUT_RMRWR=1|        39.3 i/s | 1.55x  slower|
|   trunk|        33.2 i/s | 1.84x  slower|
|trunk,--disable-gems|        31.2 i/s | 1.95x  slower|

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rmrwr.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
