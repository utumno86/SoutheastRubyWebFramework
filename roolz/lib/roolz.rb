require "roolz/version"

module Roolz
  class App
    def call(env)
      [200,
      {'Content-Type' => 'text/html'},
      ["hello from roolz!!!"]]
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
