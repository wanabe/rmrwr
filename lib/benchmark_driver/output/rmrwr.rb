class BenchmarkDriver::Output::Rmrwr < BenchmarkDriver::Output::Compare
  def name_length
    40
  end

  src = File.read(BenchmarkDriver::Output::Compare.instance_method(:initialize).source_location[0])
  src.gsub! /^class.*|^end/, ""
  src.gsub! "NAME_LENGTH", "name_length"
  module_eval src
end
