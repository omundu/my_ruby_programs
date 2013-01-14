simple_rack = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Command line argument you typed was: #{ARGV.first.nil? ? 'No command line input' : ARGV.first}"]] }
puts simple_rack.call({})