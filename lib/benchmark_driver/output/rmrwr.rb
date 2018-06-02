class BenchmarkDriver::Output::Rmrwr < BenchmarkDriver::Output::Markdown
  def with_benchmark(&block)
    @metrics_by_job = Hash.new { |h, k| h[k] = [] }
    super
    compare_executables
  end
  def report(metrics)
    if defined?(@metrics_by_job)
      @metrics_by_job[@current_job] << metrics
    end
    super
  end
  def with_job(job, &block)
    @current_job = job
    super
  end

  def self.import(klass, meth)
    path, line = klass.instance_method(meth).source_location
    #p [path, line, File.read(path)[/\A(?:.*\n){#{line - 1}}(( *).*\n(?:.*\n)*?\2end\n)/, 1]]
    src = File.read(path)[/\A(?:.*\n){#{line - 1}}(( *).*\n(?:.*\n)*?\2end\n)/, 1]
    yield src if block_given?
    module_eval src, path, line
  end

  def compare_executables
    $stdout.puts "\n## Comparison\n"

    @metrics_by_job.each do |job, metrics|
      $stdout.puts("|%s|||" % job.name, "|:---|:---|:---|")
      results = metrics.map { |metrics| Result.new(job: job, metrics: metrics) }
      show_results(results, show_executable: true)
    end
  end

  import BenchmarkDriver::Output::Compare, :show_results do |src|
    src.sub!(/([^"]*)s: %([^"]*)/) { "|#$1s| %#$2|" }
    src.sub! /slower = "-/, 'slower = "|'
  end

  Result = ::BenchmarkDriver::Struct.new(:job, :metrics)
end
