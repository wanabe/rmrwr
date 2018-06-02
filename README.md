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

|                 |   trunk|trunk,--jit|trunk,WITHOUT_RMRWR=1|trunk,--jit,WITHOUT_RMRWR=1|trunk,--disable-gems|trunk,--jit,--disable-gems|trunk,--disable-gems,WITHOUT_RMRWR=1|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|
|:----------------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|
|1_000_000.times  |  33.394|  48.658|  40.072|  41.261|  33.641|  69.216|  39.703|  45.048|
|ary.bsearch      |  1.528M|  1.709M|  1.516M|  1.686M|  1.502M|  1.832M|  1.544M|  1.953M|

### Comparison
|1_000_000.times|||
|:---|:---|:---|
|trunk,--jit,--disable-gems|        69.2 i/s |
|trunk,--jit|        48.7 i/s | 1.42x  slower|
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.0 i/s | 1.54x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|        41.3 i/s | 1.68x  slower|
|trunk,WITHOUT_RMRWR=1|        40.1 i/s | 1.73x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|        39.7 i/s | 1.74x  slower|
|trunk,--disable-gems|        33.6 i/s | 2.06x  slower|
|   trunk|        33.4 i/s | 2.07x  slower|

|ary.bsearch|||
|:---|:---|:---|
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|   1952791.0 i/s |
|trunk,--jit,--disable-gems|   1832116.9 i/s | 1.07x  slower|
|trunk,--jit|   1709273.5 i/s | 1.14x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|   1685527.1 i/s | 1.16x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|   1544009.3 i/s | 1.26x  slower|
|   trunk|   1528402.4 i/s | 1.28x  slower|
|trunk,WITHOUT_RMRWR=1|   1515782.6 i/s | 1.29x  slower|
|trunk,--disable-gems|   1501539.1 i/s | 1.30x  slower|

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rmrwr.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
