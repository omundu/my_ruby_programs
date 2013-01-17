simple_rack = lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Command line argument you typed was: #{env[:argument]}"]] }
puts simple_rack.call({:argument => ARGV.first.nil? ? 'No command line input' : ARGV.first})