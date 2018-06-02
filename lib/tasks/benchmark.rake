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
      envs.each do |env|
        prefix << env
      end
      executable.command = prefix + executable.command
      executable.name += ["", *prefix].join(",")
      @executables << executable
    end
  end
end


task :benchmark do
  Benchmark.driver(output: "rmrwr") do |x|
    x.rbenv_with_env *<<~VERSIONS.scan(/[^ \n].*/)
      trunk
      trunk,--jit
      trunk WITHOUT_RMRWR=1
      trunk,--jit WITHOUT_RMRWR=1
      trunk,--disable-gems
      trunk,--jit,--disable-gems
    VERSIONS
    x.run_duration 10
    x.prelude <<~EOS
      $: << "#{File.expand_path(File.dirname(__FILE__) + "/../")}"
      require "rmrwr" unless ENV["WITHOUT_RMRWR"]
    EOS

    x.report "1_000_000.times", %{ 1_000_000.times do end }
  end
end
