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
                         1_000_000.times     32.141 i/s
Calculating -------------------------------------
                                          trunk,env  trunk,--jit,env  trunk,env,WITHOUT_RMRWR=1  trunk,--jit,env,WITHOUT_RMRWR=1  trunk,--disable-gems,env  trunk,--jit,--disable-gems,env 
                         1_000_000.times     32.882           44.448                     39.098                           37.965                    32.950                          67.853 i/s -     321.000 times in 9.762163s 7.221858s 8.210086s 8.455069s 9.742078s 4.730806s

Comparison:
                                      1_000_000.times
          trunk,--jit,--disable-gems,env:        67.9 i/s 
                         trunk,--jit,env:        44.4 i/s - 1.53x  slower
               trunk,env,WITHOUT_RMRWR=1:        39.1 i/s - 1.74x  slower
         trunk,--jit,env,WITHOUT_RMRWR=1:        38.0 i/s - 1.79x  slower
                trunk,--disable-gems,env:        32.9 i/s - 2.06x  slower
                               trunk,env:        32.9 i/s - 2.06x  slower

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rmrwr.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
