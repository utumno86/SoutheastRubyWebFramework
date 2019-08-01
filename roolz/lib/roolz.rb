require "roolz/version"

module Roolz
  require "erb"

  class App
    def call(env)
     kl, act = cont_and_act(env)
     text = kl.new(env).send(act)
     [200, {'Content-Type' => 'text/html'}, [text]]
    end

    def cont_and_act(env)
      _, con, act, after = env["PATH_INFO"].split('/')
      con = con.capitalize + "Controller"
      [Object.const_get(con), act]
    end
  end

  class Controller
    attr_reader :env
    def initialize(env)
      @env = env
    end

    def render(name, b = binding())
      template = "app/views/#{name}.html.erb"
      e = ERB.new(File.read template)
      e.result(b)
    end
  end

  class Object
    def self.const_missing(c)
      require Roolz.to_underscore(c.to_s)
      Object.const_get(c)
    end
  end

  def self.to_underscore(s)
    s.gsub(
      /([A-Z]+)([A-Z][a-z])/,
      '\1_\2').gsub(
      /([a-z\d])([A-Z])/,
      '\1_\2').downcase
  end

  class Error < StandardError; end
  # Your code goes here...
end
