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

|                      |   trunk|trunk,--jit|trunk,WITHOUT_RMRWR=1|trunk,--jit,WITHOUT_RMRWR=1|trunk,--disable-gems|trunk,--jit,--disable-gems|trunk,--disable-gems,WITHOUT_RMRWR=1|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|mjit-inline-send-yield,--jit,--disable-gems|mjit-inline-send-yield,--jit,--disable-gems,WITHOUT_RMRWR=1|
|:---------------------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|:-------|
|Integer#times         |  32.764|  47.841|  40.313|  40.760|  33.869|  72.084|  40.292|  45.590|  87.090|  46.159|
|nested Integer#times  |  33.704|  69.153|  38.730|  40.180|  33.686|  73.969|  40.201|  45.897|  72.552|  45.829|
|Range#each            |  33.610|  42.780|  39.925|  40.718|  33.702|  61.504|  36.116|  45.675|  66.292|  43.612|
|nested Range#each     |  33.510|  57.204|  39.664|  40.007|  33.315|  60.417|  39.706|  45.707|  61.621|  45.402|

### Comparison
|Integer#times|||
|:---|:---|:---|
|mjit-inline-send-yield,--jit,--disable-gems|        87.1 i/s |
|trunk,--jit,--disable-gems|        72.1 i/s | 1.21x  slower|
|trunk,--jit|        47.8 i/s | 1.82x  slower|
|mjit-inline-send-yield,--jit,--disable-gems,WITHOUT_RMRWR=1|        46.2 i/s | 1.89x  slower|
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.6 i/s | 1.91x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|        40.8 i/s | 2.14x  slower|
|trunk,WITHOUT_RMRWR=1|        40.3 i/s | 2.16x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|        40.3 i/s | 2.16x  slower|
|trunk,--disable-gems|        33.9 i/s | 2.57x  slower|
|   trunk|        32.8 i/s | 2.66x  slower|

|nested Integer#times|||
|:---|:---|:---|
|trunk,--jit,--disable-gems|        74.0 i/s |
|mjit-inline-send-yield,--jit,--disable-gems|        72.6 i/s | 1.02x  slower|
|trunk,--jit|        69.2 i/s | 1.07x  slower|
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.9 i/s | 1.61x  slower|
|mjit-inline-send-yield,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.8 i/s | 1.61x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|        40.2 i/s | 1.84x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|        40.2 i/s | 1.84x  slower|
|trunk,WITHOUT_RMRWR=1|        38.7 i/s | 1.91x  slower|
|   trunk|        33.7 i/s | 2.19x  slower|
|trunk,--disable-gems|        33.7 i/s | 2.20x  slower|

|Range#each|||
|:---|:---|:---|
|mjit-inline-send-yield,--jit,--disable-gems|        66.3 i/s |
|trunk,--jit,--disable-gems|        61.5 i/s | 1.08x  slower|
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.7 i/s | 1.45x  slower|
|mjit-inline-send-yield,--jit,--disable-gems,WITHOUT_RMRWR=1|        43.6 i/s | 1.52x  slower|
|trunk,--jit|        42.8 i/s | 1.55x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|        40.7 i/s | 1.63x  slower|
|trunk,WITHOUT_RMRWR=1|        39.9 i/s | 1.66x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|        36.1 i/s | 1.84x  slower|
|trunk,--disable-gems|        33.7 i/s | 1.97x  slower|
|   trunk|        33.6 i/s | 1.97x  slower|

|nested Range#each|||
|:---|:---|:---|
|mjit-inline-send-yield,--jit,--disable-gems|        61.6 i/s |
|trunk,--jit,--disable-gems|        60.4 i/s | 1.02x  slower|
|trunk,--jit|        57.2 i/s | 1.08x  slower|
|trunk,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.7 i/s | 1.35x  slower|
|mjit-inline-send-yield,--jit,--disable-gems,WITHOUT_RMRWR=1|        45.4 i/s | 1.36x  slower|
|trunk,--jit,WITHOUT_RMRWR=1|        40.0 i/s | 1.54x  slower|
|trunk,--disable-gems,WITHOUT_RMRWR=1|        39.7 i/s | 1.55x  slower|
|trunk,WITHOUT_RMRWR=1|        39.7 i/s | 1.55x  slower|
|   trunk|        33.5 i/s | 1.84x  slower|
|trunk,--disable-gems|        33.3 i/s | 1.85x  slower|

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rmrwr.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
