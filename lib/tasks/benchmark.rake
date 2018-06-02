require "benchmark_driver"

class BenchmarkDriver::RubyInterface
  def run_duration(sec)
    @config.run_duration = sec
  end
end

task :benchmark do
  Benchmark.driver do |x|
    x.rbenv *%w(trunk trunk,--jit trunk,--disable-gems trunk,--jit,--disable-gems)
    x.run_duration 10
    x.prelude <<~EOS
      $: << "#{File.expand_path(File.dirname(__FILE__) + "/../")}"
      require "rmrwr"
    EOS

    x.report "1_000_000.times", %{ 1_000_000.times do end }
  end
end
