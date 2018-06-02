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

```
$ bundle exec rake benchmark
Warming up --------------------------------------
     1_000_000.times     33.719 i/s
Calculating -------------------------------------
                          trunk  trunk,--jit  trunk,--disable-gems  trunk,--jit,--disable-gems 
     1_000_000.times     32.479       42.123                31.591                      72.150 i/s -     337.000 times in 10.375782s 8.000376s 10.667680s 4.670809s

Comparison:
                  1_000_000.times
trunk,--jit,--disable-gems:        72.2 i/s 
         trunk,--jit:        42.1 i/s - 1.71x  slower
               trunk:        32.5 i/s - 2.22x  slower
trunk,--disable-gems:        31.6 i/s - 2.28x  slower

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rmrwr.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
