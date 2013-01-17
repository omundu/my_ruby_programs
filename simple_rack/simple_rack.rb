class SimpleRack
  def call(env)
    env[:argument] ||= "Hello World"
    [200, {"Content-Type" => "text/plain"}, ["Command line argument you typed was: #{env[:argument]}"]]
  end
end