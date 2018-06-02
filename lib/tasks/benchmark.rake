require "benchmark_driver"

class BenchmarkDriver::RubyInterface
  def run_duration(sec)
    @config.run_duration = sec
  end

  def rbenv_with_env(*versions)
    versions.each do |version_with_envs|
      version, *envs = version_with_envs.split(" ")
      executable = BenchmarkDriver::Rbenv.parse_spec(version)
      prefix = %w(env)
      name = executable.name
      envs.each do |env|
        prefix << env
        name << "," << env
      end
      executable.command = prefix + executable.command
      executable.name = name
      @executables << executable
    end
  end
end


task :benchmark do
  Benchmark.driver(output: "rmrwr") do |x|
    x.rbenv_with_env *<<~VERSIONS.scan(/[^ \n].*/).select{|v| v !~ /#/}
      trunk
      trunk,--jit
      trunk WITHOUT_RMRWR=1
      trunk,--jit WITHOUT_RMRWR=1
      trunk,--disable-gems
      trunk,--jit,--disable-gems
      trunk,--disable-gems WITHOUT_RMRWR=1
      trunk,--jit,--disable-gems WITHOUT_RMRWR=1
      mjit-inline-send-yield,--jit,--disable-gems
      mjit-inline-send-yield,--jit,--disable-gems  WITHOUT_RMRWR=1
    VERSIONS
    x.run_duration 10
    x.prelude <<~EOS
      $: << "#{File.expand_path(File.dirname(__FILE__) + "/../")}"
      require "rmrwr" unless ENV["WITHOUT_RMRWR"]

      def int_times
        1_000_000.times do end
      end

      def int_times_nest
        1_000.times do
          1_000.times do end
        end
      end

      def range_each
        (1..1_000_000).each do end
      end

      def range_each_nest
        (1..1_000).each do
          (1..1_000).each do end
        end
      end
    EOS

    x.report "Integer#times", %{ int_times }
    x.report "nested Integer#times", %{ int_times_nest }
    x.report "Range#each", %{ range_each }
    x.report "nested Range#each", %{ range_each_nest }
  end
end
